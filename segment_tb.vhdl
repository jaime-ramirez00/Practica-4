library IEEE;
use IEEE.std_logic_1164.all;
entity segment_tb is
end segment_tb;
architecture behavior of segment_tb is 
component segment
port(clk : in bit; b1,b2,b3,b4, dec_in : in bit_vector(3 downto 0); d1,d2,d3,d4: out bit_vector(6 downto 0));
end component;
signal clk : bit := '0';
signal b1,b2,b3,b4, dec_in : bit_vector(3 downto 0):= (others => '0');
signal d1,d2,d3,d4 : bit_vector(6 downto 0):= (others => '0'); 
begin
uut: segment port map(clk, b1,b2,b3,b4,dec_in, d1,d2,d3,d4);
clk_process :process
begin
clk <= '0';
wait for 5 ns;
clk <= '1';
wait for 5 ns;
end process;
process
begin

b1 <= "0001";
b2 <= "0010";
b3 <= "0100";
b4 <= "1000";
dec_in<="1000";
wait for 50 ns;
end process;
end behavior;