*****  Manchester 90 nm  *****

.LIB TSMC_90nm.l	tt

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

******Carry****
*****As this is a 4 bit Manchester Carry chain, 
*****We need 4 circuits to represent carry out.



*******First Carry*******
Mc01	Vdd		Vc0		c0bar	1	pch	L=0.25u	W=1.125U
Mc02	c0bar	Vc0		0	 	0	nch	L=0.25u	W=0.375U
Mp01	c0bar	p0		c1bar	0	nch	L=0.25u	W=0.375U
Mg01	Vdd		g0		c1bar	1	pch	L=0.25u	W=1.125U
Mg02	c1bar	g0		n2		0	nch	L=0.25u	W=0.375U
Mp02	n2		p0bar	0		0	nch	L=0.25u	W=0.375U
Mc03	Vdd		c1bar 	c1 		1	pch	L=0.25u	W=1.125U
Mc04	c1 		c1bar	0		0	nch	L=0.25u	W=0.375U 

*******Second Carry*******
Mp11	c1bar	p1		c2bar	0	nch	L=0.25u	W=0.375U
Mg11	Vdd		g1		c2bar	1	pch	L=0.25u	W=1.125U
Mg12	c1bar	g1		h2		0	nch	L=0.25u	W=0.375U
Mp12	h2		p1bar	0		0	nch	L=0.25u	W=0.375U
Mc13	Vdd		c2bar 	c2 		1	pch	L=0.25u	W=1.125U
Mc14	c2 		c2bar	0		0	nch	L=0.25u	W=0.375U

*********Third Carry******
Mp21	c2bar	p2		c3bar	0	nch	L=0.25u	W=0.375U
Mg21	Vdd		g2		c3bar	1	pch	L=0.25u	W=1.125U
Mg22	c3bar	g2		f2		0	nch	L=0.25u	W=0.375U
Mp22	f2		p2bar	0		0	nch	L=0.25u	W=0.375U
Mc23	Vdd		c3bar 	c3 		1	pch	L=0.25u	W=1.125U
Mc24	c3 		c3bar	0		0	nch	L=0.25u	W=0.375U

*********Forth Carry******
Mp31	c3bar	p3		c4bar	0	nch	L=0.25u	W=0.375U
Mg31	Vdd		g3		c4bar	1	pch	L=0.25u	W=1.125U
Mg32	c4bar	g3		j3		0	nch	L=0.25u	W=0.375U
Mp32	j3		p3bar	0		0	nch	L=0.25u	W=0.375U
Mc33	Vdd		c4bar 	c4 		1	pch	L=0.25u	W=1.125U
Mc34	c4 		c4bar	0		0	nch	L=0.25u	W=0.375U

******Generate****
*****As this is a 4 bit Manchester Carry chain, 
*****We need 4 circuits to represent Generates.

*********First Generate**********
Ma01	Vdd		Va0		n3	1	pch	L=0.25u	W=1.125U
Mb01	Vdd 	Vb0 	n3 	1	pch	L=0.25u	W=1.125U
Ma02	n3 		Va0		n4	0	nch	L=0.25u	W=0.375U
Mb02	n4 		Vb0 	0	0	nch	L=0.25u	W=0.375U
Md01	Vdd 	n3		g0	1	pch	L=0.25u	W=1.125U
Md02	g0		n3		0	0	nch	L=0.25u	W=0.375U

*********Second Generate**********
Ma11	Vdd		Va1		h3	1	pch	L=0.25u	W=1.125U
Mb11	Vdd 	Vb1 	h3 	1	pch	L=0.25u	W=1.125U
Ma12	h3 		Va1		h4	0	nch	L=0.25u	W=0.375U
Mb12	h4 		Vb1 	0	0	nch	L=0.25u	W=0.375U
Md11	Vdd 	h3		g1	1	pch	L=0.25u	W=1.125U
Md12	g1		h3		0	0	nch	L=0.25u	W=0.375U

*********Third Generate**********
Ma21	Vdd		Va2		f3	1	pch	L=0.25u	W=1.125U
Mb21	Vdd 	Vb2 	f3 	1	pch	L=0.25u	W=1.125U
Ma22	f3 		Va2		f4	0	nch	L=0.25u	W=0.375U
Mb22	f4 		Vb2 	0	0	nch	L=0.25u	W=0.375U
Md21	Vdd 	f3		g2	1	pch	L=0.25u	W=1.125U
Md22	g2		f3		0	0	nch	L=0.25u	W=0.375U

*********Forth Generate**********
Ma31	Vdd		Va3		j3	1	pch	L=0.25u	W=1.125U
Mb31	Vdd 	Vb3 	j3 	1	pch	L=0.25u	W=1.125U
Ma32	j3 		Va3		j4	0	nch	L=0.25u	W=0.375U
Mb32	j4 		Vb3 	0	0	nch	L=0.25u	W=0.375U
Md31	Vdd 	j3		g3	1	pch	L=0.25u	W=1.125U
Md32	g3		j3		0	0	nch	L=0.25u	W=0.375U


******Propagate*******
*****As this is a 4 bit Manchester Carry chain, 
*****We need 4 circuits to represent Propagate*******

*********First Propagate*****************
Mb03	Vdd		Vb0		b0bar	1	pch	L=0.25u	W=1.125U
Mb04	b0bar 	Vb0 	0		0	nch	L=0.25u	W=0.375U
Mb05	Vdd		b0bar	n5		1	pch	L=0.25u	W=1.125U
Ma06	n5		Va0		p0		1	pch	L=0.25u	W=1.125U
Mb06	Vdd		Vb0		n6		1	pch	L=0.25u	W=1.125U
Ma05	n6		a0bar	p0		1	pch	L=0.25u	W=1.125U
Ma03	Vdd		Va0		a0bar	1	pch	L=0.25u	W=1.125U
Ma04	a0bar	Va0		0		0	nch	L=0.25u	W=0.375U
Ma07	p0		Va0		n7		0	nch	L=0.25u	W=0.375U
Mb07	n7		Vb0		0		0	nch	L=0.25u	W=0.375U
Ma08	p0		a0bar	n8		0	nch	L=0.25u	W=0.375U
Mb08	n8		b0bar	0		0	nch	L=0.25u	W=0.375U

*********Second Propagate*****************
Mb13	Vdd		Vb1		b1bar	1	pch	L=0.25u	W=1.125U
Mb14	b1bar 	Vb1 	0		0	nch	L=0.25u	W=0.375U
Mb15	Vdd		b1bar	h5		1	pch	L=0.25u	W=1.125U
Ma16	h5		Va1		p1		1	pch	L=0.25u	W=1.125U
Mb16	Vdd		Vb1		h6		1	pch	L=0.25u	W=1.125U
Ma15	h6		a1bar	p1		1	pch	L=0.25u	W=1.125U
Ma13	Vdd		Va1		a1bar	1	pch	L=0.25u	W=1.125U
Ma14	a1bar	Va1		0		0	nch	L=0.25u	W=0.375U
Ma17	p1		Va1		h7		0	nch	L=0.25u	W=0.375U
Mb17	h7		Vb1		0		0	nch	L=0.25u	W=0.375U
Ma18	p1		a1bar	h8		0	nch	L=0.25u	W=0.375U
Mb18	h8		b1bar	0		0	nch	L=0.25u	W=0.375U

*********Third Propagate*****************
Mb23	Vdd		Vb2		b2bar	1	pch	L=0.25u	W=1.125U
Mb24	b2bar 	Vb2 	0		0	nch	L=0.25u	W=0.375U
Mb25	Vdd		b2bar	f5		1	pch	L=0.25u	W=1.125U
Ma26	f5		Va2		p2		1	pch	L=0.25u	W=1.125U
Mb26	Vdd		Vb2		f6		1	pch	L=0.25u	W=1.125U
Ma25	f6		a2bar	p2		1	pch	L=0.25u	W=1.125U
Ma23	Vdd		Va2		a2bar	1	pch	L=0.25u	W=1.125U
Ma24	a2bar	Va2		0		0	nch	L=0.25u	W=0.375U
Ma27	p2		Va2		f7		0	nch	L=0.25u	W=0.375U
Mb27	f7		Vb2		0		0	nch	L=0.25u	W=0.375U
Ma28	p2		a2bar	f8		0	nch	L=0.25u	W=0.375U
Mb28	f8		b2bar	0		0	nch	L=0.25u	W=0.375U

*********Forth Propagate*****************
Mb33	Vdd		Vb3		b3bar	1	pch	L=0.25u	W=1.125U
Mb34	b3bar 	Vb3 	0		0	nch	L=0.25u	W=0.375U
Mb35	Vdd		b3bar	j5		1	pch	L=0.25u	W=1.125U
Ma36	j5		Va3		p3		1	pch	L=0.25u	W=1.125U
Mb36	Vdd		Vb3		j6		1	pch	L=0.25u	W=1.125U
Ma35	j6		a3bar	p3		1	pch	L=0.25u	W=1.125U
Ma33	Vdd		Va3		a3bar	1	pch	L=0.25u	W=1.125U
Ma34	a3bar	Va3		0		0	nch	L=0.25u	W=0.375U
Ma37	p3		Va3		j7		0	nch	L=0.25u	W=0.375U
Mb37	j7		Vb3		0		0	nch	L=0.25u	W=0.375U
Ma38	p3		a3bar	j8		0	nch	L=0.25u	W=0.375U
Mb38	j8		b3bar	0		0	nch	L=0.25u	W=0.375U


******SUM*******
*****As this is a 4 bit Manchester Carry chain, 
*****We need 4 circuits to represent SUM*******

*********First SUM*****************
Mc05	Vdd		c0bar	n9		1	pch	L=0.25u	W=1.125U
Mp05	n9		p0		s0		1	pch	L=0.25u	W=1.125U
Mc06	Vdd		Vc0		n10		1	pch	L=0.25u	W=1.125U
Mp06	n10		p0bar	s0		1	pch	L=0.25u	W=1.125U
Mp03	Vdd		p0		p0bar	1	pch	L=0.25u	W=1.125U
Mp04	p0bar	p0		0		0	nch	L=0.25u	W=0.375U
Mc07	s0		Vc0		n11		0	nch	L=0.25u	W=0.375U
Mp07	n11		p0		0		0	nch	L=0.25u	W=0.375U
Mc08	s0		c0bar	n12		0	nch	L=0.25u	W=0.375U
Mp08	n12		b0bar	0		0	nch	L=0.25u	W=0.375U

*********Second SUM*****************
Mc15	Vdd		c1bar	h9		1	pch	L=0.25u	W=1.125U
Mp15	h9		p1		s1		1	pch	L=0.25u	W=1.125U
Mc16	Vdd		c1		h10		1	pch	L=0.25u	W=1.125U
Mp16	h10		p1bar	s1		1	pch	L=0.25u	W=1.125U
Mp13	Vdd		p1		p1bar	1	pch	L=0.25u	W=1.125U
Mp14	p1bar	p1		0		0	nch	L=0.25u	W=0.375U
Mc17	s1		c1		h11		0	nch	L=0.25u	W=0.375U
Mp17	h11		p1		0		0	nch	L=0.25u	W=0.375U
Mc18	s1		c1bar	h12		0	nch	L=0.25u	W=0.375U
Mp18	h12		b1bar	0		0	nch	L=0.25u	W=0.375U

*********Third SUM*****************
Mc25	Vdd		c2bar	f9		1	pch	L=0.25u	W=1.125U
Mp25	f9		p2		s2		1	pch	L=0.25u	W=1.125U
Mc26	Vdd		c2		f10		1	pch	L=0.25u	W=1.125U
Mp26	f10		p2bar	s2		1	pch	L=0.25u	W=1.125U
Mp23	Vdd		p2		p2bar	1	pch	L=0.25u	W=1.125U
Mp24	p2bar	p2		0		0	nch	L=0.25u	W=0.375U
Mc27	s2		c2		f11		0	nch	L=0.25u	W=0.375U
Mp27	f11		p2		0		0	nch	L=0.25u	W=0.375U
Mc28	s2		c2bar	f12		0	nch	L=0.25u	W=0.375U
Mp28	f12		b2bar	0		0	nch	L=0.25u	W=0.375U

*********Forth SUM*****************
Mc35	Vdd		c3bar	j9		1	pch	L=0.25u	W=1.125U
Mp35	j9		p3		s3		1	pch	L=0.25u	W=1.125U
Mc36	Vdd		c3		j10		1	pch	L=0.25u	W=1.125U
Mp36	j10		p3bar	s3		1	pch	L=0.25u	W=1.125U
Mp33	Vdd		p3		p3bar	1	pch	L=0.25u	W=1.125U
Mp34	p3bar	p3		0		0	nch	L=0.25u	W=0.375U
Mc37	s3		c3		j11		0	nch	L=0.25u	W=0.375U
Mp37	j11		p3		0		0	nch	L=0.25u	W=0.375U
Mc38	s3		c3bar	j12		0	nch	L=0.25u	W=0.375U
Mp38	j12		b3bar	0		0	nch	L=0.25u	W=0.375U

.op
.tran	0.01ns	20ns	
.dc	Vdd	5v	0v	0.01
.meas	tran	avgpower	AVG	  power		from=0ns to=20ns
.END










	