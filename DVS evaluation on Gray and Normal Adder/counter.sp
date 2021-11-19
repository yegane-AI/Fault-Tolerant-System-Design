*********4 bit counter *********
.LIB 'PTM HP V2.1 45nm.l'	45nm

*******PARAMETERS*******
.param 	vmain=5v

******INPUTS******
Vbb		VDDb 	0		vmain 

****clock***
*					   *PULSE	vmin vmax delay	rise-time  fall-time pulse-width  period
Vc0		c0		0		PULSE 	5	0		0	5ps			5ps		 45ps		  1n

*****As we know, flip flops are level sensitive.
*****In order to make them edge sensitive, I can use master slave.
*****But master slave would double the number of flip flops.
*****So I can use another way:
*****In order to make flip flops edge sensitive,
*****I will change the clock.
*****I will use a 2-input AND which the inputs are clk and clkbar.
*****The output of this AND is the edge CLOCK and we can feed it into flip flops.

*****Let's make the above:
Mc01	Vbb		Vc0		clkbar	1	pmos	L=0.25u	W=1.125U
Mc02	clkbar	Vc0		0		0	nmos	L=0.25u	W=0.375U
Mc03	Vbb		clkbar	cp		1	pmos	L=0.25u	W=1.125U
Mc04	Vbb		Vc0		cp		1	pmos	L=0.25u	W=1.125U
Mc05	cp		clkbar	cc00	0	nmos	L=0.25u	W=0.375U
Mc06	cc00	Vc0		0		0	nmos	L=0.25u	W=0.375U

*****The first bit, DFF:
Mx01	Vbb		q3		xx01	1	pmos	L=0.25u	W=1.125U
Mx02	Vbb		cp		xx01	1	pmos	L=0.25u	W=1.125U
Mx03	xx01	q3		xx02	0	nmos	L=0.25u	W=0.375U
Mx04	xx02	cp		0		0	nmos	L=0.25u	W=0.375U
Mx05	Vbb		xx01	q0		1	pmos	L=0.25u	W=1.125U
Mx06	Vbb		qbar0	q0		1	pmos	L=0.25u	W=1.125U
Mx07	q0		xx01	xx03	0	nmos	L=0.25u	W=0.375U
Mx08	xx03	qbar0	0		0	nmos	L=0.25u	W=0.375U

Mx25	Vbb		q3		qbar3	1	pmos	L=0.25u	W=1.125U
Mx26	qbar3	q3		0		0	nmos	L=0.25u	W=0.375U
Mx27	Vbb		qbar3	xc01	1	pmos	L=0.25u	W=1.125U
Mx28	Vbb		cp		xc01	1	pmos	L=0.25u	W=1.125U
Mx29	xc01	q3		xc02	0	nmos	L=0.25u	W=0.375U
Mx30	xc02	cp		0		0	nmos	L=0.25u	W=0.375U
Mx31	Vbb		xc01	qbar0	1	pmos	L=0.25u	W=1.125U
Mx32	Vbb		q3		qbar0	1	pmos	L=0.25u	W=1.125U
Mx33	qbar0	xc01	xc03	0	nmos	L=0.25u	W=0.375U
Mx34	xc03	q3		0		0	nmos	L=0.25u	W=0.375U

*****The second bit, DFF:
Mx09	Vbb		q0		xx04	1	pmos	L=0.25u	W=1.125U
Mx10	Vbb		cp		xx04	1	pmos	L=0.25u	W=1.125U
Mx11	xx04	q0		xx05	0	nmos	L=0.25u	W=0.375U
Mx12	xx05	cp		0		0	nmos	L=0.25u	W=0.375U
Mx13	Vbb		xx04	q1		1	pmos	L=0.25u	W=1.125U
Mx14	Vbb		qbar1	q1		1	pmos	L=0.25u	W=1.125U
Mx15	q1		xx04	xx06	0	nmos	L=0.25u	W=0.375U
Mx16	xx06	qbar1	0		0	nmos	L=0.25u	W=0.375U

Mx35	Vbb		q0		qbar0	1	pmos	L=0.25u	W=1.125U
Mx36	qbar0	q0		0		0	nmos	L=0.25u	W=0.375U
Mx37	Vbb		qbar0	xc04	1	pmos	L=0.25u	W=1.125U
Mx38	Vbb		cp		xc04	1	pmos	L=0.25u	W=1.125U
Mx39	xc04	q0		xc05	0	nmos	L=0.25u	W=0.375U
Mx40	xc05	cp		0		0	nmos	L=0.25u	W=0.375U
Mx41	Vbb		xc04	qbar1	1	pmos	L=0.25u	W=1.125U
Mx42	Vbb		q0		qbar1	1	pmos	L=0.25u	W=1.125U
Mx43	qbar1	xc04	xc06	0	nmos	L=0.25u	W=0.375U
Mx44	xc06	q0		0		0	nmos	L=0.25u	W=0.375U

*****The third bit, DFF:
Mx17	Vbb		q1		xx07	1	pmos	L=0.25u	W=1.125U
Mx18	Vbb		cp		xx07	1	pmos	L=0.25u	W=1.125U
Mx19	xx07	q1		xx08	0	nmos	L=0.25u	W=0.375U
Mx20	xx08	cp		0		0	nmos	L=0.25u	W=0.375U
Mx21	Vbb		xx07	q2		1	pmos	L=0.25u	W=1.125U
Mx22	Vbb		qbar2	q2		1	pmos	L=0.25u	W=1.125U
Mx23	q2		xx07	xx09	0	nmos	L=0.25u	W=0.375U
Mx24	xx09	qbar2	0		0	nmos	L=0.25u	W=0.375U

Mx45	Vbb		q1		qbar1	1	pmos	L=0.25u	W=1.125U
Mx46	qbar1	q1		0		0	nmos	L=0.25u	W=0.375U
Mx47	Vbb		qbar1	xc07	1	pmos	L=0.25u	W=1.125U
Mx48	Vbb		cp		xc07	1	pmos	L=0.25u	W=1.125U
Mx49	xc07	q1		xc08	0	nmos	L=0.25u	W=0.375U
Mx50	xc08	cp		0		0	nmos	L=0.25u	W=0.375U
Mx51	Vbb		xc07	qbar2	1	pmos	L=0.25u	W=1.125U
Mx52	Vbb		q1		qbar2	1	pmos	L=0.25u	W=1.125U
Mx53	qbar2	xc07	xc09	0	nmos	L=0.25u	W=0.375U
Mx54	xc09	q1		0		0	nmos	L=0.25u	W=0.375U

*****the forth bit, T-FlipFlop:
Mt01	Vbb		qbar2	tt0		1	pmos	L=0.25u	W=1.125U
Mt02	Vbb		cp		tt01	1	pmos	L=0.25u	W=1.125U
Mt03	Vbb		qbar3	tt01	1	pmos	L=0.25u	W=1.125U
Mt04	tt01	qbar2	tt02	0	nmos	L=0.25u	W=0.375U
Mt05	tt02	cp		tt03	0	nmos	L=0.25u	W=0.375U
Mt06	tt03	qbar3	0		0	nmos	L=0.25u	W=0.375U
Mt07	Vbb		tt01	tt04	1	pmos	L=0.25u	W=1.125U
Mt08	tt04	tt01	0		0	nmos	L=0.25u	W=0.375U
Mt09	Vbb		tt04	tt05	1	pmos	L=0.25u	W=1.125U
Mt10	tt05	q3		qbar3	1	pmos	L=0.25u	W=1.125U
Mt11	qbar3	tt04	0		0	nmos	L=0.25u	W=0.375U
Mt12	qbar3	q3		0		0	nmos	L=0.25u	W=0.375U

Mt13	Vbb		qbar2	tt06	1	pmos	L=0.25u	W=1.125U
Mt14	Vbb		cp		tt06	1	pmos	L=0.25u	W=1.125U
Mt15	Vbb		q3		tt06	1	pmos	L=0.25u	W=1.125U
Mt16	tt06	qbar2	tt07	0	nmos	L=0.25u	W=0.375U
Mt17	tt07	cp		tt08	0	nmos	L=0.25u	W=0.375U
Mt18	tt08	q3		0		0	nmos	L=0.25u	W=0.375U
Mt19	Vbb		tt06	tt09	1	pmos	L=0.25u	W=1.125U
Mt20	tt09	tt06	0		0	nmos	L=0.25u	W=0.375U
Mt21	Vbb		tt09	tt10	1	pmos	L=0.25u	W=1.125U
Mt22	tt10	qbar3	q3		1	pmos	L=0.25u	W=1.125U
Mt23	q3		tt09	0		0	nmos	L=0.25u	W=0.375U
Mt24	q3		qbar3	0		0	nmos	L=0.25u	W=0.375U



.op
.tr	0.1ns 600ns
*.BIASCHK
.meas	tran	avgpower	AVG	power		from=0ns to=100ns
.end
	

















