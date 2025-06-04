library IEEE;
use IEEE.std_logic_1164.all;

entity top is port(
reset	   	: in STD_LOGIC;
clock_1    	: in STD_LOGIC;
clock_2    	: in STD_LOGIC;
bit_in 	   	: in std_logic;
byte_in	   	: in std_logic_vector(7 downto 0);
write_in   	: in std_logic;
deq	   	: in std_logic;
enq	   	: in std_logic;
ack	   	: in std_logic;
status_out 	: out std_logic;
data_out_dsrl	: out std_logic_vector(7 downto 0);
data_out_fila	: out std_logic_vector(7 downto 0);
data_ready	: out std_logic;
len_out		: out std_logic_vector(3 downto 0)
);
end entity;

architecture top of top is
signal Data: STD_LOGIC_VECTOR(7 downto 0);
begin
Deserializador : entity work.deserializador port map
	(
		reset => reset,
		data_in => bit_in,
		write_in => write_in,
		clk_100k => clock_1,
		ack_in => ack,
		status_out => status_out,
		data_out => Data,
		data_ready => data_ready	
		
	);
Fila : entity work.fila port map
	(
		
		clk => clock_2,
		reset =>  reset,
		enqueue => enq,
		dequeue => deq,
		data_in => Data,
		data_out => data_out_fila,
		len_out => len_out
	);

end architecture;
