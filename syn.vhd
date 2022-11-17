library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity syn is
    PORT (
        S: in std_logic;
        F: out std_logic;
        clk: in std_logic
    );
end syn;

architecture rtl of syn is
    signal potential: unsigned(7 downto 0) := "00000000";
begin
    process(clk)
    begin
        F<='0';
        if (rising_edge(clk)) then
            if ( s = '1') then
                potential <= potential + 100;
            else
                potential <= potential / 2;
            end if;
            if ( potential > 160 ) then
                F <= '1';
            else
                F <= '0';
            end if;
        end if;
    end process;
end rtl;
