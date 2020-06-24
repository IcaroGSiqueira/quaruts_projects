-- lane_g_matrix.vhd
--
-- arithmetic for 3x3 matrix of Sobel filter
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 03.01.2018

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lane_g_matrix is
  port ( clk       : in  std_logic;
         reset     : in  std_logic;
         in_p1a    : in  std_logic_vector(11 downto 0);
         in_p2     : in  std_logic_vector(11 downto 0);
         in_p1b    : in  std_logic_vector(11 downto 0);
         in_m1a    : in  std_logic_vector(11 downto 0);
         in_m2     : in  std_logic_vector(11 downto 0);
         in_m1b    : in  std_logic_vector(11 downto 0);
         data_out  : out integer range 0 to 268435456);
end lane_g_matrix;

architecture behave of lane_g_matrix is
	signal   lum_p1a      : integer range  0 to  4095;
	signal   lum_p2       : integer range  0 to  4095;
	signal   lum_p1b      : integer range  0 to  4095;
	signal   lum_m1a      : integer range  0 to  4095;
	signal   lum_m2       : integer range  0 to  4095;
	signal   lum_m1b      : integer range  0 to  4095;
	signal   sum          : integer range -16383 to 16383;

begin

process
begin
   wait until rising_edge(clk);
	
	 lum_p1a   <= to_integer(unsigned(in_p1a(11 downto 0)));		--  plus 1
    lum_p2    <= to_integer(unsigned(in_p2(11 downto 0)));     --  plus 2
    lum_p1b   <= to_integer(unsigned(in_p1b(11 downto 0)));		--  plus 1
    lum_m1a   <= to_integer(unsigned(in_m1a(11 downto 0)));		-- minus 1
    lum_m2    <= to_integer(unsigned(in_m2(11 downto 0)));		-- minus 2
    lum_m1b   <= to_integer(unsigned(in_m1b(11 downto 0)));    -- minus 1
	 
    -- add values according to sobel matrix
    --         |-1  0  1|      | 1  2  1|
    --         |-2  0  2|  or  | 0  0  0|
    --         |-1  0  1|      |-1 -2 -1|
    sum   <=  lum_p1a + 2*lum_p2 + lum_p1b - lum_m1a - 2*lum_m2 - lum_m1b;

    -- square of sum
    data_out <= sum*sum;

end process;

end behave;
