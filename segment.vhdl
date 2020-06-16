library IEEE;
use IEEE.std_logic_1164.all;
entity segment is
port(clk : in bit; b1,b2,b3,b4, dec_in : in bit_vector(3 downto 0); d1,d2,d3,d4: out bit_vector(6 downto 0));
end segment;
architecture behavior of segment is
component display is
port (enable, dec_in: in bit; dec_out: out bit; bcd: in bit_vector(3 downto 0); led: out bit_vector(6 downto 0));
end  component;
component cnt2 is
port(clk: in bit; q, qn: out bit_vector(1 downto 0));
end component;
signal q, qn: bit_vector(1 downto 0);
signal din, dout: bit;
signal bcd: bit_vector(3 downto 0);
signal led: bit_vector(6 downto 0);
begin
uut1: display port map('1', din, dout, bcd, led);
uut2: cnt2 port map(clk, q,qn);
process(q)
begin
if clk'event and clk ='1' then
case q is
when "00"=>
din<=dec_in(0);
bcd(0)<=b1(0);
bcd(1)<=b1(1);
bcd(2)<=b1(2);
bcd(3)<=b1(3);
d1(0)<=led(0);
d1(1)<=led(1);
d1(2)<=led(2);
d1(3)<=led(3);
d1(4)<=led(4);
d1(5)<=led(5);
d1(6)<=led(6);
d2<="0000000";
d3<="0000000";
d4<="0000000";
when "10"=>
din<=dec_in(1);
bcd(0)<=b2(0);
bcd(1)<=b2(1);
bcd(2)<=b2(2);
bcd(3)<=b2(3);
d2(0)<=led(0);
d2(1)<=led(1);
d2(2)<=led(2);
d2(3)<=led(3);
d2(4)<=led(4);
d2(5)<=led(5);
d2(6)<=led(6);
d1<="0000000";
d3<="0000000";
d4<="0000000";
when "01"=>
din<=dec_in(2);
bcd(0)<=b3(0);
bcd(1)<=b3(1);
bcd(2)<=b3(2);
bcd(3)<=b3(3);
d3(0)<=led(0);
d3(1)<=led(1);
d3(2)<=led(2);
d3(3)<=led(3);
d3(4)<=led(4);
d3(5)<=led(5);
d3(6)<=led(6);
d1<="0000000";
d2<="0000000";
d4<="0000000";
when "11"=>
din<=dec_in(3);
bcd(0)<=b4(0);
bcd(1)<=b4(1);
bcd(2)<=b4(2);
bcd(3)<=b4(3);
d4(0)<=led(0);
d4(1)<=led(1);
d4(2)<=led(2);
d4(3)<=led(3);
d4(4)<=led(4);
d4(5)<=led(5);
d4(6)<=led(6);
d2<="0000000";
d3<="0000000";
d1<="0000000";
end case;
end if;
end process;
end behavior;