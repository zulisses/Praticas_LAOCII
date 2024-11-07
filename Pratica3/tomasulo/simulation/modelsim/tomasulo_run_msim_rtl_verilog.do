transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/bancoReg.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/tomasulo.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/filaInstrucoes.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/estacaoReserva.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/mem.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/memoria.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/CDBArbiter.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/unidadeFuncional.v}
vlog -vlog01compat -work work +incdir+D:/Faculdade/LAOC\ II/pratica3/tomasulo {D:/Faculdade/LAOC II/pratica3/tomasulo/decodificadorComportamental.v}

