--
-- VHDL Architecture TSTE12_lab2_2009.SRAM_controller.behav
--
-- Created:
--          by - kentp.UNKNOWN (KENTSPC)
--          at - 21:52:53 2009-09-06
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY altera_mf;
USE altera_mf.all;

ENTITY SRAM_controller IS
   PORT( 
      RECT_Address  : IN     std_logic_vector (19 DOWNTO 0);
      RECT_RD       : IN     std_logic;
      RECT_WR       : IN     std_logic;
      Rect_Data_out : IN     std_logic_vector (15 DOWNTO 0);
      VGA_Address   : IN     std_logic_vector (19 DOWNTO 0);
      VGA_RD        : IN     std_logic;
      VGA_lock      : IN     std_logic;
      pll_clk       : IN     std_logic;
      pll_reset_n   : IN     std_logic;
      RD_ACK        : OUT    std_logic;
      Rect_Data_In  : OUT    std_logic_vector (15 DOWNTO 0);
      VGA_data      : OUT    std_logic_vector (15 DOWNTO 0);
      address       : OUT    std_logic_vector (19 DOWNTO 0);
      sram_oe_n     : OUT    std_logic;
      sram_we_n     : OUT    std_logic;
      data          : INOUT  std_logic_vector (15 DOWNTO 0)
   );

-- Declarations

END SRAM_controller ;
