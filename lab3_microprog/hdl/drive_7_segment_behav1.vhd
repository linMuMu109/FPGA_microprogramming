--
-- VHDL Architecture TSTE12_lab2_2009.drive_7_segment.behav
--
-- Created:
--          by - kentp.UNKNOWN (KENTSPC)
--          at - 01:00:27 2009-09-09
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY drive_7_segment IS
   PORT( 
      input_value   : IN     std_logic_vector (3 DOWNTO 0);
      seven_7_digit : OUT    std_logic_vector (6 DOWNTO 0)
   );

-- Declarations

END drive_7_segment ;

--
ARCHITECTURE behav OF drive_7_segment IS
BEGIN
  
    with input_value select
      seven_7_digit(6 downto 0) <= "1000000" when "0000",
                                   "1111001" when "0001",
                                   "0100100" when "0010",
                                   "0110000" when "0011",
                                   "0011001" when "0100",
                                   "0010010" when "0101",
                                   "0000010" when "0110",
                                   "1111000" when "0111",
                                   "0000000" when "1000",
                                   "0010000" when "1001",
                                   "0001000" when "1010",
                                   "0000011" when "1011",
                                   "1000110" when "1100",
                                   "0100001" when "1101",
                                   "0000110" when "1110",
                                   "0001110" when others;
  
END ARCHITECTURE behav;

