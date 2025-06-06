library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end entity;
architecture tb of tb is

    signal reset         : std_logic := '0';
    signal clock         : std_logic := '0';
    signal bit_in        : std_logic := '0';
    signal write_in      : std_logic := '0';
    signal dequeue       : std_logic := '0';


begin
dui : entity work.TOP port map
    (
    clock => clock,
    bit_in => bit_in,
    reset => reset,
    write_in => write_in,
    deq => dequeue

    );
clk_process : process
        begin
            while true loop
                clock <= not clock;
                wait for 100 ns / 2;
            end loop;
        end process;
teste: process
begin
for i in 0 to 190 loop -- enche a fila com 8 instancias de numeros "aleatorios"
    bit_in      <= not bit_in;
    write_in <= '1';
    dequeue     <= '0';
    wait for 1000 ns;
end loop;

dequeue <= '1';
wait for 80000 ns; -- dequeue na fila inteira
dequeue <= '0';

for i in 0 to 7 loop
    for i in 0 to 6 loop 
        bit_in      <= '0';
        write_in <= '1';
        dequeue     <= '0';
        wait for 1000 ns;
    end loop;
    bit_in      <= '1';
    write_in <= '1';
    dequeue     <= '1';
    wait for 10000 ns;
end loop;

dequeue <= '1';
wait for 80000 ns; -- dequeue na fila inteira
dequeue <= '0';

reset <= '1';
--wait for 1000 ns;
--reset <='0';
wait;
end process;
end architecture;
