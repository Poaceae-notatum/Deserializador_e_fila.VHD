library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;
architecture tb of tb is
	
	signal reset 		: std_logic := '0';
	signal clock		: std_logic := '0';
	signal clock_100k	: std_logic := '0';
	signal clock_10k	: std_logic := '0';
 	signal bit_in 		: std_logic := '0';
	signal byte_in		: std_logic_vector(7 downto 0) := (others => '0');
	signal write_in		: std_logic := '0';
	signal dequeue		: std_logic := '0';
	signal enqueue		: std_logic := '0';
	signal ack		: std_logic := '0';

begin
dui : entity work.top port map
	(
	clock_1 => clock_100k,
	clock_2 => clock_10k,
	bit_in => bit_in,
	byte_in => byte_in,
	reset => reset,
	write_in => write_in,
	ack => ack,
	enq => enqueue,
	deq => dequeue
	
	);
clk_10k_process : process
        begin
            while true loop
                clock_10k <= not clock_10k;
                wait for 10000 ns / 2;
            end loop;
        end process;
clk_100k_process : process
        begin
            while true loop
                clock_100k <= not clock_100k;
                wait for 1000 ns / 2;
            end loop;
        end process;
teste: process
begin

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '0';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '0';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '0';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '0';
write_in <= '1';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '1';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '0';
enqueue	 <= '0';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '1';
dequeue	 <= '0';
ack	 <= '0';
wait for 1000 ns;

bit_in 	 <= '1';
write_in <= '1';
enqueue	 <= '1';
dequeue	 <= '0';
ack	 <= '1';
wait for 1000 ns;
end process;
end architecture;
