--
-- VHDL Architecture TSTE12_lab2_2009.microprogram.behav
--
-- Created:
--          by - kentp.UNKNOWN (KENTSPC)
--          at - 14:07:03 2009-09-13
--
-- using Mentor Graphics HDL Designer(TM) 2008.1 (Build 17)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY microprogram IS
   PORT( 
      Data      : OUT    std_logic_vector (28 DOWNTO 0);
      urom_Addr : IN     std_logic_vector (4 DOWNTO 0 )
   );

-- Declarations

END microprogram ;

--
ARCHITECTURE behav OF microprogram IS

SUBTYPE memword is bit_vector(28 downto 0);
TYPE memarray is array (0 to 31) of memword;

CONSTANT microprogmem : memarray := 
--                LL  RR
--  S             oo  ee
--  t             aa  aa
--  oR    N       dd  dd    jmp
--  re   Ne D S S UU  UU       
--  ea   exDeSeSe ppLLppRR   c
--  Rd   xtecetet ppooppee   o
--  eSRR tVcVtVtV eeaaeeaa   n
--  cWee HeHeHeHe rrddrrdd   d
--  t1cc orororor LLSSLLSS   i
--  D7tt rtrtrtrt eeiieeii   t
--  a--- PPCCPPCC ffzzffzz   i
--  t1RW oonnoonn tteettee   o  branch
--  a0DR ssttsstt XYXYXYXY   n    Addr
( B"0000_00000000_00000000_0000_00000",   -- 0
  B"0000_00000000_00000000_0000_00000",   -- 1
  B"0000_00000000_00000000_0000_00000",   -- 2
  B"0000_00000000_00000000_0000_00000",   -- 3
  B"0000_00000000_00000000_0000_00000",   -- 4
  B"0000_00000000_00000000_0000_00000",   -- 5
  B"0000_00000000_00000000_0000_00000",   -- 6
  B"0000_00000000_00000000_0000_00000",   -- 7
  B"0000_00000000_00000000_0000_00000",   -- 8
  B"0000_00000000_00000000_0000_00000",   -- 9
  B"0000_00000000_00000000_0000_00000",   -- 10
  B"0000_00000000_00000000_0000_00000",   -- 11
  B"0000_00000000_00000000_0000_00000",   -- 12
  B"0000_00000000_00000000_0000_00000",   -- 13
  B"0000_00000000_00000000_0000_00000",   -- 14
  B"0000_00000000_00000000_0000_00000",   -- 15
  B"0000_00000000_00000000_0000_00000",   -- 16
  B"0000_00000000_00000000_0000_00000",   -- 17
  B"0000_00000000_00000000_0000_00000",   -- 18
  B"0000_00000000_00000000_0000_00000",   -- 19
  B"0000_00000000_00000000_0000_00000",   -- 20
  B"0000_00000000_00000000_0000_00000",   -- 21
  B"0000_00000000_00000000_0000_00000",   -- 22
  B"0000_00000000_00000000_0000_00000",   -- 23
  B"0000_00000000_00000000_0000_00000",   -- 24
  B"0000_00000000_00000000_0000_00000",   -- 25
  B"0000_00000000_00000000_0000_00000",   -- 26
  B"0000_00000000_00000000_0000_00000",   -- 27
  B"0000_00000000_00000000_0000_00000",   -- 28
  B"0000_00000000_00000000_0000_00000",   -- 29
  B"0000_00000000_00000000_0000_00000",   -- 30
  B"0000_00000000_00000000_0000_00000");  -- 31
   
  BEGIN

    Memory: process(urom_Addr)
    Variable Address : Integer;
    Variable Data_bits : bit_Vector(28 downto 0);
  begin
    Address := CONV_INTEGER(UNSIGNED("0" & urom_Addr));
    
    Data_bits := microprogmem(Address);
    
    Data <= To_StdLogicVector(Data_bits);
  end process;

END ARCHITECTURE behav;

