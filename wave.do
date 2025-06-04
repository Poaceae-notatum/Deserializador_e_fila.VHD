onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dui/reset
add wave -noupdate /tb/dui/clock_1
add wave -noupdate /tb/dui/clock_2
add wave -noupdate /tb/dui/bit_in
add wave -noupdate /tb/dui/byte_in
add wave -noupdate /tb/dui/write_in
add wave -noupdate /tb/dui/deq
add wave -noupdate /tb/dui/enq
add wave -noupdate /tb/dui/ack
add wave -noupdate /tb/dui/status_out
add wave -noupdate /tb/dui/data_out_dsrl
add wave -noupdate /tb/dui/data_out_fila
add wave -noupdate /tb/dui/data_ready
add wave -noupdate /tb/dui/len_out
add wave -noupdate /tb/dui/Data
add wave -noupdate /tb/dui/Deserializador/reset
add wave -noupdate /tb/dui/Deserializador/clk_100k
add wave -noupdate /tb/dui/Deserializador/data_in
add wave -noupdate /tb/dui/Deserializador/write_in
add wave -noupdate /tb/dui/Deserializador/ack_in
add wave -noupdate /tb/dui/Deserializador/status_out
add wave -noupdate -radix binary /tb/dui/Deserializador/data_out
add wave -noupdate /tb/dui/Deserializador/data_ready
add wave -noupdate /tb/dui/Deserializador/STATUS
add wave -noupdate /tb/dui/Deserializador/data
add wave -noupdate /tb/dui/Fila/clk
add wave -noupdate /tb/dui/Fila/data_in
add wave -noupdate /tb/dui/Fila/enqueue
add wave -noupdate /tb/dui/Fila/dequeue
add wave -noupdate /tb/dui/Fila/reset
add wave -noupdate /tb/dui/Fila/data_out
add wave -noupdate /tb/dui/Fila/len_out
add wave -noupdate -expand /tb/dui/Fila/modulo
add wave -noupdate /tb/dui/Fila/start
add wave -noupdate /tb/dui/Fila/fim
add wave -noupdate /tb/dui/Fila/tam
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10000 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 213
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
WaveRestoreZoom {0 ns} {13365 ns}
