
library IEEE;
use IEEE.std_logic_1164.all;

entity Deserializador is PORT(
reset 		: in STD_LOGIC; -- reset
clk_100k	: in STD_LOGIC; -- clock inicial 1m hz vira 100k hz
data_in		: in STD_LOGIC; -- bit que ele vai receber 
write_in	: in STD_LOGIC; -- alto quando ele precisa salvar o data_in
ack_in		: in STD_LOGIC; -- 

status_out	: out STD_LOGIC; --alto se esta livre para receber dados
data_out	: out STD_LOGIC_VECTOR(7 downto 0);
data_ready	: out STD_LOGIC -- alto quando ele estiver cheio
);
end entity;

architecture DSRL of Deserializador is

	SIGNAL STATUS      : STD_LOGIC := '0';
	SIGNAL data	   : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

-- STATUS "0" pronto para receber bit
-- STATUS "1" ragistrador cheio, enviando outputs
begin
      main: process(clk_100k, reset)
	variable counter : integer := 0;
	   begin
	if (rising_edge(reset)) then
		 data_ready <= '0';
		 data <= "00000000";
		 STATUS <= '0';
		 status_out <= '0';
		 counter := 0;
		 data_out <= "00000000";
	    elsif (rising_edge(clk_100k)) then
	     if (STATUS = '0') then
		status_out <= '0';
		data_ready <= '0';
	       if (write_in = '1') then
		if (counter < 7) then
		 data(counter) <= data_in;
		 counter := counter + 1;
		elsif (counter >= 7) then
		 data(counter) <= data_in;
		 STATUS <= '1';
		 counter := 0;
		 status_out <= '1';
		end if;
		 data_out <= data;
	       end if;
	      elsif ( STATUS = '1') then
		data_ready <= '1';
		data_out <= data(7 downto 0);
	       if (ack_in = '1') then
		data_ready <= '0';
		data <= "00000000";
		STATUS <= '0';
		status_out <= '0';
		data_out <=  "00000000";
	       end if;
	      end if;
		
	  end if; --if do clock
	end process;
end architecture;