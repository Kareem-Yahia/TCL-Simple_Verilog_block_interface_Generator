module Up_Dn_Counter (
input [3:0] IN,
input Load,
input Up,
input Down,
input CLK,
input Reset,
output High,
output [3:0] Counter,
output Low
);
