library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sas is
    PORT (
        S: in std_logic;
        F: out std_logic;
        clk: in std_logic
    );
end sas;

architecture rtl of sas is
    signal potential: unsigned(7 downto 0) := "00000000";
    signal fd :std_logic;
begin
    process(clk,potential)
    begin
        if ( potential > 160 ) then
            F <= '1';
            fd <= '1';
        else
            F <= '0';
            fd <= '0';
        end if;
        if (rising_edge(clk)) then 
            if fd ='1' then
                potential <= "00000000";
            elsif  ( s = '1') then
                potential <= potential + 100;
            else
                potential <= potential / 2;
            end if;
        end if;
    end process;
end rtl;
