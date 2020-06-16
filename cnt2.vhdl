--Laboratorio de sistemas digitales
--Jaime Andres Ramirez Stanford
--A00825248
--Contador de 2 bits
entity cnt2 is
port(clk: in bit; q, qn: out bit_vector(1 downto 0));
end cnt2;
architecture behavior of cnt2 is
component jk
port(clk, en, j, k: in bit; q, qn: out bit);
end component;
signal qaux0, qaux1: bit;
begin
q(0) <= qaux0;
q(1) <= qaux1;
uut1: jk port map (clk, '1','1','1', qaux0, qn(0));
uut2: jk port map (clk, '1','1','1', qaux1, qn(1));
end behavior;