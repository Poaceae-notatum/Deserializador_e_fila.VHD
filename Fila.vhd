library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity fila is PORT(
clk    : in STD_LOGIC;                             -- clock deve entrar a 10 Khz --
data_in    : in STD_LOGIC_VECTOR (7 downto 0);     -- valor de entrada na fila --
enqueue    : in STD_LOGIC;                         -- entra valor caso borda de subida --
dequeue    : in STD_LOGIC;                         -- sai caso borda de subida --
reset    : in STD_LOGIC;                         -- zera a fila --

data_out : out STD_LOGIC_VECTOR (7 downto 0);    -- valor saindo sendo ele o a mais tempo na fila --
len_out     : out STD_LOGIC_VECTOR (3 downto 0)    -- numero de elementos na fila --
);
end entity;

architecture fila of fila is
    type modu is array (7 downto 0) of std_logic_vector(7 downto 0);
    signal modulo     : modu;
    signal start      : integer := 0;
    signal fim        : integer := 0; -- 0 a 7 e retorna a 0
    signal tam        : integer := 0; -- 0 a 8
    begin
    main: process (clk)
    

        begin
        if(rising_edge(clk)) then 
            if(rising_edge(dequeue)) then
                if(tam /= 0) then
                   data_out <= modulo(start)(7 downto 0);
                   tam <= tam - 1;
                   if (start = 7) then
                    start <= 0;
                   else
                    start <= start + 1;
                   end if;
                end if;
            end if;
            if(rising_edge(enqueue)) then
                if (tam < 8) then
                    modulo(fim) <= data_in;
                    tam <= tam + 1;
                    if (fim = 7) then
                        fim <= 0;
                    else
                        fim <= fim + 1;
                    end if;
                end if;
            end if;
len_out <= std_logic_vector(to_unsigned(tam, 4));
        end if;
    end process;
end architecture;
