onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/reset
add wave -noupdate /tb/clock
add wave -noupdate /tb/dui/clock_100k
add wave -noupdate /tb/dui/clock_10k
add wave -noupdate /tb/bit_in
add wave -noupdate /tb/write_in
add wave -noupdate -radix unsigned -expand /tb/dui/Data
add wave -noupdate -radix unsigned /tb/dui/Data
add wave -noupdate /tb/dui/data_ready
add wave -noupdate /tb/dui/Deserializador/STATUS
add wave -noupdate /tb/dui/ack
add wave -noupdate /tb/dui/status_out
add wave -noupdate /tb/dequeue
add wave -noupdate /tb/dui/Fila/enqueue
add wave -noupdate -radix unsigned /tb/dui/Fila/data_out
add wave -noupdate -radix unsigned -childformat {{/tb/dui/Fila/modulo(7) -radix unsigned} {/tb/dui/Fila/modulo(6) -radix unsigned} {/tb/dui/Fila/modulo(5) -radix unsigned} {/tb/dui/Fila/modulo(4) -radix unsigned} {/tb/dui/Fila/modulo(3) -radix unsigned} {/tb/dui/Fila/modulo(2) -radix unsigned} {/tb/dui/Fila/modulo(1) -radix unsigned} {/tb/dui/Fila/modulo(0) -radix unsigned}} -expand -subitemconfig {/tb/dui/Fila/modulo(7) {-radix unsigned} /tb/dui/Fila/modulo(6) {-radix unsigned} /tb/dui/Fila/modulo(5) {-radix unsigned} /tb/dui/Fila/modulo(4) {-radix unsigned} /tb/dui/Fila/modulo(3) {-radix unsigned} /tb/dui/Fila/modulo(2) {-radix unsigned} /tb/dui/Fila/modulo(1) {-radix unsigned} /tb/dui/Fila/modulo(0) {-radix unsigned}} /tb/dui/Fila/modulo
add wave -noupdate /tb/dui/Fila/start
add wave -noupdate /tb/dui/Fila/fim
add wave -noupdate /tb/dui/len_out
add wave -noupdate /tb/dui/Fila/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {160000 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {150061 ns} {212618 ns}
