---------------------------------------------------------------------
-- TITLE: Random Access Memory for Xilinx
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 11/06/05
-- FILENAME: ram_xilinx.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the RAM for Spartan 3 Xilinx FPGA
--
--    Compile the MIPS C and assembly code into "test.axf".
--    Run convert.exe to change "test.axf" to "code.txt" which
--    will contain the hex values of the opcodes.
--    Next run "ram_image ram_xilinx.vhd code.txt ram_image.vhd",
--    to create the "ram_image.vhd" file that will have the opcodes
--    correctly placed inside the INIT_00 => strings.
--    Then include ram_image.vhd in the simulation/synthesis.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ram is
   generic(memory_type : string := "DEFAULT");
   port(clk               : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
begin

   RAMB16_S9_inst0 : RAMB16_S9
   generic map (
INIT_00 => X"afafafafafafafafafafafafafafafaf2308000c241400ac273c243c243c273c",
INIT_01 => X"8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f230c008c8c3caf00af00af2340afaf",
INIT_02 => X"acacacac0003373cac038cac8cac8cac8c243c40034040033423038f038f8f8f",
INIT_03 => X"000300ac0300000034038c8c8c8c8c8c8c8c8c8c8c8c3403acacacacacacacac",
INIT_04 => X"3c24008f248f8f03273c0103001424a00024241428302424a18f248f8f03273c",
INIT_05 => X"8f0003008fafafafafafaf2703273c0103001424a024000000000000003424a1",
INIT_06 => X"1002343c1002343c3c1002343c8f3c108f02343c2403008f8f008f0003008f00",
INIT_07 => X"008f008f00038c000000008f02363c00142e3c102e3c102e102e3c1002343c3c",
INIT_08 => X"363c2703248f8f8f8f8f8f008f2403008f008f00038c8f0000028f0200002403",
INIT_09 => X"0000008f02363c148f2e020000000000002403008f008f00038c020000008f02",
INIT_0A => X"8f00038c020000008f02363c2e148f2e02000000002403008f8f008f00038c02",
INIT_0B => X"000000002403008f008f00038c000000008f02363c02108f02002403028f8f00",
INIT_0C => X"0000002403008f8f008f00038c000000008f02363c108f0034023c0000000000",
INIT_0D => X"00002403008f8f008f00038c020000008f0234003c2e148f02343c0200000000",
INIT_0E => X"8f008f00038c000000008f02362e108f2403008f8f00108f2e02000000000000",
INIT_0F => X"34003c108f2403008f8f00148f0034023c00000000000000000000002403008f",
INIT_10 => X"8f8f3c108f2403008f8f0210008f022403008f8f008f00038c000000008f8f02",
INIT_11 => X"ac001030008c343c000000108f000203008f24afafaf2703273c2e108f240300",
INIT_12 => X"828f2403008f001424108f822603008f00102414008000afafaf2703273c0003",
INIT_13 => X"26032424148f2c30022400afafafaf2703273c2703008f8f24148f822603008f",
INIT_14 => X"8f0003008fafaf2703273c30038c343c2403008f03273c27038f8f8f00168f24",
INIT_15 => X"666574746f647520207374206c2000696d206420206c203a002703008f8c3c10",
INIT_16 => X"6e0074656e6e73657365660074660074747674656574006e74656e7373006600",
INIT_17 => X"0000000000000000000000000000746e74656e73797379667966747474740074",
INIT_18 => X"0000000000000000000080000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(31 downto 24),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(31 downto 24),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(3));

   RAMB16_S9_inst1 : RAMB16_S9
   generic map (
INIT_00 => X"b8afaeadacabaaa9a8a7a6a5a4a3a2a1bd000000a560a4a0bd1d8404a5059c1c",
INIT_01 => X"b9b8afaeadacabaaa9a8a7a6a5a4a3a2a1a50086c6c406bb00bb00ba5a1abfb9",
INIT_02 => X"9392919000405a1a06e0a606a606a606a6a50584e0029b401bbd60bb60bbbabf",
INIT_03 => X"00e000c4e0000085a2e09f9d9c9e979695949392919002e09f9d9c9e97969594",
INIT_04 => X"02468082498382999c1c00e004c3c6c2e5070740a28563460082488382999c1c",
INIT_05 => X"bc80200099bcb0b1b2b3bfbd999c1c20e040c8c6c363a36402020200a7476820",
INIT_06 => X"40424202404242021040424202930240bc517103842000998400bc4020009900",
INIT_07 => X"009900bc00204453101000995010101240421040421040424042024042420210",
INIT_08 => X"1010bd2004b0b1b2b3bf9900bc0420009900bc00204499531250bc0310100420",
INIT_09 => X"1010009950101040bc42430362037071100420009900bc002044331010009950",
INIT_0A => X"bc10204433101000995010104240bc424303707110842000998400bc00204433",
INIT_0B => X"036410100420009900bc00204453101000995010105100bc2211842030998400",
INIT_0C => X"641010842000998400bc002044531010009950101060bc726342030243025043",
INIT_0D => X"7110842000998400bc0020443310100099024212024240bc4242024202504303",
INIT_0E => X"8400bc002044531010009950104200bc84200099840040bc4243036403620370",
INIT_0F => X"42120200bc84200099840060bc72634203024402430250430364101084200099",
INIT_10 => X"99840200bc8420009984500000bc11842000998400bc00204453101000999302",
INIT_11 => X"a40040420062a30500005000bc100020009910bcb0bfbd999c1c4200bc842000",
INIT_12 => X"04bc0420009900820280bc041020009900000280008480bcb0bfbd999c1c00e0",
INIT_13 => X"1020646440996243111080bcb0b1bfbd999c1cbde000b0bf0280bc0410200099",
INIT_14 => X"bc00200099bcbfbd999c1c42e062630304200099999c1cbde0b0b1bf0002bc02",
INIT_15 => X"6f0068776e20737400616800696d006f690072680069622000bde000bf620340",
INIT_16 => X"690065690074656569656900656f00656865776e6c6500690069006569006900",
INIT_17 => X"000000000000000000000000000079697969746500690069006f796879770065",
INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(23 downto 16),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(23 downto 16),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(2));

   RAMB16_S9_inst2 : RAMB16_S9
   generic map (
INIT_00 => X"00000000000000000000000000000000ff00000200ff18000e000e000c008c00",
INIT_01 => X"000000000000000000000000000000000000022000002000d800d800ff700000",
INIT_02 => X"0000000000000010000000000000000000010060006060000000000000000000",
INIT_03 => X"0000000000201000000000000000000000000000000000000000000000000000",
INIT_04 => X"cc0c28800c8080e08900100021ffff001000000000000c0c00800c8080e08a00",
INIT_05 => X"0090f80080000000000000ffe08900100028ffff000018182018101000cc0c00",
INIT_06 => X"0010420000102d01550010e1058000010010ca3b0af8008080000020f8008000",
INIT_07 => X"0080000000f800101080808000cccc100000510000100003004e0a0010860043",
INIT_08 => X"17d1000000000000000080000000f80080000000f800801010900080801800f8",
INIT_09 => X"88818080004d100000039019181018181900f80080000000f800108883808000",
INIT_0A => X"0081f800108881808000855100ff000090181818190af8008080000000f80010",
INIT_0B => X"11181a2000f80080000000f800101085808000ca6b90ff0088100af888808000",
INIT_0C => X"181a200af8008080000000f800101084808000de430000184290001110181010",
INIT_0D => X"18190af8008080000000f8001088818080005a810a4eff001086009011101011",
INIT_0E => X"80000000f8001010868080003b4eff000af800808000ff000390191820181018",
INIT_0F => X"4b8201fe000af800808000fe00184290001210201018101011181a200af80080",
INIT_10 => X"808000fe000af800808090fe8000000af8008080000000f80010108180808000",
INIT_11 => X"0010ff0000000020000080ff001020f8008000000000ffe0830000fe000af800",
INIT_12 => X"000000f8008000ff0000000000f8008000000000000080000000ffe083000000",
INIT_13 => X"fff800000080000010008800000000ffe08200000010000000ff000000f80080",
INIT_14 => X"0000f800800000ffe08100000000002000000080e08200000000000000ff00ff",
INIT_15 => X"7500726f65006168006e6f006f69006e6c006575006f690000000000000020ff",
INIT_16 => X"6e0065670065766e786e66006575006569006500656e006e0067007678007600",
INIT_17 => X"0b0b0b0b0b0b0b0a0a0a0a0a0000006e00677976007800660072006900650065",
INIT_18 => X"090a02020b0000000000000000000b0b0b0b0b0b0b0b0b0a0b0b0b0b0b0b0b0b",
INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000008",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(15 downto 8),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(15 downto 8),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(1));

   RAMB16_S9_inst3 : RAMB16_S9
   generic map (
INIT_00 => X"4c4844403c3834302c2824201c181410980e002604fd2a009800b00084004001",
INIT_01 => X"504c4844403c3834302c2824201c18141000892410200060125c1058fc005450",
INIT_02 => X"0c08040000083c0048080c440840043c006000000800000801681360115c5854",
INIT_03 => X"00080c000810121900082c2824201c1814100c08040000082c2824201c181410",
INIT_04 => X"cc99211890181821e801210802f7ff00213730020a0f9ba308189c1818214001",
INIT_05 => X"102109003010181c202428d0217c01210821f5ff00302321c040c21019cd8f0a",
INIT_06 => X"ac2b400f8f2b0031e6fc2b00f52c042d102b009aa009003c1800102109003c00",
INIT_07 => X"004000100009502180c2103c19cdcc801814eb68646250e836207cc72ba0011b",
INIT_08 => X"59b730080a181c2024284000100d09004000100009003c218023102140c02009",
INIT_09 => X"8082103c19d362e510e8230021802123c0200900400010000950218042103c19",
INIT_0A => X"10000900218042103c191feb149c106423c02123c0e009003c18001000090021",
INIT_0B => X"802300c0200900400010000950218082103c196b5f2384102180b009213c1800",
INIT_0C => X"2300c0c809003c180010000900218082103c19831b8b102b3f230fc021802123",
INIT_0D => X"23c0b009003c1800100009002180c2103c19c5427c203d102ba0012380212380",
INIT_0E => X"180010000900218042103c1989201510d409003c18001c10e823402180218021",
INIT_0F => X"834231dc10bc09003c1800e3102b3f230f00218021802123802300c0b009003c",
INIT_10 => X"3c1801c510bc09003c1823be121018a409003c1800100009002180c2103c2c19",
INIT_11 => X"0021fc0200002000000021f91040210900340310181ce021a80164c710d40900",
INIT_12 => X"00100d09004000f70a1110000109004000190a0b00002110181ce02138010008",
INIT_13 => X"fc09573002400a0f061c2110181c20d8218c01200821181c0af1100001090040",
INIT_14 => X"10000900381018e021ec01010800200049080040211c012808181c2000f410fc",
INIT_15 => X"7200650000006e6f006475006e6c00206c00646e006e6c0000200800180000fa",
INIT_16 => X"65006e6800656500740074006e72006e72006c00760000650068006500006500",
INIT_17 => X"2c282018100c04fcf4f0ecc400000065006800650074007400740072006e006e",
INIT_18 => X"0840c458d0000000000000000000c0b8b0a8a098908828c47c70645c54483c34",
INIT_19 => X"00000000000000000000000000000000000000000000000000000000000000e0",
INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO   => data_read(7 downto 0),
      DOP  => open, 
      ADDR => address(12 downto 2),
      CLK  => clk, 
      DI   => data_write(7 downto 0),
      DIP  => ZERO(0 downto 0),
      EN   => enable,
      SSR  => ZERO(0),
      WE   => write_byte_enable(0));

end; --architecture logic
