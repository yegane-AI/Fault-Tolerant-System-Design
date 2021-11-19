*****4 bit ripple adder 45 nm*****

.LIB 'PTM HP V2.1 45nm.l'	45nm

*******PARAMETERS*******
.param 	vmain=5v

******INPUTS******
Vdd		VDDd 	0		vmain
Vbb		VDDb 	0		vmain 
*					   *PULSE	vmin vmax delay	rise-time	fall-time	pulse-width
Va0		a0		0		PULSE 	5	0	0	5ps	5ps	45ps	10n
Va1		a1		0		PULSE 	0	5	0	5ps	5ps	45ps	10n
Va2		a2		0		PULSE 	5	0	0	5ps	5ps	45ps	10n
Va3		a3		0		PULSE 	0	5	0	5ps	5ps	45ps	10n

Vb0		b0		0		PULSE 	0	5	0	5ps	5ps	45ps	10n
Vb1		b1		0		PULSE 	5	0	0	5ps	5ps	45ps	10n
Vb2		b2		0		PULSE 	0	5	0	5ps	5ps	45ps	10n
Vb3		b3		0		PULSE 	5	0	0	5ps	5ps	45ps	10n

Vc0		c0		0		PULSE 	5	0	0	5ps	5ps	45ps	10n


************************************************************
** Our transistor level 1 bit Full Adder, consists of    ***
** some pmos and nmos transistors                        ***
************************************************************
*****We use two inverters at the input of the circuit (for A,B,Cin)


***M(name of tran)	drain	gate	source	body	model(pmos or nmos )	param-list
*********First FA*********
Ma01	Vdd	Va0	n2	1	pmos	L=0.25u	W=1.125U
Mb01	Vdd	Vb0	n2	1	pmos	L=0.25u	W=1.125U
Ma02	n2	Va0	n3	1	pmos	L=0.25u	W=1.125U
Mb02	n3	Vb0	n4	1	pmos	L=0.25u	W=1.125U
Mc01	n2	Vc0	n4	1	pmos	L=0.25u	W=1.125U
Mc02	n4	Vc0	n5	0	nmos	L=0.25u	W=0.375U
Ma03	n5	Va0	0	0	nmos	L=0.25u	W=0.375U
Mb03	n5	Vb0	0	0	nmos	L=0.25u	W=0.375U
Ma04	n4	Va0	n6	0	nmos	L=0.25u	W=0.375U
Mb04	n6	Vb0	0	0	nmos	L=0.25u	W=0.375U
Md01	Vdd	n4	c1	1	pmos	L=0.25u	W=1.125U
Md02	c1	n4	0	0	nmos	L=0.25u	W=0.375U
Ma05	Vdd	Va0	n7	1	pmos	L=0.25u	W=1.125U
Mb05	Vdd	Vb0	n7	1	pmos	L=0.25u	W=1.125U
Mc03	Vdd	Vc0	n7	1	pmos	L=0.25u	W=1.125U
Ma06	n7	Va0	n10	1	pmos	L=0.25u	W=1.125U
Mb06	n10	Vb0	n11	1	pmos	L=0.25u	W=1.125U
Mc04	n11	Vc0	n8	1	pmos	L=0.25u	W=1.125U
Md03	n7	n4	n8	1	pmos	L=0.25u	W=1.125U
Md04	n8	n4	n9	0	nmos	L=0.25u	W=0.375U
Ma07	n9	Va0	0	0	nmos	L=0.25u	W=0.375U	
Mb07	n9	Vb0	0	0	nmos	L=0.25u	W=0.375U
Mc05	n9	Vc0	0	0	nmos	L=0.25u	W=0.375U
Ma08	n8	Va0	n12	0	nmos	L=0.25u	W=0.375U
Mb08	n12	Vb0	n13	0	nmos	L=0.25u	W=0.375U	
Mc06	n13	Vc0	0	0	nmos	L=0.25u	W=0.375U
Md05	Vdd	n8	s0	1	pmos	L=0.25u	W=1.125U
Md06	s0	n8	0	0	nmos	L=0.25u	W=0.375U


***M(name of tran)	drain	gate	source	body	model(pmos or nmos )	param-list
*********Second FA*********
Ma11	Vdd	Va1	h2	1	pmos	L=0.25u	W=1.125U
Mb11	Vdd	Vb1	h2	1	pmos	L=0.25u	W=1.125U
Ma12	h2	Va1	h3	1	pmos	L=0.25u	W=1.125U
Mb12	h3	Vb1	h4	1	pmos	L=0.25u	W=1.125U
Mc11	h2	c1	h4	1	pmos	L=0.25u	W=1.125U
Mc12	h4	c1	h5	0	nmos	L=0.25u	W=0.375U
Ma13	h5	Va1	0	0	nmos	L=0.25u	W=0.375U
Mb13	h5	Vb1	0	0	nmos	L=0.25u	W=0.375U
Ma14	h4	Va1	h6	0	nmos	L=0.25u	W=0.375U
Mb14	h6	Vb1	0	0	nmos	L=0.25u	W=0.375U
Md11	Vdd	h4	c2	1	pmos	L=0.25u	W=1.125U
Md12	c2	h4	0	0	nmos	L=0.25u	W=0.375U
Ma15	Vdd	Va1	h7	1	pmos	L=0.25u	W=1.125U
Mb15	Vdd	Vb1	h7	1	pmos	L=0.25u	W=1.125U
Mc13	Vdd	c1	h7	1	pmos	L=0.25u	W=1.125U
Ma16	h7	Va1	h10	1	pmos	L=0.25u	W=1.125U
Mb16	h10	Vb1	h11	1	pmos	L=0.25u	W=1.125U
Mc14	h11	c1	h8	1	pmos	L=0.25u	W=1.125U
Md13	h7	h4	h8	1	pmos	L=0.25u	W=1.125U
Md14	h8	h4	h9	0	nmos	L=0.25u	W=0.375U
Ma17	h9	Va1	0	0	nmos	L=0.25u	W=0.375U	
Mb17	h9	Vb1	0	0	nmos	L=0.25u	W=0.375U
Mc15	h9	c1	0	0	nmos	L=0.25u	W=0.375U
Ma18	h8	Va1	h12	0	nmos	L=0.25u	W=0.375U
Mb18	h12	Vb1	h13	0	nmos	L=0.25u	W=0.375U	
Mc16	h13	c1	0	0	nmos	L=0.25u	W=0.375U
Md15	Vdd	h8	s1	1	pmos	L=0.25u	W=1.125U
Md16	s1	h8	0	0	nmos	L=0.25u	W=0.375U

***M(name of tran)	drain	gate	source	body	model(pmos or nmos )	param-list
*********Third FA*********
Ma21	Vdd	Va2	f2	1	pmos	L=0.25u	W=1.125U
Mb21	Vdd	Vb2	f2	1	pmos	L=0.25u	W=1.125U
Ma22	f2	Va2	f3	1	pmos	L=0.25u	W=1.125U
Mb22	f3	Vb2	f4	1	pmos	L=0.25u	W=1.125U
Mc21	f2	c2	f4	1	pmos	L=0.25u	W=1.125U
Mc22	f4	c2	f5	0	nmos	L=0.25u	W=0.375U
Ma23	f5	Va2	0	0	nmos	L=0.25u	W=0.375U
Mb23	f5	Vb2	0	0	nmos	L=0.25u	W=0.375U
Ma24	f4	Va2	f6	0	nmos	L=0.25u	W=0.375U
Mb24	f6	Vb2	0	0	nmos	L=0.25u	W=0.375U
Md21	Vdd	f4	c3	1	pmos	L=0.25u	W=1.125U
Md22	c3	f4	0	0	nmos	L=0.25u	W=0.375U
Ma25	Vdd	Va2	f7	1	pmos	L=0.25u	W=1.125U
Mb25	Vdd	Vb2	f7	1	pmos	L=0.25u	W=1.125U
Mc23	Vdd	c2	f7	1	pmos	L=0.25u	W=1.125U
Ma26	f7	Va2	f10	1	pmos	L=0.25u	W=1.125U
Mb26	f10	Vb2	f11	1	pmos	L=0.25u	W=1.125U
Mc24	f11	c2	f8	1	pmos	L=0.25u	W=1.125U
Md23	f7	f4	f8	1	pmos	L=0.25u	W=1.125U
Md24	f8	f4	f9	0	nmos	L=0.25u	W=0.375U
Ma27	f9	Va2	0	0	nmos	L=0.25u	W=0.375U	
Mb27	f9	Vb2	0	0	nmos	L=0.25u	W=0.375U
Mc25	f9	c2	0	0	nmos	L=0.25u	W=0.375U
Ma28	f8	Va2	f12	0	nmos	L=0.25u	W=0.375U
Mb28	f12	Vb2	f13	0	nmos	L=0.25u	W=0.375U	
Mc26	f13	c2	0	0	nmos	L=0.25u	W=0.375U
Md25	Vdd	f8	s2	1	pmos	L=0.25u	W=1.125U
Md26	s2	f8	0	0	nmos	L=0.25u	W=0.375U


***M(name of tran)	drain	gate	source	body	model(pmos or nmos )	param-list
*********Forth FA*********
Ma31	Vdd	Va3	g2	1	pmos	L=0.25u	W=1.125U
Mb31	Vdd	Vb3	g2	1	pmos	L=0.25u	W=1.125U
Ma32	g2	Va3	g3	1	pmos	L=0.25u	W=1.125U
Mb32	g3	Vb3	g4	1	pmos	L=0.25u	W=1.125U
Mc31	g2	c3	g4	1	pmos	L=0.25u	W=1.125U
Mc32	g4	c3	g5	0	nmos	L=0.25u	W=0.375U
Ma33	g5	Va3	0	0	nmos	L=0.25u	W=0.375U
Mb33	g5	Vb3	0	0	nmos	L=0.25u	W=0.375U
Ma34	g4	Va3	g6	0	nmos	L=0.25u	W=0.375U
Mb34	g6	Vb3	0	0	nmos	L=0.25u	W=0.375U
Md31	Vdd	g4	c4	1	pmos	L=0.25u	W=1.125U
Md32	c4	g4	0	0	nmos	L=0.25u	W=0.375U
Ma35	Vdd	Va3	g7	1	pmos	L=0.25u	W=1.125U
Mb35	Vdd	Vb3	g7	1	pmos	L=0.25u	W=1.125U
Mc33	Vdd	c2	g7	1	pmos	L=0.25u	W=1.125U
Ma36	g7	Va3	g10	1	pmos	L=0.25u	W=1.125U
Mb36	g10	Vb3	g11	1	pmos	L=0.25u	W=1.125U
Mc34	g11	c2	g8	1	pmos	L=0.25u	W=1.125U
Md33	g7	g4	g8	1	pmos	L=0.25u	W=1.125U
Md34	g8	g4	g9	0	nmos	L=0.25u	W=0.375U
Ma37	g9	Va3	0	0	nmos	L=0.25u	W=0.375U	
Mb37	g9	Vb3	0	0	nmos	L=0.25u	W=0.375U
Mc35	g9	c2	0	0	nmos	L=0.25u	W=0.375U
Ma38	g8	Va3	g12	0	nmos	L=0.25u	W=0.375U
Mb38	g12	Vb3	g13	0	nmos	L=0.25u	W=0.375U	
Mc36	g13	c2	0	0	nmos	L=0.25u	W=0.375U
Md35	Vdd	g8	s3	1	pmos	L=0.25u	W=1.125U
Md36	s3	g8	0	0	nmos	L=0.25u	W=0.375U
	

.op
.tran	0.01ns	10ns	
.dc	Vdd	5v	0v	0.01
.meas	tran	avgpower	AVG	  power		from=0ns to=2ns
.END	

