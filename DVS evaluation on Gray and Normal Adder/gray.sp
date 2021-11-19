**********4 bit gray counter *********
.LIB 'PTM HP V2.1 45nm.l'	45nm

*******PARAMETERS*******
.param 	vmain=3.3v

******INPUTS******
Vbb		VDDb 	0		vmain 

****clock***
*					   *PULSE	vmin vmax delay	rise-time  fall-time pulse-width  period
Vc0		c0		0		PULSE 	0	5		0	5ns			5ns		 45ns		  1m

*****As we know, flip flops are level sensitive.
*****In order to make them edge sensitive, I can use master slave.
*****But master slave would double the number of flip flops,
*****And It is not good for low power design.
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

*****A four bit gray counter has 4 JK flip flops.
*****I design the whole diagram step by step
*****The first bit:
Mx01	Vbb		q2		xx01	1	pmos	L=0.25u	W=1.125U
Mx02	xx01	q2		0		0	nmos	L=0.25u	W=0.375U
Mx03	xx01	q3		xx02	0	nmos	L=0.25u W=0.375U
Mx04	xx02	q3		q2		1	pmos	L=0.25u	W=1.125U
Mx05	Vbb		xx02	j0		1	pmos	L=0.25u	W=1.125U
Mx06	j0		xx02	0		0	nmos	L=0.25u W=0.375U
Mx07	Vbb		q2		xx03	1	pmos	L=0.25u	W=1.125U
Mx08	xx03	q2		0		0	nmos	L=0.25u W=0.375U
Mx09	xx03	q3		k0		0	nmos	L=0.25u W=0.375U
Mx10	k0		q3		q2		1	pmos	L=0.25u	W=1.125U
Mx11	Vbb		j0		xx04	1	pmos	L=0.25u	W=1.125U
Mx12	Vbb		cp		xx04	1	pmos	L=0.25u	W=1.125U
Mx13	Vbb		qbar0	xx04	1	pmos	L=0.25u	W=1.125U
Mx14	xx04	j0		xx05	0	nmos	L=0.25u W=0.375U
Mx15 	xx05	cp		xx05	0	nmos	L=0.25u W=0.375U
Mx16	xx06	qbar0	0		0	nmos	L=0.25u W=0.375U
Mx17	Vbb		xx04	xx07	1	pmos	L=0.25u	W=1.125U
Mx18	xx07	xx04	0		0	nmos	L=0.25u W=0.375U
Mx19	Vbb		xx07	xx08	1	pmos	L=0.25u	W=1.125U
Mx20	xx08	q0		qbar0	1	pmos	L=0.25u	W=1.125U
Mx21	qbar0	xx07	0		0	nmos	L=0.25u W=0.375U
Mx22	qbar0	q0		0		0	nmos	L=0.25u W=0.375U
Mx23	Vbb		k0		xx12	1	pmos	L=0.25u	W=1.125U
Mx24	Vbb		cp		xx12	1	pmos	L=0.25u	W=1.125U  
Mx25	Vbb		q0		xx12	1	pmos	L=0.25u	W=1.125U
Mx26	xx12	k0		xx09	0	nmos	L=0.25u W=0.375U
Mx27	xx09	cp		xx10	0	nmos	L=0.25u W=0.375U
Mx28	xx10	q0		0		0	nmos	L=0.25u W=0.375U
Mx29	Vbb		xx12	xx11	1	pmos	L=0.25u	W=1.125U
Mx30	xx11	xx04	0		0	nmos	L=0.25u W=0.375U
Mx31	Vbb		xx11	xx13	1	pmos	L=0.25u	W=1.125U
Mx32	xx13	q0		q0		1	pmos	L=0.25u	W=1.125U
Mx33	q0		xx11	0		0	nmos	L=0.25u W=0.375U
Mx34	q0		qbar0	0		0	nmos	L=0.25u W=0.375U

********The Second bit:
Mx35	Vbb		q0		xx14	1	pmos	L=0.25u	W=1.125U
Mx36	Vbb		qbar0	xx14	1	pmos	L=0.25u	W=1.125U
Mx37	xx14	q0		xx15	0	nmos	L=0.25u W=0.375U
Mx38	xx15	qbar0	0		0	nmos	L=0.25u W=0.375U
Mx39	Vbb		xx14	j1		1	pmos	L=0.25u	W=1.125U
Mx40	j1		xx14	0		0	nmos	L=0.25u W=0.375U
Mx41	Vbb		q0		xx16	1	pmos	L=0.25u	W=1.125U
Mx42	Vbb		q2		xx16	1	pmos	L=0.25u	W=1.125U
Mx43	xx16	q0		xx22	0	nmos	L=0.25u W=0.375U
Mx44	xx22	q2		0		0	nmos	L=0.25u W=0.375U
Mx45	Vbb		xx16	k1		1	pmos	L=0.25u	W=1.125U
Mx46	k1		xx16	0		0	nmos	L=0.25u W=0.375U
Mx47	Vbb		qbar1	xx17	1	pmos	L=0.25u	W=1.125U
Mx48	Vbb		cp		xx17	1	pmos	L=0.25u	W=1.125U
Mx49	Vbb		j1		xx17	1	pmos	L=0.25u	W=1.125U
Mx50	xx17	qbar1	xx18	0	nmos	L=0.25u W=0.375U
Mx51	xx18	cp		xx19	0	nmos	L=0.25u W=0.375U
Mx52	xx19	j1		0		0	nmos	L=0.25u W=0.375U
Mx53	Vbb		xx17	xx20	1	pmos	L=0.25u	W=1.125U
Mx54	xx20	xx17	0		0	nmos	L=0.25u W=0.375U
Mx55	Vbb		xx20	xx21	1	pmos	L=0.25u	W=1.125U
Mx56	xx21	q1		qbar1	1	pmos	L=0.25u	W=1.125U
Mx57	qbar1	xx20	0		0	nmos	L=0.25u W=0.375U
Mx58	qbar1	q1		0		0	nmos	L=0.25u W=0.375U
Mx59	Vbb		q1		xx23	1	pmos	L=0.25u	W=1.125U
Mx60	Vbb		cp		xx23	1	pmos	L=0.25u	W=1.125U
Mx61	Vbb		k1		xx23	1	pmos	L=0.25u	W=1.125U
Mx62	xx23	q1		xx24	0	nmos	L=0.25u W=0.375U
Mx63	xx24	cp		xx25	0	nmos	L=0.25u W=0.375U
Mx64	xx25	k1		0		0	nmos	L=0.25u W=0.375U
Mx65	Vbb		xx23	xx26	1	pmos	L=0.25u	W=1.125U
Mx66	xx26	xx23	0		0	nmos	L=0.25u W=0.375U
Mx67	Vbb		xx26	xx27	1	pmos	L=0.25u	W=1.125U
Mx68	xx27	qbar1	q1		1	pmos	L=0.25u	W=1.125U
Mx69	q1		xx26	0		0	nmos	L=0.25u W=0.375U
Mx70	q1		q1bar	0		0	nmos	L=0.25u W=0.375U

*******The Third bit:
Mx71	Vbb		q1		xx27	1	pmos	L=0.25u	W=1.125U
Mx72	Vbb		qbar0	xx27	1	pmos	L=0.25u	W=1.125U
Mx73	xx27	q1		xx28	0	nmos	L=0.25u W=0.375U
Mx74	xx28	qbar0	0		0	nmos	L=0.25u W=0.375U
Mx75	Vbb		xx27	j2		1	pmos	L=0.25u	W=1.125U
Mx76	j2		xx27	0		0	nmos	L=0.25u W=0.375U
Mx77	Vbb		qbar0	xx29	1	pmos	L=0.25u	W=1.125U
Mx78	Vbb		qbar2	xx29	1	pmos	L=0.25u	W=1.125U
Mx79	xx16	qbar0	xx30	0	nmos	L=0.25u W=0.375U
Mx80	xx30	qbar2	0		0	nmos	L=0.25u W=0.375U
Mx81	Vbb		xx29	k2		1	pmos	L=0.25u	W=1.125U
Mx82	k2		xx29	0		0	nmos	L=0.25u W=0.375U
Mx83	Vbb		qbar2	xx31	1	pmos	L=0.25u	W=1.125U
Mx84	Vbb		cp		xx31	1	pmos	L=0.25u	W=1.125U
Mx85	Vbb		j2		xx31	1	pmos	L=0.25u	W=1.125U
Mx86	xx31	qbar2	xx32	0	nmos	L=0.25u W=0.375U
Mx87	xx32	cp		xx33	0	nmos	L=0.25u W=0.375U
Mx88	xx33	j2		0		0	nmos	L=0.25u W=0.375U
Mx89	Vbb		xx31	xx34	1	pmos	L=0.25u	W=1.125U
Mx90	xx34	xx31	0		0	nmos	L=0.25u W=0.375U
Mx91	Vbb		xx34	xx35	1	pmos	L=0.25u	W=1.125U
Mx92	xx35	q2		qbar2	1	pmos	L=0.25u	W=1.125U
Mx93	qbar2	xx34	0		0	nmos	L=0.25u W=0.375U
Mx94	qbar2	q2		0		0	nmos	L=0.25u W=0.375U
Mx95	Vbb		q2		xx36	1	pmos	L=0.25u	W=1.125U
Mx96	Vbb		cp		xx36	1	pmos	L=0.25u	W=1.125U
Mx97	Vbb		k2		xx36	1	pmos	L=0.25u	W=1.125U
Mx98	xx36	q2		xx37	0	nmos	L=0.25u W=0.375U
Mx99	xx37	cp		xx38	0	nmos	L=0.25u W=0.375U
Mx100	xx38	k2		0		0	nmos	L=0.25u W=0.375U
Mx101	Vbb		xx36	xx39	1	pmos	L=0.25u	W=1.125U
Mx102	xx39	xx36	0		0	nmos	L=0.25u W=0.375U
Mx103	Vbb		xx39	xx40	1	pmos	L=0.25u	W=1.125U
Mx104	xx40	qbar2	q2		1	pmos	L=0.25u	W=1.125U
Mx105 	q2		xx39	0		0	nmos	L=0.25u W=0.375U
Mx106	q2		qbar2	0		0	nmos	L=0.25u W=0.375U		
	
*******The Fourth bit:
Mx107	Vbb		q2		xx41	1	pmos	L=0.25u	W=1.125U
Mx108	Vbb		qbar1	xx41	1	pmos	L=0.25u	W=1.125U
Mx109	xx41	q2		xx42	0	nmos	L=0.25u W=0.375U
Mx110	xx42	qbar1	0		0	nmos	L=0.25u W=0.375U
Mx111	Vbb		xx41	j2		1	pmos	L=0.25u	W=1.125U
Mx112	j2		xx41	0		0	nmos	L=0.25u W=0.375U
Mx113	Vbb		qbar1	xx43	1	pmos	L=0.25u	W=1.125U
Mx114	Vbb		qbar3	xx43	1	pmos	L=0.25u	W=1.125U
Mx115	xx16	qbar1	xx44	0	nmos	L=0.25u W=0.375U
Mx116	xx44	qbar3	0		0	nmos	L=0.25u W=0.375U
Mx117	Vbb		xx43	k2		1	pmos	L=0.25u	W=1.125U
Mx118	k2		xx43	0		0	nmos	L=0.25u W=0.375U
Mx119	Vbb		qbar3	xx45	1	pmos	L=0.25u	W=1.125U
Mx120	Vbb		cp		xx45	1	pmos	L=0.25u	W=1.125U
Mx121	Vbb		j2		xx45	1	pmos	L=0.25u	W=1.125U
Mx122	xx45	qbar3	xx46	0	nmos	L=0.25u W=0.375U
Mx123	xx46	cp		xx47	0	nmos	L=0.25u W=0.375U
Mx124	xx47	j2		0		0	nmos	L=0.25u W=0.375U
Mx125	Vbb		xx45	xx48	1	pmos	L=0.25u	W=1.125U
Mx126	xx48	xx45	0		0	nmos	L=0.25u W=0.375U
Mx127	Vbb		xx48	xx49	1	pmos	L=0.25u	W=1.125U
Mx128	xx49	q3		qbar3	1	pmos	L=0.25u	W=1.125U
Mx129	qbar3	xx48	0		0	nmos	L=0.25u W=0.375U
Mx130	qbar3	q3		0		0	nmos	L=0.25u W=0.375U
Mx131	Vbb		q3		xx50	1	pmos	L=0.25u	W=1.125U
Mx132	Vbb		cp		xx50	1	pmos	L=0.25u	W=1.125U
Mx133	Vbb		k2		xx50	1	pmos	L=0.25u	W=1.125U
Mx134	xx50	q3		xx51	0	nmos	L=0.25u W=0.375U
Mx135	xx51	cp		xx52	0	nmos	L=0.25u W=0.375U
Mx136	xx52	k2		0		0	nmos	L=0.25u W=0.375U
Mx137	Vbb		xx50	xx53	1	pmos	L=0.25u	W=1.125U
Mx138	xx53	xx50	0		0	nmos	L=0.25u W=0.375U
Mx139	Vbb		xx53	xx54	1	pmos	L=0.25u	W=1.125U
Mx140	xx54	qbar3	q3		1	pmos	L=0.25u	W=1.125U
Mx141 	q3		xx53	0		0	nmos	L=0.25u W=0.375U
Mx142	q3		qbar3	0		0	nmos	L=0.25u W=0.375U

	
.op
.tr	0.1ns 600ns
*.BIASCHK
.meas	tran	avgpower	AVG	power		from=0ns to=100ns
.end
	


