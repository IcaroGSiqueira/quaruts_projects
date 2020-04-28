transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/icaro/quartus_projects/trabalho1/meally_abc/meally_abc.vhd}

vcom -93 -work work {/home/icaro/quartus_projects/trabalho1/meally_abc/tb_meally_abc.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiiils -L rtl_work -L work -voptargs="+acc"  tb_meally_abc

add wave *
view structure
view signals
run -all
