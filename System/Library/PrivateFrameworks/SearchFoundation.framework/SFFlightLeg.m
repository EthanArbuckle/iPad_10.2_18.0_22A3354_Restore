@implementation SFFlightLeg

- (SFFlightLeg)initWithProtobuf:(id)a3
{
  id v4;
  SFFlightLeg *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFAirport *v19;
  void *v20;
  SFAirport *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SFAirport *v35;
  void *v36;
  SFAirport *v37;
  void *v38;
  SFAirport *v39;
  void *v40;
  SFAirport *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  SFFlightLeg *v62;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SFFlightLeg;
  v5 = -[SFFlightLeg init](&v64, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "status"))
      -[SFFlightLeg setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
    objc_msgSend(v4, "departurePublishedTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "departurePublishedTime");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "secondsSince1970");
      objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDeparturePublishedTime:](v5, "setDeparturePublishedTime:", v9);

    }
    objc_msgSend(v4, "departureActualTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "departureActualTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v11, "secondsSince1970");
      objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDepartureActualTime:](v5, "setDepartureActualTime:", v13);

    }
    objc_msgSend(v4, "departureTerminal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "departureTerminal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDepartureTerminal:](v5, "setDepartureTerminal:", v15);

    }
    objc_msgSend(v4, "departureGate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "departureGate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDepartureGate:](v5, "setDepartureGate:", v17);

    }
    objc_msgSend(v4, "departureAirport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [SFAirport alloc];
      objc_msgSend(v4, "departureAirport");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFAirport initWithProtobuf:](v19, "initWithProtobuf:", v20);
      -[SFFlightLeg setDepartureAirport:](v5, "setDepartureAirport:", v21);

    }
    objc_msgSend(v4, "arrivalPublishedTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "arrivalPublishedTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v23, "secondsSince1970");
      objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalPublishedTime:](v5, "setArrivalPublishedTime:", v25);

    }
    objc_msgSend(v4, "arrivalActualTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "arrivalActualTime");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v27, "secondsSince1970");
      objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalActualTime:](v5, "setArrivalActualTime:", v29);

    }
    objc_msgSend(v4, "arrivalTerminal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "arrivalTerminal");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalTerminal:](v5, "setArrivalTerminal:", v31);

    }
    objc_msgSend(v4, "arrivalGate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "arrivalGate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalGate:](v5, "setArrivalGate:", v33);

    }
    objc_msgSend(v4, "arrivalAirport");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [SFAirport alloc];
      objc_msgSend(v4, "arrivalAirport");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SFAirport initWithProtobuf:](v35, "initWithProtobuf:", v36);
      -[SFFlightLeg setArrivalAirport:](v5, "setArrivalAirport:", v37);

    }
    objc_msgSend(v4, "divertedAirport");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [SFAirport alloc];
      objc_msgSend(v4, "divertedAirport");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[SFAirport initWithProtobuf:](v39, "initWithProtobuf:", v40);
      -[SFFlightLeg setDivertedAirport:](v5, "setDivertedAirport:", v41);

    }
    objc_msgSend(v4, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "title");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setTitle:](v5, "setTitle:", v43);

    }
    objc_msgSend(v4, "baggageClaim");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "baggageClaim");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setBaggageClaim:](v5, "setBaggageClaim:", v45);

    }
    objc_msgSend(v4, "departureGateClosedTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "departureGateClosedTime");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v47, "secondsSince1970");
      objc_msgSend(v48, "dateWithTimeIntervalSince1970:");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDepartureGateClosedTime:](v5, "setDepartureGateClosedTime:", v49);

    }
    objc_msgSend(v4, "departureRunwayTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      objc_msgSend(v4, "departureRunwayTime");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v51, "secondsSince1970");
      objc_msgSend(v52, "dateWithTimeIntervalSince1970:");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setDepartureRunwayTime:](v5, "setDepartureRunwayTime:", v53);

    }
    objc_msgSend(v4, "arrivalRunwayTime");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      objc_msgSend(v4, "arrivalRunwayTime");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v55, "secondsSince1970");
      objc_msgSend(v56, "dateWithTimeIntervalSince1970:");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalRunwayTime:](v5, "setArrivalRunwayTime:", v57);

    }
    objc_msgSend(v4, "arrivalGateTime");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v4, "arrivalGateTime");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v59, "secondsSince1970");
      objc_msgSend(v60, "dateWithTimeIntervalSince1970:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg setArrivalGateTime:](v5, "setArrivalGateTime:", v61);

    }
    v62 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_status = a3;
}

- (BOOL)hasStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFFlightLeg)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFlightLeg *v6;
  SFFlightLeg *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBFlightLeg initWithData:]([_SFPBFlightLeg alloc], "initWithData:", v5);
  v7 = -[SFFlightLeg initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFlightLeg *v6;

  v4 = a3;
  v6 = -[_SFPBFlightLeg initWithFacade:]([_SFPBFlightLeg alloc], "initWithFacade:", self);
  -[_SFPBFlightLeg data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBFlightLeg *v2;
  void *v3;

  v2 = -[_SFPBFlightLeg initWithFacade:]([_SFPBFlightLeg alloc], "initWithFacade:", self);
  -[_SFPBFlightLeg dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBFlightLeg *v2;
  void *v3;

  v2 = -[_SFPBFlightLeg initWithFacade:]([_SFPBFlightLeg alloc], "initWithFacade:", self);
  -[_SFPBFlightLeg jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatus:", -[SFFlightLeg status](self, "status"));
  -[SFFlightLeg departurePublishedTime](self, "departurePublishedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setDeparturePublishedTime:", v6);

  -[SFFlightLeg departureActualTime](self, "departureActualTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDepartureActualTime:", v8);

  -[SFFlightLeg departureTerminal](self, "departureTerminal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDepartureTerminal:", v10);

  -[SFFlightLeg departureGate](self, "departureGate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDepartureGate:", v12);

  -[SFFlightLeg departureAirport](self, "departureAirport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setDepartureAirport:", v14);

  -[SFFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setArrivalPublishedTime:", v16);

  -[SFFlightLeg arrivalActualTime](self, "arrivalActualTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setArrivalActualTime:", v18);

  -[SFFlightLeg arrivalTerminal](self, "arrivalTerminal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setArrivalTerminal:", v20);

  -[SFFlightLeg arrivalGate](self, "arrivalGate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setArrivalGate:", v22);

  -[SFFlightLeg arrivalAirport](self, "arrivalAirport");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setArrivalAirport:", v24);

  -[SFFlightLeg divertedAirport](self, "divertedAirport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setDivertedAirport:", v26);

  -[SFFlightLeg title](self, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setTitle:", v28);

  -[SFFlightLeg baggageClaim](self, "baggageClaim");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setBaggageClaim:", v30);

  -[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setDepartureGateClosedTime:", v32);

  -[SFFlightLeg departureRunwayTime](self, "departureRunwayTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setDepartureRunwayTime:", v34);

  -[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setArrivalRunwayTime:", v36);

  -[SFFlightLeg arrivalGateTime](self, "arrivalGateTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setArrivalGateTime:", v38);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  SFFlightLeg *v7;
  SFFlightLeg *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char v17;
  int v18;
  int v19;
  int v20;
  uint64_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  _BYTE v149[28];
  __int128 v150;
  int v151;
  uint64_t v152;
  __int128 v153;
  int v154;
  int v155;
  _BOOL4 v156;
  _BOOL4 v157;
  _BOOL4 v158;
  _BOOL4 v159;
  _BOOL4 v160;
  _QWORD v161[2];

  v7 = (SFFlightLeg *)a3;
  if (self == v7)
  {
    v17 = 1;
    goto LABEL_114;
  }
  if (!-[SFFlightLeg isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
  {
    v17 = 0;
    goto LABEL_114;
  }
  v8 = v7;
  v9 = -[SFFlightLeg status](self, "status");
  v10 = -[SFFlightLeg status](v8, "status");
  v154 = v10;
  v155 = v9;
  if (v9 != (_DWORD)v10
    || (-[SFFlightLeg departurePublishedTime](self, "departurePublishedTime"),
        v133 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFFlightLeg departurePublishedTime](v8, "departurePublishedTime"),
        v132 = (void *)objc_claimAutoreleasedReturnValue(),
        (v133 == 0) == (v132 != 0)))
  {
    v153 = 0uLL;
    v150 = 0uLL;
    memset(v149, 0, sizeof(v149));
    v151 = 0;
    v147 = 0;
    v145 = 0;
    v142 = 0;
    memset(v161, 0, 12);
    v137 = 0;
    v143 = 0;
    v160 = 0;
    v135 = 0;
    v140 = 0;
    v159 = 0;
    v134 = 0;
    v139 = 0;
    v158 = 0;
    v136 = 0;
    v141 = 0;
    v157 = 0;
    v138 = 0;
    v144 = 0;
    v156 = 0;
    v146 = 0;
    v152 = 0;
    v148 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    -[SFFlightLeg departurePublishedTime](self, "departurePublishedTime");
    v11 = objc_claimAutoreleasedReturnValue();
    v3 = v11 != 0;
    v131 = (void *)v11;
    if (!v11
      || (-[SFFlightLeg departurePublishedTime](self, "departurePublishedTime"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFFlightLeg departurePublishedTime](v8, "departurePublishedTime"),
          v128 = v12,
          v127 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "isEqual:")))
    {
      -[SFFlightLeg departureActualTime](self, "departureActualTime");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlightLeg departureActualTime](v8, "departureActualTime");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v153) = v3;
      if ((v130 == 0) == (v129 != 0))
      {
        *((_QWORD *)&v150 + 1) = 0x100000000;
        *(_QWORD *)((char *)&v153 + 4) = 0;
        *(_QWORD *)&v150 = 0x100000000;
        LODWORD(v153) = 0;
        memset(v149, 0, sizeof(v149));
        v151 = 0;
        v147 = 0;
        v145 = 0;
        v142 = 0;
        memset(v161, 0, 12);
        v137 = 0;
        v143 = 0;
        v160 = 0;
        v135 = 0;
        v140 = 0;
        v159 = 0;
        v134 = 0;
        v139 = 0;
        v158 = 0;
        v136 = 0;
        v141 = 0;
        v157 = 0;
        v138 = 0;
        v144 = 0;
        v156 = 0;
        v146 = 0;
        v152 = 0;
        v148 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 0;
      }
      else
      {
        -[SFFlightLeg departureActualTime](self, "departureActualTime");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22 != 0;
        v126 = (void *)v22;
        if (!v22
          || (-[SFFlightLeg departureActualTime](self, "departureActualTime"),
              v24 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFFlightLeg departureActualTime](v8, "departureActualTime"),
              v123 = v24,
              v122 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v24, "isEqual:")))
        {
          -[SFFlightLeg departureTerminal](self, "departureTerminal");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFFlightLeg departureTerminal](v8, "departureTerminal");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          DWORD2(v153) = v23;
          if ((v125 == 0) == (v124 != 0))
          {
            *(_QWORD *)&v150 = 0x100000000;
            *(_QWORD *)&v153 = 0;
            v151 = 0;
            v147 = 0;
            memset(v149, 0, 20);
            v145 = 0;
            v142 = 0;
            memset(v161, 0, 12);
            v137 = 0;
            v143 = 0;
            v160 = 0;
            v135 = 0;
            v140 = 0;
            v159 = 0;
            v134 = 0;
            v139 = 0;
            v158 = 0;
            v136 = 0;
            v141 = 0;
            v157 = 0;
            v138 = 0;
            v144 = 0;
            v156 = 0;
            v146 = 0;
            v152 = 0;
            v148 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = 0;
            *((_QWORD *)&v150 + 1) = 0x100000001;
            *(_QWORD *)&v149[20] = 1;
          }
          else
          {
            -[SFFlightLeg departureTerminal](self, "departureTerminal");
            v25 = objc_claimAutoreleasedReturnValue();
            v4 = v25 != 0;
            v121 = (void *)v25;
            if (!v25
              || (-[SFFlightLeg departureTerminal](self, "departureTerminal"),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  -[SFFlightLeg departureTerminal](v8, "departureTerminal"),
                  v118 = v26,
                  v117 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v26, "isEqual:")))
            {
              -[SFFlightLeg departureGate](self, "departureGate");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFFlightLeg departureGate](v8, "departureGate");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              DWORD1(v153) = v4;
              if ((v120 == 0) == (v119 != 0))
              {
                *(_QWORD *)&v149[16] = 0x100000000;
                LODWORD(v153) = 0;
                *(_QWORD *)&v149[4] = 0;
                v151 = 0;
                v147 = 0;
                *(_DWORD *)v149 = 0;
                v145 = 0;
                v142 = 0;
                memset(v161, 0, 12);
                v137 = 0;
                v143 = 0;
                v160 = 0;
                v135 = 0;
                v140 = 0;
                v159 = 0;
                v134 = 0;
                v139 = 0;
                v158 = 0;
                v136 = 0;
                v141 = 0;
                v157 = 0;
                v138 = 0;
                v144 = 0;
                v156 = 0;
                v146 = 0;
                v152 = 0;
                v148 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v17 = 0;
                *((_QWORD *)&v150 + 1) = 0x100000001;
                *(_QWORD *)&v150 = 0x100000001;
                *(_DWORD *)&v149[24] = 0;
                *(_DWORD *)&v149[12] = 1;
              }
              else
              {
                -[SFFlightLeg departureGate](self, "departureGate");
                v27 = objc_claimAutoreleasedReturnValue();
                v5 = v27 != 0;
                v116 = (void *)v27;
                if (!v27
                  || (-[SFFlightLeg departureGate](self, "departureGate"),
                      v28 = (void *)objc_claimAutoreleasedReturnValue(),
                      -[SFFlightLeg departureGate](v8, "departureGate"),
                      v112 = (void *)objc_claimAutoreleasedReturnValue(),
                      v113 = v28,
                      objc_msgSend(v28, "isEqual:")))
                {
                  -[SFFlightLeg departureAirport](self, "departureAirport");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFFlightLeg departureAirport](v8, "departureAirport");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v153) = v5;
                  if ((v115 == 0) != (v114 != 0))
                  {
                    -[SFFlightLeg departureAirport](self, "departureAirport");
                    v29 = objc_claimAutoreleasedReturnValue();
                    v30 = v29 != 0;
                    v111 = (void *)v29;
                    if (v29)
                    {
                      -[SFFlightLeg departureAirport](self, "departureAirport");
                      v5 = objc_claimAutoreleasedReturnValue();
                      -[SFFlightLeg departureAirport](v8, "departureAirport");
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      v108 = (void *)v5;
                      if (!objc_msgSend((id)v5, "isEqual:"))
                      {
                        v147 = 0;
                        *(_QWORD *)v149 = 0x100000000;
                        v145 = 0;
                        v142 = 0;
                        memset(v161, 0, 12);
                        v137 = 0;
                        v143 = 0;
                        v160 = 0;
                        v135 = 0;
                        v140 = 0;
                        v159 = 0;
                        v134 = 0;
                        v139 = 0;
                        v158 = 0;
                        v136 = 0;
                        v141 = 0;
                        v157 = 0;
                        v138 = 0;
                        v144 = 0;
                        v156 = 0;
                        v146 = 0;
                        v152 = 0;
                        v148 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        *((_QWORD *)&v150 + 1) = 0x100000001;
                        *(_QWORD *)&v150 = 0x100000001;
                        *(_DWORD *)&v149[24] = 0;
                        *(_QWORD *)&v149[16] = 0x100000001;
                        *(_QWORD *)&v149[8] = 0x100000001;
                        v151 = 1;
                        goto LABEL_11;
                      }
                      v151 = v30;
                    }
                    else
                    {
                      v151 = 0;
                    }
                    -[SFFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
                    v5 = objc_claimAutoreleasedReturnValue();
                    -[SFFlightLeg arrivalPublishedTime](v8, "arrivalPublishedTime");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    v110 = (void *)v5;
                    if ((v5 == 0) == (v109 != 0))
                    {
                      *(_QWORD *)v149 = 0x100000000;
                      v145 = 0;
                      v147 = 0x100000000;
                      v142 = 0;
                      memset(v161, 0, 12);
                      v137 = 0;
                      v143 = 0;
                      v160 = 0;
                      v135 = 0;
                      v140 = 0;
                      v159 = 0;
                      v134 = 0;
                      v139 = 0;
                      v158 = 0;
                      v136 = 0;
                      v141 = 0;
                      v157 = 0;
                      v138 = 0;
                      v144 = 0;
                      v156 = 0;
                      v146 = 0;
                      v152 = 0;
                      v148 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v17 = 0;
                      *((_QWORD *)&v150 + 1) = 0x100000001;
                      *(_QWORD *)&v150 = 0x100000001;
                      *(_DWORD *)&v149[24] = 0;
                      *(_QWORD *)&v149[16] = 0x100000001;
                      *(_QWORD *)&v149[8] = 0x100000001;
                    }
                    else
                    {
                      -[SFFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
                      v31 = objc_claimAutoreleasedReturnValue();
                      LODWORD(v161[1]) = v31 != 0;
                      v106 = (void *)v31;
                      if (!v31
                        || (-[SFFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime"),
                            v32 = (void *)objc_claimAutoreleasedReturnValue(),
                            -[SFFlightLeg arrivalPublishedTime](v8, "arrivalPublishedTime"),
                            v102 = (void *)objc_claimAutoreleasedReturnValue(),
                            v103 = v32,
                            objc_msgSend(v32, "isEqual:")))
                      {
                        -[SFFlightLeg arrivalActualTime](self, "arrivalActualTime");
                        v105 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SFFlightLeg arrivalActualTime](v8, "arrivalActualTime");
                        v104 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((v105 == 0) == (v104 != 0))
                        {
                          v147 = 0x100000000;
                          v161[0] = 0;
                          v142 = 0;
                          v145 = 0x100000000;
                          v137 = 0;
                          v143 = 0;
                          v160 = 0;
                          v135 = 0;
                          v140 = 0;
                          v159 = 0;
                          v134 = 0;
                          v139 = 0;
                          v158 = 0;
                          v136 = 0;
                          v141 = 0;
                          v157 = 0;
                          v138 = 0;
                          v144 = 0;
                          v156 = 0;
                          v146 = 0;
                          v152 = 0;
                          v148 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v16 = 0;
                          v17 = 0;
                          *((_QWORD *)&v150 + 1) = 0x100000001;
                          *(_QWORD *)&v150 = 0x100000001;
                          *(_DWORD *)&v149[24] = 0;
                          *(_QWORD *)&v149[16] = 0x100000001;
                          *(_QWORD *)&v149[8] = 0x100000001;
                          *(_QWORD *)v149 = 0x100000001;
                        }
                        else
                        {
                          -[SFFlightLeg arrivalActualTime](self, "arrivalActualTime");
                          v33 = objc_claimAutoreleasedReturnValue();
                          HIDWORD(v161[0]) = v33 != 0;
                          v101 = (void *)v33;
                          if (!v33
                            || (-[SFFlightLeg arrivalActualTime](self, "arrivalActualTime"),
                                v34 = (void *)objc_claimAutoreleasedReturnValue(),
                                -[SFFlightLeg arrivalActualTime](v8, "arrivalActualTime"),
                                v97 = (void *)objc_claimAutoreleasedReturnValue(),
                                v98 = v34,
                                objc_msgSend(v34, "isEqual:")))
                          {
                            -[SFFlightLeg arrivalTerminal](self, "arrivalTerminal");
                            v100 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SFFlightLeg arrivalTerminal](v8, "arrivalTerminal");
                            v99 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((v100 == 0) == (v99 != 0))
                            {
                              v145 = 0x100000000;
                              LODWORD(v161[0]) = 0;
                              v137 = 0;
                              v143 = 0;
                              v160 = 0;
                              v135 = 0;
                              v140 = 0;
                              v159 = 0;
                              v134 = 0;
                              v139 = 0;
                              v158 = 0;
                              v136 = 0;
                              v141 = 0;
                              v157 = 0;
                              v138 = 0;
                              v144 = 0;
                              v156 = 0;
                              v146 = 0;
                              v152 = 0;
                              v148 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v16 = 0;
                              v17 = 0;
                              *((_QWORD *)&v150 + 1) = 0x100000001;
                              *(_QWORD *)&v150 = 0x100000001;
                              *(_DWORD *)&v149[24] = 0;
                              *(_QWORD *)&v149[16] = 0x100000001;
                              *(_QWORD *)&v149[8] = 0x100000001;
                              v147 = 0x100000001;
                              *(_QWORD *)v149 = 0x100000001;
                              v142 = 1;
                            }
                            else
                            {
                              -[SFFlightLeg arrivalTerminal](self, "arrivalTerminal");
                              v35 = objc_claimAutoreleasedReturnValue();
                              LODWORD(v161[0]) = v35 != 0;
                              v96 = (void *)v35;
                              if (!v35
                                || (-[SFFlightLeg arrivalTerminal](self, "arrivalTerminal"),
                                    v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                    -[SFFlightLeg arrivalTerminal](v8, "arrivalTerminal"),
                                    v92 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v93 = v36,
                                    objc_msgSend(v36, "isEqual:")))
                              {
                                -[SFFlightLeg arrivalGate](self, "arrivalGate");
                                v95 = (void *)objc_claimAutoreleasedReturnValue();
                                -[SFFlightLeg arrivalGate](v8, "arrivalGate");
                                v94 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((v95 == 0) == (v94 != 0))
                                {
                                  v143 = 0;
                                  v160 = 0;
                                  v135 = 0;
                                  v140 = 0;
                                  v159 = 0;
                                  v134 = 0;
                                  v139 = 0;
                                  v158 = 0;
                                  v136 = 0;
                                  v141 = 0;
                                  v157 = 0;
                                  v138 = 0;
                                  v144 = 0;
                                  v156 = 0;
                                  v146 = 0;
                                  v152 = 0;
                                  v148 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v16 = 0;
                                  v17 = 0;
                                  *((_QWORD *)&v150 + 1) = 0x100000001;
                                  *(_QWORD *)&v150 = 0x100000001;
                                  *(_DWORD *)&v149[24] = 0;
                                  *(_QWORD *)&v149[16] = 0x100000001;
                                  *(_QWORD *)&v149[8] = 0x100000001;
                                  v147 = 0x100000001;
                                  *(_QWORD *)v149 = 0x100000001;
                                  v145 = 0x100000001;
                                  v142 = 1;
                                  v137 = 1;
                                }
                                else
                                {
                                  -[SFFlightLeg arrivalGate](self, "arrivalGate");
                                  v37 = objc_claimAutoreleasedReturnValue();
                                  v160 = v37 != 0;
                                  v91 = (void *)v37;
                                  if (!v37
                                    || (-[SFFlightLeg arrivalGate](self, "arrivalGate"),
                                        v38 = (void *)objc_claimAutoreleasedReturnValue(),
                                        -[SFFlightLeg arrivalGate](v8, "arrivalGate"),
                                        v87 = (void *)objc_claimAutoreleasedReturnValue(),
                                        v88 = v38,
                                        objc_msgSend(v38, "isEqual:")))
                                  {
                                    -[SFFlightLeg arrivalAirport](self, "arrivalAirport");
                                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[SFFlightLeg arrivalAirport](v8, "arrivalAirport");
                                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ((v90 == 0) == (v89 != 0))
                                    {
                                      v140 = 0;
                                      v159 = 0;
                                      v134 = 0;
                                      v139 = 0;
                                      v158 = 0;
                                      v136 = 0;
                                      v141 = 0;
                                      v157 = 0;
                                      v138 = 0;
                                      v144 = 0;
                                      v156 = 0;
                                      v146 = 0;
                                      v152 = 0;
                                      v148 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v16 = 0;
                                      v17 = 0;
                                      *((_QWORD *)&v150 + 1) = 0x100000001;
                                      *(_QWORD *)&v150 = 0x100000001;
                                      *(_DWORD *)&v149[24] = 0;
                                      *(_QWORD *)&v149[16] = 0x100000001;
                                      *(_QWORD *)&v149[8] = 0x100000001;
                                      v147 = 0x100000001;
                                      *(_QWORD *)v149 = 0x100000001;
                                      v145 = 0x100000001;
                                      v142 = 1;
                                      v137 = 1;
                                      v143 = 1;
                                      v135 = 1;
                                    }
                                    else
                                    {
                                      -[SFFlightLeg arrivalAirport](self, "arrivalAirport");
                                      v39 = objc_claimAutoreleasedReturnValue();
                                      v159 = v39 != 0;
                                      v86 = (void *)v39;
                                      if (!v39
                                        || (-[SFFlightLeg arrivalAirport](self, "arrivalAirport"),
                                            v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                            -[SFFlightLeg arrivalAirport](v8, "arrivalAirport"),
                                            v82 = (void *)objc_claimAutoreleasedReturnValue(),
                                            v83 = v40,
                                            objc_msgSend(v40, "isEqual:")))
                                      {
                                        -[SFFlightLeg divertedAirport](self, "divertedAirport");
                                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[SFFlightLeg divertedAirport](v8, "divertedAirport");
                                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                                        if ((v85 == 0) == (v84 != 0))
                                        {
                                          v139 = 0;
                                          v158 = 0;
                                          v136 = 0;
                                          v141 = 0;
                                          v157 = 0;
                                          v138 = 0;
                                          v144 = 0;
                                          v156 = 0;
                                          v146 = 0;
                                          v152 = 0;
                                          v148 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v16 = 0;
                                          v17 = 0;
                                          *((_QWORD *)&v150 + 1) = 0x100000001;
                                          *(_QWORD *)&v150 = 0x100000001;
                                          *(_DWORD *)&v149[24] = 0;
                                          *(_QWORD *)&v149[16] = 0x100000001;
                                          *(_QWORD *)&v149[8] = 0x100000001;
                                          v147 = 0x100000001;
                                          *(_QWORD *)v149 = 0x100000001;
                                          v145 = 0x100000001;
                                          v142 = 1;
                                          v137 = 1;
                                          v143 = 1;
                                          v135 = 1;
                                          v140 = 1;
                                          v134 = 1;
                                        }
                                        else
                                        {
                                          -[SFFlightLeg divertedAirport](self, "divertedAirport");
                                          v41 = objc_claimAutoreleasedReturnValue();
                                          v158 = v41 != 0;
                                          v81 = (void *)v41;
                                          if (!v41
                                            || (-[SFFlightLeg divertedAirport](self, "divertedAirport"),
                                                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                                                -[SFFlightLeg divertedAirport](v8, "divertedAirport"),
                                                v77 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v78 = v42,
                                                objc_msgSend(v42, "isEqual:")))
                                          {
                                            -[SFFlightLeg title](self, "title");
                                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                                            -[SFFlightLeg title](v8, "title");
                                            v79 = (void *)objc_claimAutoreleasedReturnValue();
                                            if ((v80 == 0) == (v79 != 0))
                                            {
                                              v141 = 0;
                                              v157 = 0;
                                              v138 = 0;
                                              v144 = 0;
                                              v156 = 0;
                                              v146 = 0;
                                              v152 = 0;
                                              v148 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v16 = 0;
                                              v17 = 0;
                                              *((_QWORD *)&v150 + 1) = 0x100000001;
                                              *(_QWORD *)&v150 = 0x100000001;
                                              *(_DWORD *)&v149[24] = 0;
                                              *(_QWORD *)&v149[16] = 0x100000001;
                                              *(_QWORD *)&v149[8] = 0x100000001;
                                              v147 = 0x100000001;
                                              *(_QWORD *)v149 = 0x100000001;
                                              v145 = 0x100000001;
                                              v142 = 1;
                                              v137 = 1;
                                              v143 = 1;
                                              v135 = 1;
                                              v140 = 1;
                                              v134 = 1;
                                              v139 = 1;
                                              v136 = 1;
                                            }
                                            else
                                            {
                                              -[SFFlightLeg title](self, "title");
                                              v43 = objc_claimAutoreleasedReturnValue();
                                              v157 = v43 != 0;
                                              v76 = (void *)v43;
                                              if (!v43
                                                || (-[SFFlightLeg title](self, "title"),
                                                    v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                                    -[SFFlightLeg title](v8, "title"),
                                                    v72 = (void *)objc_claimAutoreleasedReturnValue(),
                                                    v73 = v44,
                                                    objc_msgSend(v44, "isEqual:")))
                                              {
                                                -[SFFlightLeg baggageClaim](self, "baggageClaim");
                                                v75 = (void *)objc_claimAutoreleasedReturnValue();
                                                -[SFFlightLeg baggageClaim](v8, "baggageClaim");
                                                v74 = (void *)objc_claimAutoreleasedReturnValue();
                                                if ((v75 == 0) == (v74 != 0))
                                                {
                                                  v144 = 0;
                                                  v156 = 0;
                                                  v146 = 0;
                                                  v152 = 0;
                                                  v148 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v16 = 0;
                                                  v17 = 0;
                                                  *((_QWORD *)&v150 + 1) = 0x100000001;
                                                  *(_QWORD *)&v150 = 0x100000001;
                                                  *(_DWORD *)&v149[24] = 0;
                                                  *(_QWORD *)&v149[16] = 0x100000001;
                                                  *(_QWORD *)&v149[8] = 0x100000001;
                                                  v147 = 0x100000001;
                                                  *(_QWORD *)v149 = 0x100000001;
                                                  v145 = 0x100000001;
                                                  v142 = 1;
                                                  v137 = 1;
                                                  v143 = 1;
                                                  v135 = 1;
                                                  v140 = 1;
                                                  v134 = 1;
                                                  v139 = 1;
                                                  v136 = 1;
                                                  v141 = 1;
                                                  v138 = 1;
                                                }
                                                else
                                                {
                                                  -[SFFlightLeg baggageClaim](self, "baggageClaim");
                                                  v45 = objc_claimAutoreleasedReturnValue();
                                                  v156 = v45 != 0;
                                                  v71 = (void *)v45;
                                                  if (!v45
                                                    || (-[SFFlightLeg baggageClaim](self, "baggageClaim"),
                                                        v46 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        -[SFFlightLeg baggageClaim](v8, "baggageClaim"),
                                                        v67 = (void *)objc_claimAutoreleasedReturnValue(),
                                                        v68 = v46,
                                                        objc_msgSend(v46, "isEqual:")))
                                                  {
                                                    -[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
                                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[SFFlightLeg departureGateClosedTime](v8, "departureGateClosedTime");
                                                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if ((v70 == 0) == (v69 != 0))
                                                    {
                                                      v146 = 0;
                                                      v152 = 0;
                                                      v148 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v16 = 0;
                                                      v17 = 0;
                                                      *((_QWORD *)&v150 + 1) = 0x100000001;
                                                      *(_QWORD *)&v150 = 0x100000001;
                                                      *(_QWORD *)&v149[20] = 1;
                                                      *(_DWORD *)&v149[16] = 1;
                                                      *(_QWORD *)&v149[8] = 0x100000001;
                                                      v147 = 0x100000001;
                                                      *(_QWORD *)v149 = 0x100000001;
                                                      v145 = 0x100000001;
                                                      v142 = 1;
                                                      v137 = 1;
                                                      v143 = 1;
                                                      v135 = 1;
                                                      v140 = 1;
                                                      v134 = 1;
                                                      v139 = 1;
                                                      v136 = 1;
                                                      v141 = 1;
                                                      v138 = 1;
                                                      v144 = 0x100000001;
                                                    }
                                                    else
                                                    {
                                                      -[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
                                                      v47 = objc_claimAutoreleasedReturnValue();
                                                      HIDWORD(v152) = v47 != 0;
                                                      v66 = (void *)v47;
                                                      if (!v47
                                                        || (-[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime"), v48 = (void *)objc_claimAutoreleasedReturnValue(), -[SFFlightLeg departureGateClosedTime](v8, "departureGateClosedTime"), v64 = (void *)objc_claimAutoreleasedReturnValue(), v65 = v48, objc_msgSend(v48, "isEqual:")))
                                                      {
                                                        -[SFFlightLeg departureRunwayTime](self, "departureRunwayTime");
                                                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[SFFlightLeg departureRunwayTime](v8, "departureRunwayTime");
                                                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if ((v63 == 0) == (v62 != 0))
                                                        {
                                                          v148 = 0;
                                                          LODWORD(v152) = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v16 = 0;
                                                          v17 = 0;
                                                          *((_QWORD *)&v150 + 1) = 0x100000001;
                                                          *(_QWORD *)&v150 = 0x100000001;
                                                          *(_DWORD *)&v149[24] = 0;
                                                          *(_QWORD *)&v149[16] = 0x100000001;
                                                          *(_QWORD *)&v149[8] = 0x100000001;
                                                          v147 = 0x100000001;
                                                          *(_QWORD *)v149 = 0x100000001;
                                                          v145 = 0x100000001;
                                                          v142 = 1;
                                                          v137 = 1;
                                                          v143 = 1;
                                                          v135 = 1;
                                                          v140 = 1;
                                                          v134 = 1;
                                                          v139 = 1;
                                                          v136 = 1;
                                                          v141 = 1;
                                                          v138 = 1;
                                                          v144 = 0x100000001;
                                                          v146 = 0x100000001;
                                                        }
                                                        else
                                                        {
                                                          -[SFFlightLeg departureRunwayTime](self, "departureRunwayTime");
                                                          v49 = objc_claimAutoreleasedReturnValue();
                                                          LODWORD(v152) = v49 != 0;
                                                          v61 = (void *)v49;
                                                          if (!v49
                                                            || (-[SFFlightLeg departureRunwayTime](self, "departureRunwayTime"), v50 = (void *)objc_claimAutoreleasedReturnValue(), -[SFFlightLeg departureRunwayTime](v8, "departureRunwayTime"), v59 = (void *)objc_claimAutoreleasedReturnValue(), v60 = v50, objc_msgSend(v50, "isEqual:")))
                                                          {
                                                            -[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
                                                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[SFFlightLeg arrivalRunwayTime](v8, "arrivalRunwayTime");
                                                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if ((v58 == 0) == (v57 != 0))
                                                            {
                                                              v13 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v16 = 0;
                                                              v17 = 0;
                                                              *((_QWORD *)&v150 + 1) = 0x100000001;
                                                              *(_QWORD *)&v150 = 0x100000001;
                                                              *(_DWORD *)&v149[24] = 0;
                                                              *(_QWORD *)&v149[16] = 0x100000001;
                                                              *(_QWORD *)&v149[8] = 0x100000001;
                                                              v147 = 0x100000001;
                                                              *(_QWORD *)v149 = 0x100000001;
                                                              v145 = 0x100000001;
                                                              v142 = 1;
                                                              v137 = 1;
                                                              v143 = 1;
                                                              v135 = 1;
                                                              v140 = 1;
                                                              v134 = 1;
                                                              v139 = 1;
                                                              v136 = 1;
                                                              v141 = 1;
                                                              v138 = 1;
                                                              v144 = 0x100000001;
                                                              v146 = 0x100000001;
                                                              v148 = 0x100000001;
                                                            }
                                                            else
                                                            {
                                                              -[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
                                                              v51 = objc_claimAutoreleasedReturnValue();
                                                              *(_DWORD *)&v149[24] = v51 != 0;
                                                              v56 = (void *)v51;
                                                              if (!v51
                                                                || (-[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime"), v52 = (void *)objc_claimAutoreleasedReturnValue(), -[SFFlightLeg arrivalRunwayTime](v8, "arrivalRunwayTime"), v54 = (void *)objc_claimAutoreleasedReturnValue(), v55 = v52, objc_msgSend(v52, "isEqual:")))
                                                              {
                                                                -[SFFlightLeg arrivalGateTime](self, "arrivalGateTime");
                                                                v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                                -[SFFlightLeg arrivalGateTime](v8, "arrivalGateTime");
                                                                v5 = objc_claimAutoreleasedReturnValue();
                                                                if ((v53 == 0) == (v5 != 0))
                                                                {
                                                                  v15 = 0;
                                                                  v16 = 0;
                                                                  v17 = 0;
                                                                  *((_QWORD *)&v150 + 1) = 0x100000001;
                                                                  *(_QWORD *)&v150 = 0x100000001;
                                                                  *(_QWORD *)&v149[16] = 0x100000001;
                                                                  *(_QWORD *)&v149[8] = 0x100000001;
                                                                  *(_QWORD *)v149 = 0x100000001;
                                                                  v147 = 0x100000001;
                                                                  v145 = 0x100000001;
                                                                  v142 = 1;
                                                                  v137 = 1;
                                                                  v143 = 1;
                                                                  v135 = 1;
                                                                  v140 = 1;
                                                                  v134 = 1;
                                                                  v139 = 1;
                                                                  v136 = 1;
                                                                  v141 = 1;
                                                                  v138 = 1;
                                                                  v144 = 0x100000001;
                                                                  v146 = 0x100000001;
                                                                  v148 = 0x100000001;
                                                                  v13 = 1;
                                                                  v14 = 1;
                                                                }
                                                                else
                                                                {
                                                                  -[SFFlightLeg arrivalGateTime](self, "arrivalGateTime", v53);
                                                                  v10 = objc_claimAutoreleasedReturnValue();
                                                                  if (v10)
                                                                  {
                                                                    -[SFFlightLeg arrivalGateTime](self, "arrivalGateTime");
                                                                    v3 = objc_claimAutoreleasedReturnValue();
                                                                    -[SFFlightLeg arrivalGateTime](v8, "arrivalGateTime");
                                                                    v4 = objc_claimAutoreleasedReturnValue();
                                                                    v17 = objc_msgSend((id)v3, "isEqual:", v4);
                                                                    v16 = 1;
                                                                    *((_QWORD *)&v150 + 1) = 0x100000001;
                                                                    *(_QWORD *)&v150 = 0x100000001;
                                                                    *(_QWORD *)&v149[16] = 0x100000001;
                                                                    *(_QWORD *)&v149[8] = 0x100000001;
                                                                    *(_QWORD *)v149 = 0x100000001;
                                                                    v147 = 0x100000001;
                                                                    v145 = 0x100000001;
                                                                    v142 = 1;
                                                                    v137 = 1;
                                                                    v143 = 1;
                                                                    v135 = 1;
                                                                    v140 = 1;
                                                                    v134 = 1;
                                                                    v139 = 1;
                                                                    v136 = 1;
                                                                    v141 = 1;
                                                                    v138 = 1;
                                                                    v144 = 0x100000001;
                                                                    v146 = 0x100000001;
                                                                    v148 = 0x100000001;
                                                                    v13 = 1;
                                                                    v14 = 1;
                                                                    v15 = 1;
                                                                  }
                                                                  else
                                                                  {
                                                                    v16 = 0;
                                                                    *((_QWORD *)&v150 + 1) = 0x100000001;
                                                                    *(_QWORD *)&v150 = 0x100000001;
                                                                    *(_QWORD *)&v149[16] = 0x100000001;
                                                                    *(_QWORD *)&v149[8] = 0x100000001;
                                                                    *(_QWORD *)v149 = 0x100000001;
                                                                    v147 = 0x100000001;
                                                                    v145 = 0x100000001;
                                                                    v142 = 1;
                                                                    v137 = 1;
                                                                    v143 = 1;
                                                                    v135 = 1;
                                                                    v140 = 1;
                                                                    v134 = 1;
                                                                    v139 = 1;
                                                                    v136 = 1;
                                                                    v141 = 1;
                                                                    v138 = 1;
                                                                    v144 = 0x100000001;
                                                                    v146 = 0x100000001;
                                                                    v148 = 0x100000001;
                                                                    v13 = 1;
                                                                    v14 = 1;
                                                                    v15 = 1;
                                                                    v17 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v16 = 0;
                                                                v17 = 0;
                                                                *((_QWORD *)&v150 + 1) = 0x100000001;
                                                                *(_QWORD *)&v150 = 0x100000001;
                                                                *(_QWORD *)&v149[16] = 0x100000001;
                                                                *(_QWORD *)&v149[8] = 0x100000001;
                                                                *(_QWORD *)v149 = 0x100000001;
                                                                v147 = 0x100000001;
                                                                v145 = 0x100000001;
                                                                v142 = 1;
                                                                v137 = 1;
                                                                v143 = 1;
                                                                v135 = 1;
                                                                v140 = 1;
                                                                v134 = 1;
                                                                v139 = 1;
                                                                v136 = 1;
                                                                v141 = 1;
                                                                v138 = 1;
                                                                v144 = 0x100000001;
                                                                v146 = 0x100000001;
                                                                v148 = 0x100000001;
                                                                v13 = 1;
                                                                *(_DWORD *)&v149[24] = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v16 = 0;
                                                            v17 = 0;
                                                            *((_QWORD *)&v150 + 1) = 0x100000001;
                                                            *(_QWORD *)&v150 = 0x100000001;
                                                            *(_DWORD *)&v149[24] = 0;
                                                            *(_QWORD *)&v149[16] = 0x100000001;
                                                            *(_QWORD *)&v149[8] = 0x100000001;
                                                            v147 = 0x100000001;
                                                            *(_QWORD *)v149 = 0x100000001;
                                                            v145 = 0x100000001;
                                                            v142 = 1;
                                                            v137 = 1;
                                                            v143 = 1;
                                                            v135 = 1;
                                                            v140 = 1;
                                                            v134 = 1;
                                                            v139 = 1;
                                                            v136 = 1;
                                                            v141 = 1;
                                                            v138 = 1;
                                                            v144 = 0x100000001;
                                                            v146 = 0x100000001;
                                                            v148 = 1;
                                                            LODWORD(v152) = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v148 = 0;
                                                        v152 = 0x100000000;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v16 = 0;
                                                        v17 = 0;
                                                        *((_QWORD *)&v150 + 1) = 0x100000001;
                                                        *(_QWORD *)&v150 = 0x100000001;
                                                        *(_DWORD *)&v149[24] = 0;
                                                        *(_QWORD *)&v149[16] = 0x100000001;
                                                        *(_QWORD *)&v149[8] = 0x100000001;
                                                        v147 = 0x100000001;
                                                        *(_QWORD *)v149 = 0x100000001;
                                                        v145 = 0x100000001;
                                                        v142 = 1;
                                                        v137 = 1;
                                                        v143 = 1;
                                                        v135 = 1;
                                                        v140 = 1;
                                                        v134 = 1;
                                                        v139 = 1;
                                                        v136 = 1;
                                                        v141 = 1;
                                                        v138 = 1;
                                                        v144 = 0x100000001;
                                                        v146 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v144 = 0x100000000;
                                                    v146 = 0;
                                                    v152 = 0;
                                                    v148 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v16 = 0;
                                                    v17 = 0;
                                                    *((_QWORD *)&v150 + 1) = 0x100000001;
                                                    *(_QWORD *)&v150 = 0x100000001;
                                                    *(_DWORD *)&v149[24] = 0;
                                                    *(_QWORD *)&v149[16] = 0x100000001;
                                                    *(_QWORD *)&v149[8] = 0x100000001;
                                                    v147 = 0x100000001;
                                                    *(_QWORD *)v149 = 0x100000001;
                                                    v145 = 0x100000001;
                                                    v142 = 1;
                                                    v137 = 1;
                                                    v143 = 1;
                                                    v135 = 1;
                                                    v140 = 1;
                                                    v134 = 1;
                                                    v139 = 1;
                                                    v136 = 1;
                                                    v141 = 1;
                                                    v138 = 1;
                                                    v156 = 1;
                                                  }
                                                }
                                              }
                                              else
                                              {
                                                v138 = 0;
                                                v144 = 0;
                                                v156 = 0;
                                                v146 = 0;
                                                v152 = 0;
                                                v148 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v16 = 0;
                                                v17 = 0;
                                                *((_QWORD *)&v150 + 1) = 0x100000001;
                                                *(_QWORD *)&v150 = 0x100000001;
                                                *(_DWORD *)&v149[24] = 0;
                                                *(_QWORD *)&v149[16] = 0x100000001;
                                                *(_QWORD *)&v149[8] = 0x100000001;
                                                v147 = 0x100000001;
                                                *(_QWORD *)v149 = 0x100000001;
                                                v145 = 0x100000001;
                                                v142 = 1;
                                                v137 = 1;
                                                v143 = 1;
                                                v135 = 1;
                                                v140 = 1;
                                                v134 = 1;
                                                v139 = 1;
                                                v136 = 1;
                                                v141 = 1;
                                                v157 = 1;
                                              }
                                            }
                                          }
                                          else
                                          {
                                            v136 = 0;
                                            v141 = 0;
                                            v157 = 0;
                                            v138 = 0;
                                            v144 = 0;
                                            v156 = 0;
                                            v146 = 0;
                                            v152 = 0;
                                            v148 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v16 = 0;
                                            v17 = 0;
                                            *((_QWORD *)&v150 + 1) = 0x100000001;
                                            *(_QWORD *)&v150 = 0x100000001;
                                            *(_DWORD *)&v149[24] = 0;
                                            *(_QWORD *)&v149[16] = 0x100000001;
                                            *(_QWORD *)&v149[8] = 0x100000001;
                                            v147 = 0x100000001;
                                            *(_QWORD *)v149 = 0x100000001;
                                            v145 = 0x100000001;
                                            v142 = 1;
                                            v137 = 1;
                                            v143 = 1;
                                            v135 = 1;
                                            v140 = 1;
                                            v134 = 1;
                                            v139 = 1;
                                            v158 = 1;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v134 = 0;
                                        v139 = 0;
                                        v158 = 0;
                                        v136 = 0;
                                        v141 = 0;
                                        v157 = 0;
                                        v138 = 0;
                                        v144 = 0;
                                        v156 = 0;
                                        v146 = 0;
                                        v152 = 0;
                                        v148 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v16 = 0;
                                        v17 = 0;
                                        *((_QWORD *)&v150 + 1) = 0x100000001;
                                        *(_QWORD *)&v150 = 0x100000001;
                                        *(_DWORD *)&v149[24] = 0;
                                        *(_QWORD *)&v149[16] = 0x100000001;
                                        *(_QWORD *)&v149[8] = 0x100000001;
                                        v147 = 0x100000001;
                                        *(_QWORD *)v149 = 0x100000001;
                                        v145 = 0x100000001;
                                        v142 = 1;
                                        v137 = 1;
                                        v143 = 1;
                                        v135 = 1;
                                        v140 = 1;
                                        v159 = 1;
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v135 = 0;
                                    v140 = 0;
                                    v159 = 0;
                                    v134 = 0;
                                    v139 = 0;
                                    v158 = 0;
                                    v136 = 0;
                                    v141 = 0;
                                    v157 = 0;
                                    v138 = 0;
                                    v144 = 0;
                                    v156 = 0;
                                    v146 = 0;
                                    v152 = 0;
                                    v148 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v16 = 0;
                                    v17 = 0;
                                    *((_QWORD *)&v150 + 1) = 0x100000001;
                                    *(_QWORD *)&v150 = 0x100000001;
                                    *(_DWORD *)&v149[24] = 0;
                                    *(_QWORD *)&v149[16] = 0x100000001;
                                    *(_QWORD *)&v149[8] = 0x100000001;
                                    v147 = 0x100000001;
                                    *(_QWORD *)v149 = 0x100000001;
                                    v145 = 0x100000001;
                                    v142 = 1;
                                    v137 = 1;
                                    v143 = 1;
                                    v160 = 1;
                                  }
                                }
                              }
                              else
                              {
                                v137 = 0;
                                v143 = 0;
                                v160 = 0;
                                v135 = 0;
                                v140 = 0;
                                v159 = 0;
                                v134 = 0;
                                v139 = 0;
                                v158 = 0;
                                v136 = 0;
                                v141 = 0;
                                v157 = 0;
                                v138 = 0;
                                v144 = 0;
                                v156 = 0;
                                v146 = 0;
                                v152 = 0;
                                v148 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v16 = 0;
                                v17 = 0;
                                *((_QWORD *)&v150 + 1) = 0x100000001;
                                *(_QWORD *)&v150 = 0x100000001;
                                *(_DWORD *)&v149[24] = 0;
                                *(_QWORD *)&v149[16] = 0x100000001;
                                *(_QWORD *)&v149[8] = 0x100000001;
                                v147 = 0x100000001;
                                *(_QWORD *)v149 = 0x100000001;
                                v145 = 0x100000001;
                                v142 = 1;
                                LODWORD(v161[0]) = 1;
                              }
                            }
                          }
                          else
                          {
                            v142 = 0;
                            v145 = 0x100000000;
                            v161[0] = 0x100000000;
                            v137 = 0;
                            v143 = 0;
                            v160 = 0;
                            v135 = 0;
                            v140 = 0;
                            v159 = 0;
                            v134 = 0;
                            v139 = 0;
                            v158 = 0;
                            v136 = 0;
                            v141 = 0;
                            v157 = 0;
                            v138 = 0;
                            v144 = 0;
                            v156 = 0;
                            v146 = 0;
                            v152 = 0;
                            v148 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v16 = 0;
                            v17 = 0;
                            *((_QWORD *)&v150 + 1) = 0x100000001;
                            *(_QWORD *)&v150 = 0x100000001;
                            *(_DWORD *)&v149[24] = 0;
                            *(_QWORD *)&v149[16] = 0x100000001;
                            *(_QWORD *)&v149[8] = 0x100000001;
                            v147 = 0x100000001;
                            *(_QWORD *)v149 = 0x100000001;
                          }
                        }
                      }
                      else
                      {
                        v145 = 0;
                        v147 = 0x100000000;
                        v161[0] = 0;
                        v142 = 0;
                        v137 = 0;
                        v143 = 0;
                        v160 = 0;
                        v135 = 0;
                        v140 = 0;
                        v159 = 0;
                        v134 = 0;
                        v139 = 0;
                        v158 = 0;
                        v136 = 0;
                        v141 = 0;
                        v157 = 0;
                        v138 = 0;
                        v144 = 0;
                        v156 = 0;
                        v146 = 0;
                        v152 = 0;
                        v148 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v16 = 0;
                        v17 = 0;
                        *((_QWORD *)&v150 + 1) = 0x100000001;
                        *(_QWORD *)&v150 = 0x100000001;
                        *(_DWORD *)&v149[24] = 0;
                        *(_QWORD *)&v149[16] = 0x100000001;
                        *(_QWORD *)&v149[8] = 0x100000001;
                        *(_QWORD *)v149 = 0x100000001;
                        LODWORD(v161[1]) = 1;
                      }
                    }
                    goto LABEL_11;
                  }
                  *(_QWORD *)&v149[8] = 0x100000000;
                  v151 = 0;
                  v147 = 0;
                  *(_QWORD *)v149 = 0x100000000;
                  v145 = 0;
                  v142 = 0;
                  memset(v161, 0, 12);
                  v137 = 0;
                  v143 = 0;
                  v160 = 0;
                  v135 = 0;
                  v140 = 0;
                  v159 = 0;
                  v134 = 0;
                  v139 = 0;
                  v158 = 0;
                  v136 = 0;
                  v141 = 0;
                  v157 = 0;
                  v138 = 0;
                  v144 = 0;
                  v156 = 0;
                  v146 = 0;
                  v152 = 0;
                  v148 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  *((_QWORD *)&v150 + 1) = 0x100000001;
                  *(_QWORD *)&v150 = 0x100000001;
                  *(_DWORD *)&v149[24] = 0;
                  *(_QWORD *)&v149[16] = 0x100000001;
                }
                else
                {
                  *(_QWORD *)&v149[4] = 0;
                  v151 = 0;
                  v147 = 0;
                  *(_DWORD *)v149 = 0;
                  v145 = 0;
                  v142 = 0;
                  memset(v161, 0, 12);
                  v137 = 0;
                  v143 = 0;
                  v160 = 0;
                  v135 = 0;
                  v140 = 0;
                  v159 = 0;
                  v134 = 0;
                  v139 = 0;
                  v158 = 0;
                  v136 = 0;
                  v141 = 0;
                  v157 = 0;
                  v138 = 0;
                  v144 = 0;
                  v156 = 0;
                  v146 = 0;
                  v152 = 0;
                  v148 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v17 = 0;
                  *((_QWORD *)&v150 + 1) = 0x100000001;
                  *(_QWORD *)&v150 = 0x100000001;
                  *(_DWORD *)&v149[24] = 0;
                  *(_DWORD *)&v149[12] = 1;
                  *(_QWORD *)&v149[16] = 0x100000001;
                  LODWORD(v153) = 1;
                }
              }
            }
            else
            {
              *(_QWORD *)&v153 = 0x100000000;
              v151 = 0;
              v147 = 0;
              memset(v149, 0, 20);
              v145 = 0;
              v142 = 0;
              memset(v161, 0, 12);
              v137 = 0;
              v143 = 0;
              v160 = 0;
              v135 = 0;
              v140 = 0;
              v159 = 0;
              v134 = 0;
              v139 = 0;
              v158 = 0;
              v136 = 0;
              v141 = 0;
              v157 = 0;
              v138 = 0;
              v144 = 0;
              v156 = 0;
              v146 = 0;
              v152 = 0;
              v148 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v17 = 0;
              *((_QWORD *)&v150 + 1) = 0x100000001;
              *(_QWORD *)&v150 = 0x100000001;
              *(_DWORD *)&v149[20] = 1;
              *(_DWORD *)&v149[24] = 0;
            }
          }
        }
        else
        {
          *(_QWORD *)&v150 = 0x100000000;
          *(_QWORD *)&v153 = 0;
          memset(v149, 0, sizeof(v149));
          v151 = 0;
          v147 = 0;
          v145 = 0;
          v142 = 0;
          memset(v161, 0, 12);
          v137 = 0;
          v143 = 0;
          v160 = 0;
          v135 = 0;
          v140 = 0;
          v159 = 0;
          v134 = 0;
          v139 = 0;
          v158 = 0;
          v136 = 0;
          v141 = 0;
          v157 = 0;
          v138 = 0;
          v144 = 0;
          v156 = 0;
          v146 = 0;
          v152 = 0;
          v148 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          *((_QWORD *)&v150 + 1) = 0x100000001;
          DWORD2(v153) = 1;
        }
      }
    }
    else
    {
      *(_QWORD *)((char *)&v150 + 4) = 0;
      *(_QWORD *)((char *)&v153 + 4) = 0;
      LODWORD(v150) = 0;
      LODWORD(v153) = 0;
      memset(v149, 0, sizeof(v149));
      v151 = 0;
      v147 = 0;
      v145 = 0;
      v142 = 0;
      memset(v161, 0, 12);
      v137 = 0;
      v143 = 0;
      v160 = 0;
      v135 = 0;
      v140 = 0;
      v159 = 0;
      v134 = 0;
      v139 = 0;
      v158 = 0;
      v136 = 0;
      v141 = 0;
      v157 = 0;
      v138 = 0;
      v144 = 0;
      v156 = 0;
      v146 = 0;
      v152 = 0;
      v148 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      HIDWORD(v150) = 1;
      HIDWORD(v153) = 1;
    }
  }
LABEL_11:
  if (v16)
  {
    v18 = v13;
    v19 = v14;
    v20 = v15;

    v15 = v20;
    v14 = v19;
    v13 = v18;
  }
  if (v15)

  if (v14)
  {

  }
  if (*(_DWORD *)&v149[24])
  {

  }
  if (v13)

  if (HIDWORD(v148))
  {

  }
  if ((_DWORD)v152)
  {

  }
  if ((_DWORD)v148)

  if (HIDWORD(v146))
  {

  }
  if (HIDWORD(v152))
  {

  }
  if ((_DWORD)v146)

  if ((_DWORD)v144)
  {

  }
  if (v156)
  {

  }
  if (HIDWORD(v144))

  if (v138)
  {

  }
  if (v157)
  {

  }
  if (v141)

  if (v136)
  {

  }
  if (v158)
  {

  }
  if (v139)

  if (v134)
  {

  }
  if (v159)
  {

  }
  if (v140)

  if (v135)
  {

  }
  if (v160)
  {

  }
  if (v143)

  if (v137)
  {

  }
  if (LODWORD(v161[0]))
  {

  }
  if ((_DWORD)v145)

  if (v142)
  {

  }
  if (HIDWORD(v161[0]))
  {

  }
  if ((_DWORD)v147)

  if (HIDWORD(v145))
  {

  }
  if (LODWORD(v161[1]))
  {

  }
  if (*(_DWORD *)v149)

  if (HIDWORD(v147))
  {

  }
  if (v151)
  {

  }
  if (*(_DWORD *)&v149[8])

  if (*(_DWORD *)&v149[4])
  {

  }
  if ((_DWORD)v153)
  {

  }
  if (*(_DWORD *)&v149[16])

  if (*(_DWORD *)&v149[12])
  {

  }
  if (DWORD1(v153))
  {

  }
  if ((_DWORD)v150)

  if (*(_DWORD *)&v149[20])
  {

  }
  if (DWORD2(v153))
  {

  }
  if (DWORD2(v150))

  if (DWORD1(v150))
  {

  }
  if (HIDWORD(v153))
  {

  }
  if (HIDWORD(v150))

  if (v155 == v154)
  {

  }
LABEL_114:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = -[SFFlightLeg status](self, "status");
  -[SFFlightLeg departurePublishedTime](self, "departurePublishedTime");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v38, "hash") ^ v3;
  -[SFFlightLeg departureActualTime](self, "departureActualTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v37, "hash");
  -[SFFlightLeg departureTerminal](self, "departureTerminal");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v36, "hash");
  -[SFFlightLeg departureGate](self, "departureGate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v35, "hash");
  -[SFFlightLeg departureAirport](self, "departureAirport");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v34, "hash");
  -[SFFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v33, "hash");
  -[SFFlightLeg arrivalActualTime](self, "arrivalActualTime");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v32, "hash");
  -[SFFlightLeg arrivalTerminal](self, "arrivalTerminal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v31, "hash");
  -[SFFlightLeg arrivalGate](self, "arrivalGate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v30, "hash");
  -[SFFlightLeg arrivalAirport](self, "arrivalAirport");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v29, "hash");
  -[SFFlightLeg divertedAirport](self, "divertedAirport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFFlightLeg title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFFlightLeg baggageClaim](self, "baggageClaim");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[SFFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[SFFlightLeg departureRunwayTime](self, "departureRunwayTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13 ^ v21 ^ objc_msgSend(v22, "hash");
  -[SFFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  -[SFFlightLeg arrivalGateTime](self, "arrivalGateTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23 ^ v25 ^ objc_msgSend(v26, "hash");

  return v27;
}

- (int)status
{
  return self->_status;
}

- (NSDate)departurePublishedTime
{
  return self->_departurePublishedTime;
}

- (void)setDeparturePublishedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)departureActualTime
{
  return self->_departureActualTime;
}

- (void)setDepartureActualTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)departureTerminal
{
  return self->_departureTerminal;
}

- (void)setDepartureTerminal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)departureGate
{
  return self->_departureGate;
}

- (void)setDepartureGate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFAirport)departureAirport
{
  return self->_departureAirport;
}

- (void)setDepartureAirport:(id)a3
{
  objc_storeStrong((id *)&self->_departureAirport, a3);
}

- (NSDate)arrivalPublishedTime
{
  return self->_arrivalPublishedTime;
}

- (void)setArrivalPublishedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)arrivalActualTime
{
  return self->_arrivalActualTime;
}

- (void)setArrivalActualTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)arrivalTerminal
{
  return self->_arrivalTerminal;
}

- (void)setArrivalTerminal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)arrivalGate
{
  return self->_arrivalGate;
}

- (void)setArrivalGate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SFAirport)arrivalAirport
{
  return self->_arrivalAirport;
}

- (void)setArrivalAirport:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalAirport, a3);
}

- (SFAirport)divertedAirport
{
  return self->_divertedAirport;
}

- (void)setDivertedAirport:(id)a3
{
  objc_storeStrong((id *)&self->_divertedAirport, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)baggageClaim
{
  return self->_baggageClaim;
}

- (void)setBaggageClaim:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)departureGateClosedTime
{
  return self->_departureGateClosedTime;
}

- (void)setDepartureGateClosedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)departureRunwayTime
{
  return self->_departureRunwayTime;
}

- (void)setDepartureRunwayTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)arrivalRunwayTime
{
  return self->_arrivalRunwayTime;
}

- (void)setArrivalRunwayTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDate)arrivalGateTime
{
  return self->_arrivalGateTime;
}

- (void)setArrivalGateTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalGateTime, 0);
  objc_storeStrong((id *)&self->_arrivalRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureRunwayTime, 0);
  objc_storeStrong((id *)&self->_departureGateClosedTime, 0);
  objc_storeStrong((id *)&self->_baggageClaim, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_divertedAirport, 0);
  objc_storeStrong((id *)&self->_arrivalAirport, 0);
  objc_storeStrong((id *)&self->_arrivalGate, 0);
  objc_storeStrong((id *)&self->_arrivalTerminal, 0);
  objc_storeStrong((id *)&self->_arrivalActualTime, 0);
  objc_storeStrong((id *)&self->_arrivalPublishedTime, 0);
  objc_storeStrong((id *)&self->_departureAirport, 0);
  objc_storeStrong((id *)&self->_departureGate, 0);
  objc_storeStrong((id *)&self->_departureTerminal, 0);
  objc_storeStrong((id *)&self->_departureActualTime, 0);
  objc_storeStrong((id *)&self->_departurePublishedTime, 0);
}

@end
