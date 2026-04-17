--
-- VHDL Architecture TSTE12_lab2_DE2_115.SRAM_image_model.behav
--
-- Created:
--          by - kentp.es_usr (kentslaptop.isy.liu.se)
--          at - 12:59:12 05/23/12
--
-- using Mentor Graphics HDL Designer(TM) 2010.3 (Build 21)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY SRAM_image_model IS
  port(
    SRAM_ADDR : in std_logic_vector(19 DOWNTO 0);
    SRAM_CE_N : in std_logic;
    SRAM_LB_N : in std_logic;
    SRAM_OE_N : in std_logic;
    SRAM_UB_N : in std_logic;
    SRAM_WE_N : in std_logic;
    SRAM_DQ   : inout std_logic_vector(15 downto 0));
END ENTITY SRAM_image_model;

--
ARCHITECTURE behav OF SRAM_image_model IS
BEGIN
  
  process(SRAM_ADDR,SRAM_CE_N,SRAM_LB_N,SRAM_OE_N,SRAM_UB_N,SRAM_WE_N,SRAM_DQ)
  
    function ROM_contents(SRAM_ADDR : std_logic_vector(19 downto 0)) return std_logic_vector is
    variable address:unsigned(19 downto 0);
    begin
      address := unsigned(SRAM_ADDR);
      -- use RLL encoding....
      -- outer box
      if SRAM_ADDR(19 downto 10) = "0000000000" or
         SRAM_ADDR(19 downto 10) = "1011111111" or
         SRAM_ADDR(9 downto 0) = "0000000000" or
         SRAM_ADDR(9 downto 0) = "1111111111" then
        return "1111111111100000"; -- yellow
      -- next box
      elsif SRAM_ADDR(19 downto 10) = "0000000001" or
            SRAM_ADDR(19 downto 10) = "1011111110" or
            SRAM_ADDR(9 downto 0) = "0000000001" or
            SRAM_ADDR(9 downto 0) = "1111111110" then
        return "1111110000000000"; -- red
      --
      elsif SRAM_ADDR(19 downto 10) = "0000000010" or
            SRAM_ADDR(19 downto 10) = "1011111101" or
            SRAM_ADDR(9 downto 0) = "0000000010" or
            SRAM_ADDR(9 downto 0) = "1111111101" then
        return "0000000000011111"; -- blue
      --
      elsif SRAM_ADDR(19 downto 10) = "0000000011" or
            SRAM_ADDR(19 downto 10) = "1011111100" or
            SRAM_ADDR(9 downto 0) = "0000000011" or
            SRAM_ADDR(9 downto 0) = "1111111100" then
        return "0000001111100000"; -- green
      else
        return "1111111111111111";
      end if;
    end;

    variable rom_data:std_logic_vector(15 downto 0);
        
  begin
    IF SRAM_CE_N = '0' then
      if SRAM_OE_N = '0' then
        SRAM_DQ <= (others => 'Z') after 6 ns;
        rom_data:= ROM_contents(SRAM_ADDR); 
        if SRAM_UB_N = '0' then
          SRAM_DQ(15 downto 8) <= rom_data(15 downto 8) after 5 ns;
        end if;
        if SRAM_LB_N = '0' then
          SRAM_DQ(7 downto 0) <= rom_data(7 downto 0) after 5 ns;
        end if;
      else
        SRAM_DQ <= (others => 'Z') after 5 ns;
      end if;
    else
      SRAM_DQ <= (others => 'Z') after 5 ns;
    end if;
  end process;
  
END ARCHITECTURE behav;

