--Laboratorio de sistemas digitales
--Jaime Andres Ramirez Stanford
--A00825248
--Componente de practica 4
library IEEE;
use IEEE.std_logic_1164.all;
entity display is
port (enable, dec_in: in bit; dec_out: out bit; bcd: in bit_vector(3 downto 0); led: out bit_vector(6 downto 0));
end  display;
architecture behavior of display is
begin
process(bcd, enable, dec_in)
begin
if enable='1' then
case bcd is
when "0000" => led <= "0111111";      
when "0001" => led <= "0000110"; 
when "0010" => led <= "1011011"; 
when "0011" => led <= "1001111"; 
when "0100" => led <= "1100110"; 
when "0101" => led <= "1101101"; 
when "0110" => led <= "1111101";  
when "0111" => led <= "0000111"; 
when "1000" => led <= "1111111";     
when "1001" => led <= "1101111";
when others => null;
dec_out<=dec_in;
end case;
end if;
end process;
end behavior;