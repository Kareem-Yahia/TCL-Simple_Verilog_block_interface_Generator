puts "**** Writing Verilog Block Interface ****"

set modname "Up_Dn_Counter"

set in_ports [list IN Load Up Down CLK Reset]
set in_ports_width [list 4 1 1 1 1 1]

set out_ports [list High Counter Low]
set out_ports_width [list 1 4 1]

set File_Data ""

append File_Data "module $modname (\n"
# for inputs
for {set a 0} {$a < [llength $in_ports]} {incr a} {
if {[lindex $in_ports_width $a] == 1 } {
append File_Data "input [lindex $in_ports $a],\n"
} else {
set temp [expr [lindex $in_ports_width $a] - 1]
append File_Data "input \[$temp:0] [lindex $in_ports $a],\n"
}
}

#for outputs 

for {set a 0} {$a < [llength $out_ports]} {incr a} {

#here we make condition at last word
if {$a == [expr [llength $out_ports] - 1] } {

if {[lindex $out_ports_width $a] == 1 } {
append File_Data "output [lindex $out_ports $a]\n);"
} else {
set temp [expr [lindex $out_ports_width $a] - 1]
append File_Data "output \[$temp:0] [lindex $out_ports $a]\n);"
}

# condition before last word
} else {

if {[lindex $out_ports_width $a] == 1 } {
append File_Data "output [lindex $out_ports $a],\n"
} else {
set temp [expr [lindex $out_ports_width $a] - 1]
append File_Data "output \[$temp:0] [lindex $out_ports $a],\n"

}
}

}
#here we print data
puts $File_Data
#here we make .v file with data
set fh [open $modname.v w+]
puts $fh $File_Data
close $fh