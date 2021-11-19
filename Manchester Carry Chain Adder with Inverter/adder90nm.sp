*****4 bit ripple adder 90 nm*****

.LIB TSMC_90nm.l	tt

*******PARAMETERS*******
.param 	vmain=5v

******INPUTS******
Vdd		VDDd 	0		vmain
Vbb		VDDb 	0		vmain
*					   *PULSE	vmin vmax delay	rise-time	fall-time	pulse-width
Va0		a0		0		PULSE 	5	0	0	5ps	5ps	45ps	1n
Va1		a1		0		PULSE 	0	5	0	5ps	5ps	45ps	1n
Va2		a2		0		PULSE 	5	0	0	5ps	5ps	45ps	1n
Va3		a3		0		PULSE 	0	5	0	5ps	5ps	45ps	1n

Vb0		b0		0		PULSE 	0	5	0	5ps	5ps	45ps	1n
Vb1		b1		0		PULSE 	5	0	0	5ps	5ps	45ps	1n
Vb2		b2		0		PULSE 	0	5	0	5ps	5ps	45ps	1n
Vb3		b3		0		PULSE 	5	0	0	5ps	5ps	45ps	1n

Vc0		c0		0		PULSE 	5	0	0	5ps	5ps	45ps	1n

******First of all we declare two inverters in order to get real values:******
Mxa01	Vbb	Va0	xa0	1	pch 	L=0.25u	W=1.125U
Mxa02	xa0	Va0	0	0	nch		L=0.25u	W=0.375U
Mxa03	Vbb	xa0	aa0	1	pch 	L=0.25u	W=1.125U
Mxa04	aa0	xa0	0	0	nch		L=0.25u	W=0.375U

Mxa11	Vbb	Va1	xa1	1	pch 	L=0.25u	W=1.125U
Mxa12	xa1	Va1	0	0	nch		L=0.25u	W=0.375U
Mxa13	Vbb	xa1	aa1	1	pch 	L=0.25u	W=1.125U
Mxa14	aa1	xa1	0	0	nch		L=0.25u	W=0.375U

Mxa21	Vbb	Va2	xa2	1	pch 	L=0.25u	W=1.125U
Mxa22	xa2	Va2	0	0	nch		L=0.25u	W=0.375U
Mxa23	Vbb	xa2	aa2	1	pch 	L=0.25u	W=1.125U
Mxa24	aa2	xa2	0	0	nch		L=0.25u	W=0.375U

Mxa31	Vbb	Va3	xa3	1	pch 	L=0.25u	W=1.125U
Mxa32	xa3	Va3	0	0	nch		L=0.25u	W=0.375U
Mxa33	Vbb	xa3	aa3	1	pch 	L=0.25u	W=1.125U
Mxa34	aa3	xa3	0	0	nch		L=0.25u	W=0.375U

Mxb01	Vbb	Vb0	xb0	1	pch 	L=0.25u	W=1.125U
Mxb02	xb0	Vb0	0	0	nch		L=0.25u	W=0.375U
Mxb03	Vbb	xb0	bb0	1	pch 	L=0.25u	W=1.125U
Mxb04	bb0	xb0	0	0	nch		L=0.25u	W=0.375U

Mxb11	Vbb	Vb1	xb1	1	pch 	L=0.25u	W=1.125U
Mxb12	xb1	Vb1	0	0	nch		L=0.25u	W=0.375U
Mxb13	Vbb	xb1	bb1	1	pch 	L=0.25u	W=1.125U
Mxb14	bb1	xb1	0	0	nch		L=0.25u	W=0.375U

Mxb21	Vbb	Vb2	xb2	1	pch 	L=0.25u	W=1.125U
Mxb22	xb2	Vb2	0	0	nch		L=0.25u	W=0.375U
Mxb23	Vbb	xb2	bb2	1	pch 	L=0.25u	W=1.125U
Mxb24	bb2	xb2	0	0	nch		L=0.25u	W=0.375U

Mxb31	Vbb	Vb3	xb3	1	pch 	L=0.25u	W=1.125U
Mxb32	xb3	Vb3	0	0	nch		L=0.25u	W=0.375U
Mxb33	Vbb	xb3	bb3	1	pch 	L=0.25u	W=1.125U
Mxb34	bb3	xb3	0	0	nch		L=0.25u	W=0.375U

Mxc01	Vbb	Vc0	xc0	1	pch 	L=0.25u	W=1.125U
Mxc02	xc0	Vc0	0	0	nch		L=0.25u	W=0.375U
Mxc03	Vbb	xc0	cc0	1	pch 	L=0.25u	W=1.125U
Mxc04	cc0	xc0	0	0	nch		L=0.25u	W=0.375U

************************************************************
** Our transistor level 1 bit Full Adder, consists of    ***
** some pmos and nmos transistors                        ***
************************************************************
*****We use two inverters at the input of the circuit (for A,B,Cin)


***M(name of tran)	drain	gate	source	body	model(pch or nch )	param-list
*********First FA*********
Ma01	Vdd	aa0	n2	1	pch	L=0.25u	W=1.125U
Mb01	Vdd	bb0	n2	1	pch	L=0.25u	W=1.125U
Ma02	n2	aa0	n3	1	pch	L=0.25u	W=1.125U
Mb02	n3	bb0	n4	1	pch	L=0.25u	W=1.125U
Mc01	n2	cc0	n4	1	pch	L=0.25u	W=1.125U
Mc02	n4	cc0	n5	0	nch	L=0.25u	W=0.375U
Ma03	n5	aa0	0	0	nch	L=0.25u	W=0.375U
Mb03	n5	bb0	0	0	nch	L=0.25u	W=0.375U
Ma04	n4	aa0	n6	0	nch	L=0.25u	W=0.375U
Mb04	n6	bb0	0	0	nch	L=0.25u	W=0.375U
Md01	Vdd	n4	c1	1	pch	L=0.25u	W=1.125U
Md02	c1	n4	0	0	nch	L=0.25u	W=0.375U
Ma05	Vdd	aa0	n7	1	pch	L=0.25u	W=1.125U
Mb05	Vdd	bb0	n7	1	pch	L=0.25u	W=1.125U
Mc03	Vdd	cc0	n7	1	pch	L=0.25u	W=1.125U
Ma06	n7	aa0	n10	1	pch	L=0.25u	W=1.125U
Mb06	n10	bb0	n11	1	pch	L=0.25u	W=1.125U
Mc04	n11	cc0	n8	1	pch	L=0.25u	W=1.125U
Md03	n7	n4	n8	1	pch	L=0.25u	W=1.125U
Md04	n8	n4	n9	0	nch	L=0.25u	W=0.375U
Ma07	n9	aa0	0	0	nch	L=0.25u	W=0.375U	
Mb07	n9	bb0	0	0	nch	L=0.25u	W=0.375U
Mc05	n9	cc0	0	0	nch	L=0.25u	W=0.375U
Ma08	n8	aa0	n12	0	nch	L=0.25u	W=0.375U
Mb08	n12	bb0	n13	0	nch	L=0.25u	W=0.375U	
Mc06	n13	cc0	0	0	nch	L=0.25u	W=0.375U
Md05	Vdd	n8	s0	1	pch	L=0.25u	W=1.125U
Md06	s0	n8	0	0	nch	L=0.25u	W=0.375U


***M(name of tran)	drain	gate	source	body	model(pch or nch )	param-list
*********Second FA*********
Ma11	Vdd	aa1	h2	1	pch	L=0.25u	W=1.125U
Mb11	Vdd	bb1	h2	1	pch	L=0.25u	W=1.125U
Ma12	h2	aa1	h3	1	pch	L=0.25u	W=1.125U
Mb12	h3	bb1	h4	1	pch	L=0.25u	W=1.125U
Mc11	h2	c1	h4	1	pch	L=0.25u	W=1.125U
Mc12	h4	c1	h5	0	nch	L=0.25u	W=0.375U
Ma13	h5	aa1	0	0	nch	L=0.25u	W=0.375U
Mb13	h5	bb1	0	0	nch	L=0.25u	W=0.375U
Ma14	h4	aa1	h6	0	nch	L=0.25u	W=0.375U
Mb14	h6	bb1	0	0	nch	L=0.25u	W=0.375U
Md11	Vdd	h4	c2	1	pch	L=0.25u	W=1.125U
Md12	c2	h4	0	0	nch	L=0.25u	W=0.375U
Ma15	Vdd	aa1	h7	1	pch	L=0.25u	W=1.125U
Mb15	Vdd	bb1	h7	1	pch	L=0.25u	W=1.125U
Mc13	Vdd	c1	h7	1	pch	L=0.25u	W=1.125U
Ma16	h7	aa1	h10	1	pch	L=0.25u	W=1.125U
Mb16	h10	bb1	h11	1	pch	L=0.25u	W=1.125U
Mc14	h11	c1	h8	1	pch	L=0.25u	W=1.125U
Md13	h7	h4	h8	1	pch	L=0.25u	W=1.125U
Md14	h8	h4	h9	0	nch	L=0.25u	W=0.375U
Ma17	h9	aa1	0	0	nch	L=0.25u	W=0.375U	
Mb17	h9	bb1	0	0	nch	L=0.25u	W=0.375U
Mc15	h9	c1	0	0	nch	L=0.25u	W=0.375U
Ma18	h8	aa1	h12	0	nch	L=0.25u	W=0.375U
Mb18	h12	bb1	h13	0	nch	L=0.25u	W=0.375U	
Mc16	h13	c1	0	0	nch	L=0.25u	W=0.375U
Md15	Vdd	h8	s1	1	pch	L=0.25u	W=1.125U
Md16	s1	h8	0	0	nch	L=0.25u	W=0.375U

***M(name of tran)	drain	gate	source	body	model(pch or nch )	param-list
*********Third FA*********
Ma21	Vdd	aa2	f2	1	pch	L=0.25u	W=1.125U
Mb21	Vdd	bb2	f2	1	pch	L=0.25u	W=1.125U
Ma22	f2	aa2	f3	1	pch	L=0.25u	W=1.125U
Mb22	f3	bb2	f4	1	pch	L=0.25u	W=1.125U
Mc21	f2	c2	f4	1	pch	L=0.25u	W=1.125U
Mc22	f4	c2	f5	0	nch	L=0.25u	W=0.375U
Ma23	f5	aa2	0	0	nch	L=0.25u	W=0.375U
Mb23	f5	bb2	0	0	nch	L=0.25u	W=0.375U
Ma24	f4	aa2	f6	0	nch	L=0.25u	W=0.375U
Mb24	f6	bb2	0	0	nch	L=0.25u	W=0.375U
Md21	Vdd	f4	c3	1	pch	L=0.25u	W=1.125U
Md22	c3	f4	0	0	nch	L=0.25u	W=0.375U
Ma25	Vdd	aa2	f7	1	pch	L=0.25u	W=1.125U
Mb25	Vdd	bb2	f7	1	pch	L=0.25u	W=1.125U
Mc23	Vdd	c2	f7	1	pch	L=0.25u	W=1.125U
Ma26	f7	aa2	f10	1	pch	L=0.25u	W=1.125U
Mb26	f10	bb2	f11	1	pch	L=0.25u	W=1.125U
Mc24	f11	c2	f8	1	pch	L=0.25u	W=1.125U
Md23	f7	f4	f8	1	pch	L=0.25u	W=1.125U
Md24	f8	f4	f9	0	nch	L=0.25u	W=0.375U
Ma27	f9	aa2	0	0	nch	L=0.25u	W=0.375U	
Mb27	f9	bb2	0	0	nch	L=0.25u	W=0.375U
Mc25	f9	c2	0	0	nch	L=0.25u	W=0.375U
Ma28	f8	aa2	f12	0	nch	L=0.25u	W=0.375U
Mb28	f12	bb2	f13	0	nch	L=0.25u	W=0.375U	
Mc26	f13	c2	0	0	nch	L=0.25u	W=0.375U
Md25	Vdd	f8	s2	1	pch	L=0.25u	W=1.125U
Md26	s2	f8	0	0	nch	L=0.25u	W=0.375U


***M(name of tran)	drain	gate	source	body	model(pch or nch )	param-list
*********Forth FA*********
Ma31	Vdd	aa3	g2	1	pch	L=0.25u	W=1.125U
Mb31	Vdd	bb3	g2	1	pch	L=0.25u	W=1.125U
Ma32	g2	aa3	g3	1	pch	L=0.25u	W=1.125U
Mb32	g3	bb3	g4	1	pch	L=0.25u	W=1.125U
Mc31	g2	c3	g4	1	pch	L=0.25u	W=1.125U
Mc32	g4	c3	g5	0	nch	L=0.25u	W=0.375U
Ma33	g5	aa3	0	0	nch	L=0.25u	W=0.375U
Mb33	g5	bb3	0	0	nch	L=0.25u	W=0.375U
Ma34	g4	aa3	g6	0	nch	L=0.25u	W=0.375U
Mb34	g6	bb3	0	0	nch	L=0.25u	W=0.375U
Md31	Vdd	g4	c4	1	pch	L=0.25u	W=1.125U
Md32	c4	g4	0	0	nch	L=0.25u	W=0.375U
Ma35	Vdd	aa3	g7	1	pch	L=0.25u	W=1.125U
Mb35	Vdd	bb3	g7	1	pch	L=0.25u	W=1.125U
Mc33	Vdd	c2	g7	1	pch	L=0.25u	W=1.125U
Ma36	g7	aa3	g10	1	pch	L=0.25u	W=1.125U
Mb36	g10	bb3	g11	1	pch	L=0.25u	W=1.125U
Mc34	g11	c2	g8	1	pch	L=0.25u	W=1.125U
Md33	g7	g4	g8	1	pch	L=0.25u	W=1.125U
Md34	g8	g4	g9	0	nch	L=0.25u	W=0.375U
Ma37	g9	aa3	0	0	nch	L=0.25u	W=0.375U	
Mb37	g9	bb3	0	0	nch	L=0.25u	W=0.375U
Mc35	g9	c2	0	0	nch	L=0.25u	W=0.375U
Ma38	g8	aa3	g12	0	nch	L=0.25u	W=0.375U
Mb38	g12	bb3	g13	0	nch	L=0.25u	W=0.375U	
Mc36	g13	c2	0	0	nch	L=0.25u	W=0.375U
Md35	Vdd	g8	s3	1	pch	L=0.25u	W=1.125U
Md36	s3	g8	0	0	nch	L=0.25u	W=0.375U
	

.op
.tran	0.01ns	10ns	
.dc	Vdd	5v	0v	0.01
.meas	tran	avgpower	AVG	  power		from=0ns to=2ns
.END	

