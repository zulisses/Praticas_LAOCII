transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica4/parte1 {D:/Faculdade/LAOC II/pratica4/parte1/mesi.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica4/parte1 {D:/Faculdade/LAOC II/pratica4/parte1/mesiEmissor.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica4/parte1 {D:/Faculdade/LAOC II/pratica4/parte1/mesiReceptor.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica4/parte1 {D:/Faculdade/LAOC II/pratica4/parte1/decodificadorComportamentali.v}

