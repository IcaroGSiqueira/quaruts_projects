transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/icaro/git_repo/quaruts_projects/trabalho1/moore_abc/moore_abc.vhd}

vcom -93 -work work {/home/icaro/git_repo/quaruts_projects/trabalho1/moore_abc/tb_moore_abc.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiiils -L rtl_work -L work -voptargs="+acc"  tb_moore_abc

add wave *
view structure
view signals
run -all
