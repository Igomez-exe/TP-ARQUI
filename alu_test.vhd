library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity tb_alu is
end tb_alu;

architecture behavior of tb_alu is

    component ALU
    Port (
        A, B: in std_logic_vector(31 downto 0);
        Control: in std_logic_vector(2 downto 0);
        Result: out std_logic_vector(31 downto 0);
        Zero: out std_logic
    );
    end component;
    
    SIGNAL A : std_logic_vector(31 DOWNTO 0);
    SIGNAL B : std_logic_vector(31 downto 0);
    SIGNAL Control : std_logic_vector(2 downto 0) := "000";
    SIGNAL Result : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL Zero : STD_LOGIC;

BEGIN
    uut : ALU
    PORT MAP(
        A => A,
        B => B,
        Control => Control,
        Result => Result,
        Zero => Zero
    );

    tb : PROCESS
    BEGIN
        A <= x"00010b00";
        B <= x"000A1c00";
        Control <= "000";
        wait for 20 ns;
        Control <= "001";
        wait for 20 ns;
        Control <= "010";
        wait for 20 ns;
        Control <= "110";
        wait for 20 ns;
        Control <= "111";
        wait for 20 ns;
        Control <= "101";
        wait for 20 ns;
        Control <= "100";
        wait for 20 ns;
        A <= x"000000d5";
        B <= x"00000002";
        wait;

    END PROCESS;

end behavior; 