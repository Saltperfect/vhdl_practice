library ieee;
use ieee.std_logic_1164.all;

entity seq_dec is
port( clk : in std_logic;
 reset : in std_logic;
 din: in std_logic;
 dout : out std_logic);
end seq_dec;

architecture behav of seq_dec is


begin 
type state is (st1, st2, st3, st4);
signal  next, current :  state; 
syncronous_process : process (clk, reset)
begin 
if rising_edge(clk) then 
    if reset = '1' then 
        current = st1;
    else 
        current = next;
    end if;
end if;
end proccess;
state_detector : process (current , din)
begin
st1 <= st1;
case(current) is
when st1 => 
if din = '0' then
next <= st1;
else 
next <= st2;
end if;
when st2 => 
if din = '0' then 
next <= st3;
else 
next <= st2;
end if;
when st3 =>
if din = '1' then 
next <= st4;
else 
next <= st1;
end if;
when st4 =>
if din = '0' then
next <= st1;
else 
next <= st2;
end if;
when others =>
next <= st1;
end case;
end process;
output_detector : process(current)
begin
case (current) is
when st1 =>
dout <= '0';
when st2 => 
dout <= '0';
when st3 => 
dout <= '0';
when st4 =>
dout <= '1'
end case;
end process;

end behav;
