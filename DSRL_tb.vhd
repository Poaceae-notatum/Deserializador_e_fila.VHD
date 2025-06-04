library IEEE;
use IEEE.std_logic_1164.all;

entity DSRL_tb is
end entity;
architecture tb of DSRL_tb is
	
	signal reset 		: std_logic := '0';
	signal clock_100k	: std_logic := '0';
 	signal bit_in 		: std_logic := '0';
	signal write_in		: std_logic := '0';
	signal ack		: std_logic := '0';

begin
dui : entity work.deserializador port map
	(
	clk_100k => clock_100k,
	data_in => bit_in,
	reset => reset,
	write_in => write_in,
	ack_in => ack
	);
clk_100k_process : process
        begin
            while true loop
                clock_100k <= not clock_100k;
                wait for 1000 ns / 2;
            end loop;
        end process;
teste: process
begin

bit_in <= '1';
write_in <= '1';
wait for 1000 ns;

bit_in <= '0';
write_in <= '1';
wait for 1000 ns;

bit_in <= '1';
write_in <= '1';
wait for 1000 ns;

bit_in <= '0';
write_in <= '1';
wait for 1000 ns;

bit_in <= '0';
write_in <= '1';
wait for 1000 ns;

bit_in <= '1';
write_in <= '0';
wait for 1000 ns;
 
bit_in <= '1';
write_in <= '1';
wait for 1000 ns;

bit_in <= '0';
write_in <= '1';
wait for 1000 ns;

bit_in <= '1';
write_in <= '1';
wait for 1000 ns;

bit_in <= '1';
write_in <= '0';
wait for 1000 ns;

bit_in <= '1';
write_in <= '1';
wait for 1000 ns;

bit_in <= '0';
write_in <= '0';
ack <= '1';
wait for 1000 ns;
ack <= '0';
wait;
end process;
end architecture;
