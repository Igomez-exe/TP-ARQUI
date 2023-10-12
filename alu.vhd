library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity ALU is 
    Port (
        A, B: in std_logic_vector(31 downto 0);
        Control: in std_logic_vector(2 downto 0);
        Result: out std_logic_vector(31 downto 0);
        Zero: out std_logic
    );
end ALU;

architecture Behavioral of ALU is

begin
    process (A, B, Control)
    begin
        case Control is
            when "000" => 
                Result <= A and B;    -- and
            when "001" => 
                Result <= A or B;     -- or
            when "010" => 
                Result <= A + B;      -- suma
            when "110" => 
                Result <= A - B;      -- resta
            when "111" => 
                if A < B then         -- A es menor que B?
                    Result <= x"00000001";
                else
                    Result <= x"00000000";
                end if;
            when "100" => 
                Result <= B(31 downto 0) & "0"; -- desplazamiento
            when others =>
                Result <= (others => '0');
        end case;
    

        if Result = "00000000000000000000000000000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end Behavioral;