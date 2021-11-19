*****  Manmosester 45 nm  *****

.LIB 'PTM HP V2.1 45nm.l'	45nm

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
Mxa01	Vbb	Va0	xa0	1	pmos 	L=0.25u	W=1.125U
Mxa02	xa0	Va0	0	0	nmos	L=0.25u	W=0.375U
Mxa03	Vbb	xa0	aa0	1	pmos 	L=0.25u	W=1.125U
Mxa04	aa0	xa0	0	0	nmos	L=0.25u	W=0.375U

Mxa11	Vbb	Va1	xa1	1	pmos 	L=0.25u	W=1.125U
Mxa12	xa1	Va1	0	0	nmos	L=0.25u	W=0.375U
Mxa13	Vbb	xa1	aa1	1	pmos 	L=0.25u	W=1.125U
Mxa14	aa1	xa1	0	0	nmos	L=0.25u	W=0.375U

Mxa21	Vbb	Va2	xa2	1	pmos 	L=0.25u	W=1.125U
Mxa22	xa2	Va2	0	0	nmos	L=0.25u	W=0.375U
Mxa23	Vbb	xa2	aa2	1	pmos 	L=0.25u	W=1.125U
Mxa24	aa2	xa2	0	0	nmos	L=0.25u	W=0.375U

Mxa31	Vbb	Va3	xa3	1	pmos 	L=0.25u	W=1.125U
Mxa32	xa3	Va3	0	0	nmos	L=0.25u	W=0.375U
Mxa33	Vbb	xa3	aa3	1	pmos 	L=0.25u	W=1.125U
Mxa34	aa3	xa3	0	0	nmos	L=0.25u	W=0.375U

Mxb01	Vbb	Vb0	xb0	1	pmos 	L=0.25u	W=1.125U
Mxb02	xb0	Vb0	0	0	nmos	L=0.25u	W=0.375U
Mxb03	Vbb	xb0	bb0	1	pmos 	L=0.25u	W=1.125U
Mxb04	bb0	xb0	0	0	nmos	L=0.25u	W=0.375U

Mxb11	Vbb	Vb1	xb1	1	pmos 	L=0.25u	W=1.125U
Mxb12	xb1	Vb1	0	0	nmos	L=0.25u	W=0.375U
Mxb13	Vbb	xb1	bb1	1	pmos 	L=0.25u	W=1.125U
Mxb14	bb1	xb1	0	0	nmos	L=0.25u	W=0.375U

Mxb21	Vbb	Vb2	xb2	1	pmos 	L=0.25u	W=1.125U
Mxb22	xb2	Vb2	0	0	nmos	L=0.25u	W=0.375U
Mxb23	Vbb	xb2	bb2	1	pmos 	L=0.25u	W=1.125U
Mxb24	bb2	xb2	0	0	nmos	L=0.25u	W=0.375U

Mxb31	Vbb	Vb3	xb3	1	pmos 	L=0.25u	W=1.125U
Mxb32	xb3	Vb3	0	0	nmos	L=0.25u	W=0.375U
Mxb33	Vbb	xb3	bb3	1	pmos 	L=0.25u	W=1.125U
Mxb34	bb3	xb3	0	0	nmos	L=0.25u	W=0.375U

Mxc01	Vbb	Vc0	xc0	1	pmos 	L=0.25u	W=1.125U
Mxc02	xc0	Vc0	0	0	nmos	L=0.25u	W=0.375U
Mxc03	Vbb	xc0	cc0	1	pmos 	L=0.25u	W=1.125U
Mxc04	cc0	xc0	0	0	nmos	L=0.25u	W=0.375U

******Carry****
*****As this is a 4 bit Manmosester Carry chain, 
*****We need 4 circuits to represent carry out.

*******First Carry*******
Mc01	Vdd		cc0		c0bar	1	pmos	L=0.25u	W=1.125U
Mc02	c0bar	cc0		0	 	0	nmos	L=0.25u	W=0.375U
Mp01	c0bar	p0		c1bar	0	nmos	L=0.25u	W=0.375U
Mg01	Vdd		g0		c1bar	1	pmos	L=0.25u	W=1.125U
Mg02	c1bar	g0		n2		0	nmos	L=0.25u	W=0.375U
Mp02	n2		p0bar	0		0	nmos	L=0.25u	W=0.375U
Mc03	Vdd		c1bar 	c1 		1	pmos	L=0.25u	W=1.125U
Mc04	c1 		c1bar	0		0	nmos	L=0.25u	W=0.375U 

*******Second Carry*******
Mp11	c1bar	p1		c2bar	0	nmos	L=0.25u	W=0.375U
Mg11	Vdd		g1		c2bar	1	pmos	L=0.25u	W=1.125U
Mg12	c1bar	g1		h2		0	nmos	L=0.25u	W=0.375U
Mp12	h2		p1bar	0		0	nmos	L=0.25u	W=0.375U
Mc13	Vdd		c2bar 	c2 		1	pmos	L=0.25u	W=1.125U
Mc14	c2 		c2bar	0		0	nmos	L=0.25u	W=0.375U

*********Third Carry******
Mp21	c2bar	p2		c3bar	0	nmos	L=0.25u	W=0.375U
Mg21	Vdd		g2		c3bar	1	pmos	L=0.25u	W=1.125U
Mg22	c3bar	g2		f2		0	nmos	L=0.25u	W=0.375U
Mp22	f2		p2bar	0		0	nmos	L=0.25u	W=0.375U
Mc23	Vdd		c3bar 	c3 		1	pmos	L=0.25u	W=1.125U
Mc24	c3 		c3bar	0		0	nmos	L=0.25u	W=0.375U

*********Forth Carry******
Mp31	c3bar	p3		c4bar	0	nmos	L=0.25u	W=0.375U
Mg31	Vdd		g3		c4bar	1	pmos	L=0.25u	W=1.125U
Mg32	c4bar	g3		j3		0	nmos	L=0.25u	W=0.375U
Mp32	j3		p3bar	0		0	nmos	L=0.25u	W=0.375U
Mc33	Vdd		c4bar 	c4 		1	pmos	L=0.25u	W=1.125U
Mc34	c4 		c4bar	0		0	nmos	L=0.25u	W=0.375U

******Generate****
*****As this is a 4 bit Manmosester Carry chain, 
*****We need 4 circuits to represent Generates.

*********First Generate**********
Ma01	Vdd		aa0		n3	1	pmos	L=0.25u	W=1.125U
Mb01	Vdd 	bb0 	n3 	1	pmos	L=0.25u	W=1.125U
Ma02	n3 		aa0		n4	0	nmos	L=0.25u	W=0.375U
Mb02	n4 		bb0 	0	0	nmos	L=0.25u	W=0.375U
Md01	Vdd 	n3		g0	1	pmos	L=0.25u	W=1.125U
Md02	g0		n3		0	0	nmos	L=0.25u	W=0.375U

*********Second Generate**********
Ma11	Vdd		aa1		h3	1	pmos	L=0.25u	W=1.125U
Mb11	Vdd 	bb1 	h3 	1	pmos	L=0.25u	W=1.125U
Ma12	h3 		aa1		h4	0	nmos	L=0.25u	W=0.375U
Mb12	h4 		bb1 	0	0	nmos	L=0.25u	W=0.375U
Md11	Vdd 	h3		g1	1	pmos	L=0.25u	W=1.125U
Md12	g1		h3		0	0	nmos	L=0.25u	W=0.375U

*********Third Generate**********
Ma21	Vdd		aa2		f3	1	pmos	L=0.25u	W=1.125U
Mb21	Vdd 	bb2 	f3 	1	pmos	L=0.25u	W=1.125U
Ma22	f3 		aa2		f4	0	nmos	L=0.25u	W=0.375U
Mb22	f4 		bb2 	0	0	nmos	L=0.25u	W=0.375U
Md21	Vdd 	f3		g2	1	pmos	L=0.25u	W=1.125U
Md22	g2		f3		0	0	nmos	L=0.25u	W=0.375U

*********Forth Generate**********
Ma31	Vdd		aa3		j3	1	pmos	L=0.25u	W=1.125U
Mb31	Vdd 	bb3 	j3 	1	pmos	L=0.25u	W=1.125U
Ma32	j3 		aa3		j4	0	nmos	L=0.25u	W=0.375U
Mb32	j4 		bb3 	0	0	nmos	L=0.25u	W=0.375U
Md31	Vdd 	j3		g3	1	pmos	L=0.25u	W=1.125U
Md32	g3		j3		0	0	nmos	L=0.25u	W=0.375U


******Propagate*******
*****As this is a 4 bit Manmosester Carry chain, 
*****We need 4 circuits to represent Propagate*******

*********First Propagate*****************
Mb03	Vdd		bb0		b0bar	1	pmos	L=0.25u	W=1.125U
Mb04	b0bar 	bb0 	0		0	nmos	L=0.25u	W=0.375U
Mb05	Vdd		b0bar	n5		1	pmos	L=0.25u	W=1.125U
Ma06	n5		aa0		p0		1	pmos	L=0.25u	W=1.125U
Mb06	Vdd		bb0		n6		1	pmos	L=0.25u	W=1.125U
Ma05	n6		a0bar	p0		1	pmos	L=0.25u	W=1.125U
Ma03	Vdd		aa0		a0bar	1	pmos	L=0.25u	W=1.125U
Ma04	a0bar	aa0		0		0	nmos	L=0.25u	W=0.375U
Ma07	p0		aa0		n7		0	nmos	L=0.25u	W=0.375U
Mb07	n7		bb0		0		0	nmos	L=0.25u	W=0.375U
Ma08	p0		a0bar	n8		0	nmos	L=0.25u	W=0.375U
Mb08	n8		b0bar	0		0	nmos	L=0.25u	W=0.375U

*********Second Propagate*****************
Mb13	Vdd		bb1		b1bar	1	pmos	L=0.25u	W=1.125U
Mb14	b1bar 	bb1 	0		0	nmos	L=0.25u	W=0.375U
Mb15	Vdd		b1bar	h5		1	pmos	L=0.25u	W=1.125U
Ma16	h5		aa1		p1		1	pmos	L=0.25u	W=1.125U
Mb16	Vdd		bb1		h6		1	pmos	L=0.25u	W=1.125U
Ma15	h6		a1bar	p1		1	pmos	L=0.25u	W=1.125U
Ma13	Vdd		aa1		a1bar	1	pmos	L=0.25u	W=1.125U
Ma14	a1bar	aa1		0		0	nmos	L=0.25u	W=0.375U
Ma17	p1		aa1		h7		0	nmos	L=0.25u	W=0.375U
Mb17	h7		bb1		0		0	nmos	L=0.25u	W=0.375U
Ma18	p1		a1bar	h8		0	nmos	L=0.25u	W=0.375U
Mb18	h8		b1bar	0		0	nmos	L=0.25u	W=0.375U

*********Third Propagate*****************
Mb23	Vdd		bb2		b2bar	1	pmos	L=0.25u	W=1.125U
Mb24	b2bar 	bb2 	0		0	nmos	L=0.25u	W=0.375U
Mb25	Vdd		b2bar	f5		1	pmos	L=0.25u	W=1.125U
Ma26	f5		aa2		p2		1	pmos	L=0.25u	W=1.125U
Mb26	Vdd		bb2		f6		1	pmos	L=0.25u	W=1.125U
Ma25	f6		a2bar	p2		1	pmos	L=0.25u	W=1.125U
Ma23	Vdd		aa2		a2bar	1	pmos	L=0.25u	W=1.125U
Ma24	a2bar	aa2		0		0	nmos	L=0.25u	W=0.375U
Ma27	p2		aa2		f7		0	nmos	L=0.25u	W=0.375U
Mb27	f7		bb2		0		0	nmos	L=0.25u	W=0.375U
Ma28	p2		a2bar	f8		0	nmos	L=0.25u	W=0.375U
Mb28	f8		b2bar	0		0	nmos	L=0.25u	W=0.375U

*********Forth Propagate*****************
Mb33	Vdd		bb3		b3bar	1	pmos	L=0.25u	W=1.125U
Mb34	b3bar 	bb3 	0		0	nmos	L=0.25u	W=0.375U
Mb35	Vdd		b3bar	j5		1	pmos	L=0.25u	W=1.125U
Ma36	j5		aa3		p3		1	pmos	L=0.25u	W=1.125U
Mb36	Vdd		bb3		j6		1	pmos	L=0.25u	W=1.125U
Ma35	j6		a3bar	p3		1	pmos	L=0.25u	W=1.125U
Ma33	Vdd		aa3		a3bar	1	pmos	L=0.25u	W=1.125U
Ma34	a3bar	aa3		0		0	nmos	L=0.25u	W=0.375U
Ma37	p3		aa3		j7		0	nmos	L=0.25u	W=0.375U
Mb37	j7		bb3		0		0	nmos	L=0.25u	W=0.375U
Ma38	p3		a3bar	j8		0	nmos	L=0.25u	W=0.375U
Mb38	j8		b3bar	0		0	nmos	L=0.25u	W=0.375U


******SUM*******
*****As this is a 4 bit Manmosester Carry chain, 
*****We need 4 circuits to represent SUM*******

*********First SUM*****************
Mc05	Vdd		c0bar	n9		1	pmos	L=0.25u	W=1.125U
Mp05	n9		p0		s0		1	pmos	L=0.25u	W=1.125U
Mc06	Vdd		cc0		n10		1	pmos	L=0.25u	W=1.125U
Mp06	n10		p0bar	s0		1	pmos	L=0.25u	W=1.125U
Mp03	Vdd		p0		p0bar	1	pmos	L=0.25u	W=1.125U
Mp04	p0bar	p0		0		0	nmos	L=0.25u	W=0.375U
Mc07	s0		cc0		n11		0	nmos	L=0.25u	W=0.375U
Mp07	n11		p0		0		0	nmos	L=0.25u	W=0.375U
Mc08	s0		c0bar	n12		0	nmos	L=0.25u	W=0.375U
Mp08	n12		b0bar	0		0	nmos	L=0.25u	W=0.375U

*********Second SUM*****************
Mc15	Vdd		c1bar	h9		1	pmos	L=0.25u	W=1.125U
Mp15	h9		p1		s1		1	pmos	L=0.25u	W=1.125U
Mc16	Vdd		c1		h10		1	pmos	L=0.25u	W=1.125U
Mp16	h10		p1bar	s1		1	pmos	L=0.25u	W=1.125U
Mp13	Vdd		p1		p1bar	1	pmos	L=0.25u	W=1.125U
Mp14	p1bar	p1		0		0	nmos	L=0.25u	W=0.375U
Mc17	s1		c1		h11		0	nmos	L=0.25u	W=0.375U
Mp17	h11		p1		0		0	nmos	L=0.25u	W=0.375U
Mc18	s1		c1bar	h12		0	nmos	L=0.25u	W=0.375U
Mp18	h12		b1bar	0		0	nmos	L=0.25u	W=0.375U

*********Third SUM*****************
Mc25	Vdd		c2bar	f9		1	pmos	L=0.25u	W=1.125U
Mp25	f9		p2		s2		1	pmos	L=0.25u	W=1.125U
Mc26	Vdd		c2		f10		1	pmos	L=0.25u	W=1.125U
Mp26	f10		p2bar	s2		1	pmos	L=0.25u	W=1.125U
Mp23	Vdd		p2		p2bar	1	pmos	L=0.25u	W=1.125U
Mp24	p2bar	p2		0		0	nmos	L=0.25u	W=0.375U
Mc27	s2		c2		f11		0	nmos	L=0.25u	W=0.375U
Mp27	f11		p2		0		0	nmos	L=0.25u	W=0.375U
Mc28	s2		c2bar	f12		0	nmos	L=0.25u	W=0.375U
Mp28	f12		b2bar	0		0	nmos	L=0.25u	W=0.375U

*********Forth SUM*****************
Mc35	Vdd		c3bar	j9		1	pmos	L=0.25u	W=1.125U
Mp35	j9		p3		s3		1	pmos	L=0.25u	W=1.125U
Mc36	Vdd		c3		j10		1	pmos	L=0.25u	W=1.125U
Mp36	j10		p3bar	s3		1	pmos	L=0.25u	W=1.125U
Mp33	Vdd		p3		p3bar	1	pmos	L=0.25u	W=1.125U
Mp34	p3bar	p3		0		0	nmos	L=0.25u	W=0.375U
Mc37	s3		c3		j11		0	nmos	L=0.25u	W=0.375U
Mp37	j11		p3		0		0	nmos	L=0.25u	W=0.375U
Mc38	s3		c3bar	j12		0	nmos	L=0.25u	W=0.375U
Mp38	j12		b3bar	0		0	nmos	L=0.25u	W=0.375U

.op
.tran	0.01ns	10ns	
.dc	Vdd	5v	0v	0.01
.meas	tran	avgpower	AVG	  power		from=0ns to=2ns
.END










	