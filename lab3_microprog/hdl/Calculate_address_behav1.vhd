--
-- VHDL Architecture TSTE12_lab2_2009.Calculate_address.behav
--
-- Created:
--          by - kentp.UNKNOWN (KENTSPC)
--          at - 13:58:25 2009-09-13
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Calculate_address IS
   PORT( 
      Horiz_pos_val : IN     std_logic_vector (14 DOWNTO 0);
      Vert_pos_val  : IN     std_logic_vector (14 DOWNTO 0);
      RECT_Address  : OUT    std_logic_vector (19 DOWNTO 0)
   );

-- Declarations

END Calculate_address ;

--
ARCHITECTURE behav OF Calculate_address IS

  CONSTANT Horiz_Length : UNSIGNED(14 downto 0) := CONV_UNSIGNED(1024,15);
  SIGNAL Total_product : UNSIGNED(29 downto 0);

BEGIN
   
  Total_product <= UNSIGNED(Horiz_pos_val) + (Horiz_Length * UNSIGNED(Vert_pos_val));
  RECT_Address <= std_logic_vector(Total_product(19 downto 0));
  
END ARCHITECTURE behav;

