library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is port(
reset           : in STD_LOGIC;
clock        : in STD_LOGIC;
bit_in            : in std_logic;
write_in       : in std_logic;
deq           : in std_logic;
status_out     : out std_logic
);
end entity;

architecture top of top is
signal Data: STD_LOGIC_VECTOR(7 downto 0);
signal ack : STD_LOGIC := '0';
signal data_ready : STD_LOGIC;
signal len_out : STD_LOGIC_VECTOR(3 downto 0);
signal clock_100k : STD_LOGIC := '0';
signal clock_10k  : STD_LOGIC := '1';
signal enqueue	: STD_LOGIC := '0';
begin

clk_10k_process : process(clock)
 variable counter : integer := 0;
        begin
            if( rising_edge(clock)) then
              if(counter < 50) then
		counter := counter + 1;
	      else
		  clock_10k <= not clock_10k;
                counter := 1;
            end if;
	 end if;
        end process;
clk_100k_process : process(clock)
 variable counter : integer := 0;
        begin
            if( rising_edge(clock)) then
              if(counter < 5) then
		counter := counter + 1;
	      else
		  clock_100k <= not clock_100k;
                counter := 1;
            end if;
	 end if;
        end process;
top : process (clock_100k, clock_10k)
variable size : integer := 0;
begin
if(rising_edge(clock_100k)) then
	if data_ready = '1' then
	enqueue <= '1';
	else 
	 ack <= '0';
	 enqueue <= '0';
	end if;
	
end if;
if (rising_edge(clock_10k)) then
	if((enqueue = '1' and size < 8) or (deq = '1' and enqueue = '1')) then
    	 ack <= '1';
	end if;
end if;
size := to_integer(unsigned(len_out));
end process;
Deserializador : entity work.deserializador port map
    (
        reset => reset,
        data_in => bit_in,
        write_in => write_in,
        clk_100k => clock_100k,
        ack_in => ack,
        status_out => status_out,
        data_out => Data,
        data_ready => data_ready    
        
    );
Fila : entity work.fila port map
    (
        
        clk => clock_10k,
        reset =>  reset,
        enqueue => enqueue,
        dequeue => deq,
        data_in => Data,
        len_out => len_out
    );


end architecture;
