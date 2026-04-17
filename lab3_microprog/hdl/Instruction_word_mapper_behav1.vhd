--
-- VHDL Architecture TSTE12_lab2_2009.Instruction_word_mapper.behav
--
-- Created:
--          by - kentp.UNKNOWN (KENTSPC)
--          at - 23:42:43 2009-09-11
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
--
-- Combinational block, translating the instruction word control vector
-- into the individual control signals and buses
--
-- This could also be implemented using e.g. alias

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Instruction_word_mapper IS
   PORT( 
      Data                  : IN     std_logic_vector (28 DOWNTO 0);
      Branch_address        : OUT    std_logic_vector (4 DOWNTO 0);
      Branch_control_select : OUT    std_logic_vector (3 DOWNTO 0);
      Read_Size_Y           : OUT    std_logic;
      Read_Size_X           : OUT    std_logic;
      Read_Upper_Left_Y     : OUT    std_logic;
      Read_Upper_Left_X     : OUT    std_logic;
      Load_Size_Y           : OUT    std_logic;
      Load_Size_X           : OUT    std_logic;
      Load_Upper_Left_Y     : OUT    std_logic;
      Load_Upper_Left_X     : OUT    std_logic;
      Set_Horizontal_Pos    : OUT    std_logic;
      Set_Vertical_Pos      : OUT    std_logic;
      Set_Horizontal_Count  : OUT    std_logic;
      Set_Vertical_Count    : OUT    std_logic;
      Next_Horizontal_Pos   : OUT    std_logic;
      Next_Vertical_Pos     : OUT    std_logic;
      Dec_Horizontal_Count  : OUT    std_logic;
      Dec_Vertical_Count    : OUT    std_logic;
      RECT_WR               : OUT    std_logic;
      RECT_RD               : OUT    std_logic;
      Store_RECT_Data       : OUT    std_logic;
      Read_SW17_10          : OUT    std_logic
   );

-- Declarations

END Instruction_word_mapper ;

--
ARCHITECTURE behav OF Instruction_word_mapper IS

BEGIN

  Store_RECT_Data <= Data(28);
  Read_SW17_10 <= Data(27);
  RECT_RD <= Data(26);
  RECT_WR <= Data(25);

  Next_Horizontal_Pos <= Data(24);
  Next_Vertical_Pos <= Data(23);
  Dec_Horizontal_Count <= Data(22);
  Dec_Vertical_Count <= Data(21);  

  Set_Horizontal_Pos <= Data(20);
  Set_Vertical_Pos <= Data(19);
  Set_Horizontal_Count <= Data(18);
  Set_Vertical_Count <= Data(17);

  Load_Upper_Left_X <= Data(16);
  Load_Upper_Left_Y <= Data(15);
  Load_Size_X <= Data(14);
  Load_Size_Y <= Data(13);

  Read_Upper_Left_X <= Data(12);
  Read_Upper_Left_Y <= Data(11);
  Read_Size_X <= Data(10);
  Read_Size_Y <= Data(9);

  Branch_control_select <= Data(8 downto 5);
  Branch_address <= Data(4 downto 0);

END ARCHITECTURE behav;

