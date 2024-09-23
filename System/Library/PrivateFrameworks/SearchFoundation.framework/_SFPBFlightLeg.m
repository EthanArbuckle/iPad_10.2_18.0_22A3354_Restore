@implementation _SFPBFlightLeg

- (_SFPBFlightLeg)initWithFacade:(id)a3
{
  id v4;
  _SFPBFlightLeg *v5;
  void *v6;
  _SFPBDate *v7;
  void *v8;
  _SFPBDate *v9;
  void *v10;
  _SFPBDate *v11;
  void *v12;
  _SFPBDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SFPBAirport *v19;
  void *v20;
  _SFPBAirport *v21;
  void *v22;
  _SFPBDate *v23;
  void *v24;
  _SFPBDate *v25;
  void *v26;
  _SFPBDate *v27;
  void *v28;
  _SFPBDate *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _SFPBAirport *v35;
  void *v36;
  _SFPBAirport *v37;
  void *v38;
  _SFPBAirport *v39;
  void *v40;
  _SFPBAirport *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _SFPBDate *v47;
  void *v48;
  _SFPBDate *v49;
  void *v50;
  _SFPBDate *v51;
  void *v52;
  _SFPBDate *v53;
  void *v54;
  _SFPBDate *v55;
  void *v56;
  _SFPBDate *v57;
  void *v58;
  _SFPBDate *v59;
  void *v60;
  _SFPBDate *v61;
  _SFPBFlightLeg *v62;

  v4 = a3;
  v5 = -[_SFPBFlightLeg init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasStatus"))
      -[_SFPBFlightLeg setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
    objc_msgSend(v4, "departurePublishedTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBDate alloc];
      objc_msgSend(v4, "departurePublishedTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBDate initWithNSDate:](v7, "initWithNSDate:", v8);
      -[_SFPBFlightLeg setDeparturePublishedTime:](v5, "setDeparturePublishedTime:", v9);

    }
    objc_msgSend(v4, "departureActualTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [_SFPBDate alloc];
      objc_msgSend(v4, "departureActualTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_SFPBDate initWithNSDate:](v11, "initWithNSDate:", v12);
      -[_SFPBFlightLeg setDepartureActualTime:](v5, "setDepartureActualTime:", v13);

    }
    objc_msgSend(v4, "departureTerminal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "departureTerminal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setDepartureTerminal:](v5, "setDepartureTerminal:", v15);

    }
    objc_msgSend(v4, "departureGate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "departureGate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setDepartureGate:](v5, "setDepartureGate:", v17);

    }
    objc_msgSend(v4, "departureAirport");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [_SFPBAirport alloc];
      objc_msgSend(v4, "departureAirport");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[_SFPBAirport initWithFacade:](v19, "initWithFacade:", v20);
      -[_SFPBFlightLeg setDepartureAirport:](v5, "setDepartureAirport:", v21);

    }
    objc_msgSend(v4, "arrivalPublishedTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = [_SFPBDate alloc];
      objc_msgSend(v4, "arrivalPublishedTime");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_SFPBDate initWithNSDate:](v23, "initWithNSDate:", v24);
      -[_SFPBFlightLeg setArrivalPublishedTime:](v5, "setArrivalPublishedTime:", v25);

    }
    objc_msgSend(v4, "arrivalActualTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [_SFPBDate alloc];
      objc_msgSend(v4, "arrivalActualTime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_SFPBDate initWithNSDate:](v27, "initWithNSDate:", v28);
      -[_SFPBFlightLeg setArrivalActualTime:](v5, "setArrivalActualTime:", v29);

    }
    objc_msgSend(v4, "arrivalTerminal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "arrivalTerminal");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setArrivalTerminal:](v5, "setArrivalTerminal:", v31);

    }
    objc_msgSend(v4, "arrivalGate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "arrivalGate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setArrivalGate:](v5, "setArrivalGate:", v33);

    }
    objc_msgSend(v4, "arrivalAirport");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = [_SFPBAirport alloc];
      objc_msgSend(v4, "arrivalAirport");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[_SFPBAirport initWithFacade:](v35, "initWithFacade:", v36);
      -[_SFPBFlightLeg setArrivalAirport:](v5, "setArrivalAirport:", v37);

    }
    objc_msgSend(v4, "divertedAirport");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = [_SFPBAirport alloc];
      objc_msgSend(v4, "divertedAirport");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[_SFPBAirport initWithFacade:](v39, "initWithFacade:", v40);
      -[_SFPBFlightLeg setDivertedAirport:](v5, "setDivertedAirport:", v41);

    }
    objc_msgSend(v4, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "title");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setTitle:](v5, "setTitle:", v43);

    }
    objc_msgSend(v4, "baggageClaim");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "baggageClaim");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlightLeg setBaggageClaim:](v5, "setBaggageClaim:", v45);

    }
    objc_msgSend(v4, "departureGateClosedTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBDate alloc];
      objc_msgSend(v4, "departureGateClosedTime");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBDate initWithNSDate:](v47, "initWithNSDate:", v48);
      -[_SFPBFlightLeg setDepartureGateClosedTime:](v5, "setDepartureGateClosedTime:", v49);

    }
    objc_msgSend(v4, "departureRunwayTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [_SFPBDate alloc];
      objc_msgSend(v4, "departureRunwayTime");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[_SFPBDate initWithNSDate:](v51, "initWithNSDate:", v52);
      -[_SFPBFlightLeg setDepartureRunwayTime:](v5, "setDepartureRunwayTime:", v53);

    }
    objc_msgSend(v4, "arrivalRunwayTime");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBDate alloc];
      objc_msgSend(v4, "arrivalRunwayTime");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBDate initWithNSDate:](v55, "initWithNSDate:", v56);
      -[_SFPBFlightLeg setArrivalRunwayTime:](v5, "setArrivalRunwayTime:", v57);

    }
    objc_msgSend(v4, "arrivalGateTime");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      v59 = [_SFPBDate alloc];
      objc_msgSend(v4, "arrivalGateTime");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[_SFPBDate initWithNSDate:](v59, "initWithNSDate:", v60);
      -[_SFPBFlightLeg setArrivalGateTime:](v5, "setArrivalGateTime:", v61);

    }
    v62 = v5;
  }

  return v5;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void)setDeparturePublishedTime:(id)a3
{
  objc_storeStrong((id *)&self->_departurePublishedTime, a3);
}

- (void)setDepartureActualTime:(id)a3
{
  objc_storeStrong((id *)&self->_departureActualTime, a3);
}

- (void)setDepartureTerminal:(id)a3
{
  NSString *v4;
  NSString *departureTerminal;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  departureTerminal = self->_departureTerminal;
  self->_departureTerminal = v4;

}

- (void)setDepartureGate:(id)a3
{
  NSString *v4;
  NSString *departureGate;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  departureGate = self->_departureGate;
  self->_departureGate = v4;

}

- (void)setDepartureAirport:(id)a3
{
  objc_storeStrong((id *)&self->_departureAirport, a3);
}

- (void)setArrivalPublishedTime:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalPublishedTime, a3);
}

- (void)setArrivalActualTime:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalActualTime, a3);
}

- (void)setArrivalTerminal:(id)a3
{
  NSString *v4;
  NSString *arrivalTerminal;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  arrivalTerminal = self->_arrivalTerminal;
  self->_arrivalTerminal = v4;

}

- (void)setArrivalGate:(id)a3
{
  NSString *v4;
  NSString *arrivalGate;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  arrivalGate = self->_arrivalGate;
  self->_arrivalGate = v4;

}

- (void)setArrivalAirport:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalAirport, a3);
}

- (void)setDivertedAirport:(id)a3
{
  objc_storeStrong((id *)&self->_divertedAirport, a3);
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setBaggageClaim:(id)a3
{
  NSString *v4;
  NSString *baggageClaim;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  baggageClaim = self->_baggageClaim;
  self->_baggageClaim = v4;

}

- (void)setDepartureGateClosedTime:(id)a3
{
  objc_storeStrong((id *)&self->_departureGateClosedTime, a3);
}

- (void)setDepartureRunwayTime:(id)a3
{
  objc_storeStrong((id *)&self->_departureRunwayTime, a3);
}

- (void)setArrivalRunwayTime:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalRunwayTime, a3);
}

- (void)setArrivalGateTime:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalGateTime, a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightLegReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
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
  id v21;

  v21 = a3;
  if (-[_SFPBFlightLeg status](self, "status"))
    PBDataWriterWriteInt32Field();
  -[_SFPBFlightLeg departurePublishedTime](self, "departurePublishedTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg departureActualTime](self, "departureActualTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg departureTerminal](self, "departureTerminal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg departureGate](self, "departureGate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg departureAirport](self, "departureAirport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg arrivalActualTime](self, "arrivalActualTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg arrivalTerminal](self, "arrivalTerminal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg arrivalGate](self, "arrivalGate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg arrivalAirport](self, "arrivalAirport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg divertedAirport](self, "divertedAirport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg baggageClaim](self, "baggageClaim");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg departureRunwayTime](self, "departureRunwayTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBFlightLeg arrivalGateTime](self, "arrivalGateTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int status;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  BOOL v93;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_88;
  status = self->_status;
  if (status != objc_msgSend(v4, "status"))
    goto LABEL_88;
  -[_SFPBFlightLeg departurePublishedTime](self, "departurePublishedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departurePublishedTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departurePublishedTime](self, "departurePublishedTime");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[_SFPBFlightLeg departurePublishedTime](self, "departurePublishedTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departurePublishedTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureActualTime](self, "departureActualTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureActualTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureActualTime](self, "departureActualTime");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_SFPBFlightLeg departureActualTime](self, "departureActualTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureActualTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureTerminal](self, "departureTerminal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureTerminal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureTerminal](self, "departureTerminal");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBFlightLeg departureTerminal](self, "departureTerminal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureTerminal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureGate](self, "departureGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureGate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureGate](self, "departureGate");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_SFPBFlightLeg departureGate](self, "departureGate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureGate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureAirport](self, "departureAirport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureAirport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureAirport](self, "departureAirport");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBFlightLeg departureAirport](self, "departureAirport");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureAirport");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalPublishedTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalPublishedTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalActualTime](self, "arrivalActualTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalActualTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalActualTime](self, "arrivalActualTime");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBFlightLeg arrivalActualTime](self, "arrivalActualTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalActualTime");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalTerminal](self, "arrivalTerminal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalTerminal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalTerminal](self, "arrivalTerminal");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_SFPBFlightLeg arrivalTerminal](self, "arrivalTerminal");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalTerminal");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalGate](self, "arrivalGate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalGate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalGate](self, "arrivalGate");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[_SFPBFlightLeg arrivalGate](self, "arrivalGate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalGate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalAirport](self, "arrivalAirport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalAirport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalAirport](self, "arrivalAirport");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[_SFPBFlightLeg arrivalAirport](self, "arrivalAirport");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalAirport");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg divertedAirport](self, "divertedAirport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "divertedAirport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg divertedAirport](self, "divertedAirport");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[_SFPBFlightLeg divertedAirport](self, "divertedAirport");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "divertedAirport");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if (!v62)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg title](self, "title");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[_SFPBFlightLeg title](self, "title");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqual:", v66);

    if (!v67)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg baggageClaim](self, "baggageClaim");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baggageClaim");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg baggageClaim](self, "baggageClaim");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[_SFPBFlightLeg baggageClaim](self, "baggageClaim");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baggageClaim");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqual:", v71);

    if (!v72)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureGateClosedTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[_SFPBFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureGateClosedTime");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqual:", v76);

    if (!v77)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg departureRunwayTime](self, "departureRunwayTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departureRunwayTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg departureRunwayTime](self, "departureRunwayTime");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[_SFPBFlightLeg departureRunwayTime](self, "departureRunwayTime");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureRunwayTime");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqual:", v81);

    if (!v82)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalRunwayTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_87;
  -[_SFPBFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
  v83 = objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    v84 = (void *)v83;
    -[_SFPBFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalRunwayTime");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v85, "isEqual:", v86);

    if (!v87)
      goto LABEL_88;
  }
  else
  {

  }
  -[_SFPBFlightLeg arrivalGateTime](self, "arrivalGateTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrivalGateTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[_SFPBFlightLeg arrivalGateTime](self, "arrivalGateTime");
    v88 = objc_claimAutoreleasedReturnValue();
    if (!v88)
    {

LABEL_91:
      v93 = 1;
      goto LABEL_89;
    }
    v89 = (void *)v88;
    -[_SFPBFlightLeg arrivalGateTime](self, "arrivalGateTime");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrivalGateTime");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v90, "isEqual:", v91);

    if ((v92 & 1) != 0)
      goto LABEL_91;
  }
  else
  {
LABEL_87:

  }
LABEL_88:
  v93 = 0;
LABEL_89:

  return v93;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v3 = 2654435761 * self->_status;
  v4 = -[_SFPBDate hash](self->_departurePublishedTime, "hash");
  v5 = v4 ^ -[_SFPBDate hash](self->_departureActualTime, "hash");
  v6 = v5 ^ -[NSString hash](self->_departureTerminal, "hash");
  v7 = v6 ^ -[NSString hash](self->_departureGate, "hash");
  v8 = v7 ^ -[_SFPBAirport hash](self->_departureAirport, "hash") ^ v3;
  v9 = -[_SFPBDate hash](self->_arrivalPublishedTime, "hash");
  v10 = v9 ^ -[_SFPBDate hash](self->_arrivalActualTime, "hash");
  v11 = v10 ^ -[NSString hash](self->_arrivalTerminal, "hash");
  v12 = v11 ^ -[NSString hash](self->_arrivalGate, "hash");
  v13 = v12 ^ -[_SFPBAirport hash](self->_arrivalAirport, "hash");
  v14 = v8 ^ v13 ^ -[_SFPBAirport hash](self->_divertedAirport, "hash");
  v15 = -[NSString hash](self->_title, "hash");
  v16 = v15 ^ -[NSString hash](self->_baggageClaim, "hash");
  v17 = v16 ^ -[_SFPBDate hash](self->_departureGateClosedTime, "hash");
  v18 = v17 ^ -[_SFPBDate hash](self->_departureRunwayTime, "hash");
  v19 = v18 ^ -[_SFPBDate hash](self->_arrivalRunwayTime, "hash");
  return v14 ^ v19 ^ -[_SFPBDate hash](self->_arrivalGateTime, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_arrivalActualTime)
  {
    -[_SFPBFlightLeg arrivalActualTime](self, "arrivalActualTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("arrivalActualTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("arrivalActualTime"));

    }
  }
  if (self->_arrivalAirport)
  {
    -[_SFPBFlightLeg arrivalAirport](self, "arrivalAirport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("arrivalAirport"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("arrivalAirport"));

    }
  }
  if (self->_arrivalGate)
  {
    -[_SFPBFlightLeg arrivalGate](self, "arrivalGate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("arrivalGate"));

  }
  if (self->_arrivalGateTime)
  {
    -[_SFPBFlightLeg arrivalGateTime](self, "arrivalGateTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("arrivalGateTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("arrivalGateTime"));

    }
  }
  if (self->_arrivalPublishedTime)
  {
    -[_SFPBFlightLeg arrivalPublishedTime](self, "arrivalPublishedTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("arrivalPublishedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("arrivalPublishedTime"));

    }
  }
  if (self->_arrivalRunwayTime)
  {
    -[_SFPBFlightLeg arrivalRunwayTime](self, "arrivalRunwayTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("arrivalRunwayTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("arrivalRunwayTime"));

    }
  }
  if (self->_arrivalTerminal)
  {
    -[_SFPBFlightLeg arrivalTerminal](self, "arrivalTerminal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("arrivalTerminal"));

  }
  if (self->_baggageClaim)
  {
    -[_SFPBFlightLeg baggageClaim](self, "baggageClaim");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("baggageClaim"));

  }
  if (self->_departureActualTime)
  {
    -[_SFPBFlightLeg departureActualTime](self, "departureActualTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("departureActualTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("departureActualTime"));

    }
  }
  if (self->_departureAirport)
  {
    -[_SFPBFlightLeg departureAirport](self, "departureAirport");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("departureAirport"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("departureAirport"));

    }
  }
  if (self->_departureGate)
  {
    -[_SFPBFlightLeg departureGate](self, "departureGate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("departureGate"));

  }
  if (self->_departureGateClosedTime)
  {
    -[_SFPBFlightLeg departureGateClosedTime](self, "departureGateClosedTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("departureGateClosedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("departureGateClosedTime"));

    }
  }
  if (self->_departurePublishedTime)
  {
    -[_SFPBFlightLeg departurePublishedTime](self, "departurePublishedTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("departurePublishedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("departurePublishedTime"));

    }
  }
  if (self->_departureRunwayTime)
  {
    -[_SFPBFlightLeg departureRunwayTime](self, "departureRunwayTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("departureRunwayTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("departureRunwayTime"));

    }
  }
  if (self->_departureTerminal)
  {
    -[_SFPBFlightLeg departureTerminal](self, "departureTerminal");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("departureTerminal"));

  }
  if (self->_divertedAirport)
  {
    -[_SFPBFlightLeg divertedAirport](self, "divertedAirport");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("divertedAirport"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("divertedAirport"));

    }
  }
  if (self->_status)
  {
    v47 = -[_SFPBFlightLeg status](self, "status");
    if (v47 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = *(&off_1E4041E50 + v47);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("status"));

  }
  if (self->_title)
  {
    -[_SFPBFlightLeg title](self, "title");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("title"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBFlightLeg dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBFlightLeg)initWithJSON:(id)a3
{
  void *v4;
  _SFPBFlightLeg *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBFlightLeg initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBFlightLeg)initWithDictionary:(id)a3
{
  id v4;
  _SFPBFlightLeg *v5;
  void *v6;
  uint64_t v7;
  _SFPBDate *v8;
  uint64_t v9;
  _SFPBDate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _SFPBAirport *v16;
  uint64_t v17;
  _SFPBDate *v18;
  uint64_t v19;
  _SFPBDate *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _SFPBAirport *v26;
  void *v27;
  _SFPBAirport *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _SFPBDate *v34;
  void *v35;
  _SFPBDate *v36;
  void *v37;
  _SFPBDate *v38;
  void *v39;
  _SFPBDate *v40;
  _SFPBFlightLeg *v41;
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
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBFlightLeg;
  v5 = -[_SFPBFlightLeg init](&v54, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBFlightLeg setStatus:](v5, "setStatus:", objc_msgSend(v6, "intValue"));
    v50 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departurePublishedTime"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v7);
      -[_SFPBFlightLeg setDeparturePublishedTime:](v5, "setDeparturePublishedTime:", v8);

    }
    v49 = (void *)v7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureActualTime"));
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v9);
      -[_SFPBFlightLeg setDepartureActualTime:](v5, "setDepartureActualTime:", v10);

    }
    v48 = (void *)v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      -[_SFPBFlightLeg setDepartureTerminal:](v5, "setDepartureTerminal:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureGate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v13, "copy");
      -[_SFPBFlightLeg setDepartureGate:](v5, "setDepartureGate:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureAirport"));
    v15 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[_SFPBAirport initWithDictionary:]([_SFPBAirport alloc], "initWithDictionary:", v15);
      -[_SFPBFlightLeg setDepartureAirport:](v5, "setDepartureAirport:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalPublishedTime"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v17);
      -[_SFPBFlightLeg setArrivalPublishedTime:](v5, "setArrivalPublishedTime:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalActualTime"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v53 = (void *)v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v19);
      -[_SFPBFlightLeg setArrivalActualTime:](v5, "setArrivalActualTime:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v52 = v21;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBFlightLeg setArrivalTerminal:](v5, "setArrivalTerminal:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[_SFPBFlightLeg setArrivalGate:](v5, "setArrivalGate:", v24);

    }
    v47 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v25 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[_SFPBAirport initWithDictionary:]([_SFPBAirport alloc], "initWithDictionary:", v25);
      -[_SFPBFlightLeg setArrivalAirport:](v5, "setArrivalAirport:", v26);

    }
    v43 = (void *)v25;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("divertedAirport"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[_SFPBAirport initWithDictionary:]([_SFPBAirport alloc], "initWithDictionary:", v27);
      -[_SFPBFlightLeg setDivertedAirport:](v5, "setDivertedAirport:", v28);

    }
    v45 = (void *)v15;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)objc_msgSend(v29, "copy");
      -[_SFPBFlightLeg setTitle:](v5, "setTitle:", v30);

    }
    v44 = (void *)v17;
    v46 = v13;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("baggageClaim"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = (void *)objc_msgSend(v31, "copy");
      -[_SFPBFlightLeg setBaggageClaim:](v5, "setBaggageClaim:", v32);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureGateClosedTime"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v33);
      -[_SFPBFlightLeg setDepartureGateClosedTime:](v5, "setDepartureGateClosedTime:", v34);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("departureRunwayTime"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v36 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v35);
      -[_SFPBFlightLeg setDepartureRunwayTime:](v5, "setDepartureRunwayTime:", v36);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalRunwayTime"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v37);
      -[_SFPBFlightLeg setArrivalRunwayTime:](v5, "setArrivalRunwayTime:", v38);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arrivalGateTime"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = -[_SFPBDate initWithDictionary:]([_SFPBDate alloc], "initWithDictionary:", v39);
      -[_SFPBFlightLeg setArrivalGateTime:](v5, "setArrivalGateTime:", v40);

    }
    v41 = v5;

  }
  return v5;
}

- (int)status
{
  return self->_status;
}

- (_SFPBDate)departurePublishedTime
{
  return self->_departurePublishedTime;
}

- (_SFPBDate)departureActualTime
{
  return self->_departureActualTime;
}

- (NSString)departureTerminal
{
  return self->_departureTerminal;
}

- (NSString)departureGate
{
  return self->_departureGate;
}

- (_SFPBAirport)departureAirport
{
  return self->_departureAirport;
}

- (_SFPBDate)arrivalPublishedTime
{
  return self->_arrivalPublishedTime;
}

- (_SFPBDate)arrivalActualTime
{
  return self->_arrivalActualTime;
}

- (NSString)arrivalTerminal
{
  return self->_arrivalTerminal;
}

- (NSString)arrivalGate
{
  return self->_arrivalGate;
}

- (_SFPBAirport)arrivalAirport
{
  return self->_arrivalAirport;
}

- (_SFPBAirport)divertedAirport
{
  return self->_divertedAirport;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)baggageClaim
{
  return self->_baggageClaim;
}

- (_SFPBDate)departureGateClosedTime
{
  return self->_departureGateClosedTime;
}

- (_SFPBDate)departureRunwayTime
{
  return self->_departureRunwayTime;
}

- (_SFPBDate)arrivalRunwayTime
{
  return self->_arrivalRunwayTime;
}

- (_SFPBDate)arrivalGateTime
{
  return self->_arrivalGateTime;
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
