library IEEE;
use IEEE.std_logic_1164.all;

entity Fila_tb is
end entity;
architecture tb of Fila_tb is
	
	signal reset 		: std_logic := '0';
	signal clock_10k	: std_logic := '0';
	signal byte_in		: std_logic_vector(7 downto 0) := (others => '0');
	signal dequeue		: std_logic := '0';
	signal enqueue		: std_logic := '0';

begin
dui : entity work.fila port map
	(
	clk 	=> clock_10k,
	data_in => byte_in,
	reset 	=> reset,
	enqueue => enqueue,
	dequeue => dequeue
	
	);
clk_10k_process : process
        begin
            while true loop
                clock_10k <= not clock_10k;
                wait for 10000 ns / 2;
            end loop;
        end process;
teste : process
begin
byte_in <= "00110011";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00000011";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00000111";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00001000";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00010001";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00110011";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "10110011";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00111011";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

byte_in <= "00110111";
enqueue <= '1';
dequeue <= '0';
wait for 9000 ns;
enqueue <= '0';
wait for 1000 ns;

dequeue <= '1';
wait for 9000 ns;
dequeue <= '0';
wait for 1000 ns;

dequeue <= '1';
wait for 9000 ns;
dequeue <= '0';
wait for 1000 ns;

dequeue <= '1';
wait for 9000 ns;
dequeue <= '0';
wait for 1000 ns;

dequeue <= '1';
wait for 9000 ns;
dequeue <= '0';
wait for 1000 ns;

dequeue <= '1';
wait for 9000 ns;
dequeue <= '0';
wait for 1000 ns;

end process;
end architecture;