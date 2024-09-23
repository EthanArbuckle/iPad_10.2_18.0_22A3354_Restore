@implementation _SFPBFlight

- (_SFPBFlight)initWithFacade:(id)a3
{
  id v4;
  _SFPBFlight *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _SFPBFlightLeg *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _SFPBFlight *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBFlight init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "flightID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "flightID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setFlightID:](v5, "setFlightID:", v7);

    }
    objc_msgSend(v4, "carrierCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "carrierCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setCarrierCode:](v5, "setCarrierCode:", v9);

    }
    objc_msgSend(v4, "carrierName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "carrierName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setCarrierName:](v5, "setCarrierName:", v11);

    }
    objc_msgSend(v4, "flightNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "flightNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setFlightNumber:](v5, "setFlightNumber:", v13);

    }
    objc_msgSend(v4, "legs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "legs", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = -[_SFPBFlightLeg initWithFacade:]([_SFPBFlightLeg alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v18);
    }

    -[_SFPBFlight setLegs:](v5, "setLegs:", v15);
    objc_msgSend(v4, "operatorCarrierCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "operatorCarrierCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setOperatorCarrierCode:](v5, "setOperatorCarrierCode:", v23);

    }
    objc_msgSend(v4, "operatorFlightNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "operatorFlightNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setOperatorFlightNumber:](v5, "setOperatorFlightNumber:", v25);

    }
    objc_msgSend(v4, "carrierPhoneNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "carrierPhoneNumber");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setCarrierPhoneNumber:](v5, "setCarrierPhoneNumber:", v27);

    }
    objc_msgSend(v4, "carrierWebsite");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "carrierWebsite");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBFlight setCarrierWebsite:](v5, "setCarrierWebsite:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (void)setFlightID:(id)a3
{
  NSString *v4;
  NSString *flightID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  flightID = self->_flightID;
  self->_flightID = v4;

}

- (void)setCarrierCode:(id)a3
{
  NSString *v4;
  NSString *carrierCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carrierCode = self->_carrierCode;
  self->_carrierCode = v4;

}

- (void)setCarrierName:(id)a3
{
  NSString *v4;
  NSString *carrierName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carrierName = self->_carrierName;
  self->_carrierName = v4;

}

- (void)setFlightNumber:(id)a3
{
  NSString *v4;
  NSString *flightNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  flightNumber = self->_flightNumber;
  self->_flightNumber = v4;

}

- (void)setLegs:(id)a3
{
  NSArray *v4;
  NSArray *legs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  legs = self->_legs;
  self->_legs = v4;

}

- (void)clearLegs
{
  -[NSArray removeAllObjects](self->_legs, "removeAllObjects");
}

- (void)addLegs:(id)a3
{
  id v4;
  NSArray *legs;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  legs = self->_legs;
  v8 = v4;
  if (!legs)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_legs;
    self->_legs = v6;

    v4 = v8;
    legs = self->_legs;
  }
  -[NSArray addObject:](legs, "addObject:", v4);

}

- (unint64_t)legsCount
{
  return -[NSArray count](self->_legs, "count");
}

- (id)legsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_legs, "objectAtIndexedSubscript:", a3);
}

- (void)setOperatorCarrierCode:(id)a3
{
  NSString *v4;
  NSString *operatorCarrierCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  operatorCarrierCode = self->_operatorCarrierCode;
  self->_operatorCarrierCode = v4;

}

- (void)setOperatorFlightNumber:(id)a3
{
  NSString *v4;
  NSString *operatorFlightNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  operatorFlightNumber = self->_operatorFlightNumber;
  self->_operatorFlightNumber = v4;

}

- (void)setCarrierPhoneNumber:(id)a3
{
  NSString *v4;
  NSString *carrierPhoneNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carrierPhoneNumber = self->_carrierPhoneNumber;
  self->_carrierPhoneNumber = v4;

}

- (void)setCarrierWebsite:(id)a3
{
  NSString *v4;
  NSString *carrierWebsite;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  carrierWebsite = self->_carrierWebsite;
  self->_carrierWebsite = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBFlight flightID](self, "flightID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBFlight carrierCode](self, "carrierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBFlight carrierName](self, "carrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBFlight flightNumber](self, "flightNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBFlight legs](self, "legs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[_SFPBFlight operatorCarrierCode](self, "operatorCarrierCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBFlight operatorFlightNumber](self, "operatorFlightNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBFlight carrierPhoneNumber](self, "carrierPhoneNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBFlight carrierWebsite](self, "carrierWebsite");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[_SFPBFlight flightID](self, "flightID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight flightID](self, "flightID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBFlight flightID](self, "flightID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight carrierCode](self, "carrierCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight carrierCode](self, "carrierCode");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBFlight carrierCode](self, "carrierCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carrierCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight carrierName](self, "carrierName");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBFlight carrierName](self, "carrierName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carrierName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight flightNumber](self, "flightNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight flightNumber](self, "flightNumber");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBFlight flightNumber](self, "flightNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flightNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight legs](self, "legs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight legs](self, "legs");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBFlight legs](self, "legs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight operatorCarrierCode](self, "operatorCarrierCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operatorCarrierCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight operatorCarrierCode](self, "operatorCarrierCode");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBFlight operatorCarrierCode](self, "operatorCarrierCode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operatorCarrierCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight operatorFlightNumber](self, "operatorFlightNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operatorFlightNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight operatorFlightNumber](self, "operatorFlightNumber");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBFlight operatorFlightNumber](self, "operatorFlightNumber");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operatorFlightNumber");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight carrierPhoneNumber](self, "carrierPhoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierPhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_46;
  -[_SFPBFlight carrierPhoneNumber](self, "carrierPhoneNumber");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBFlight carrierPhoneNumber](self, "carrierPhoneNumber");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carrierPhoneNumber");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_47;
  }
  else
  {

  }
  -[_SFPBFlight carrierWebsite](self, "carrierWebsite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierWebsite");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBFlight carrierWebsite](self, "carrierWebsite");
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
    {

LABEL_50:
      v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    -[_SFPBFlight carrierWebsite](self, "carrierWebsite");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carrierWebsite");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if ((v51 & 1) != 0)
      goto LABEL_50;
  }
  else
  {
LABEL_46:

  }
LABEL_47:
  v52 = 0;
LABEL_48:

  return v52;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_flightID, "hash");
  v4 = -[NSString hash](self->_carrierCode, "hash") ^ v3;
  v5 = -[NSString hash](self->_carrierName, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_flightNumber, "hash");
  v7 = -[NSArray hash](self->_legs, "hash");
  v8 = v7 ^ -[NSString hash](self->_operatorCarrierCode, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_operatorFlightNumber, "hash");
  v10 = -[NSString hash](self->_carrierPhoneNumber, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_carrierWebsite, "hash");
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
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_carrierCode)
  {
    -[_SFPBFlight carrierCode](self, "carrierCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carrierCode"));

  }
  if (self->_carrierName)
  {
    -[_SFPBFlight carrierName](self, "carrierName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("carrierName"));

  }
  if (self->_carrierPhoneNumber)
  {
    -[_SFPBFlight carrierPhoneNumber](self, "carrierPhoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("carrierPhoneNumber"));

  }
  if (self->_carrierWebsite)
  {
    -[_SFPBFlight carrierWebsite](self, "carrierWebsite");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("carrierWebsite"));

  }
  if (self->_flightID)
  {
    -[_SFPBFlight flightID](self, "flightID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("flightID"));

  }
  if (self->_flightNumber)
  {
    -[_SFPBFlight flightNumber](self, "flightNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("flightNumber"));

  }
  if (-[NSArray count](self->_legs, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_legs;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v29);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            objc_msgSend(v16, "addObject:", v22);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("legs"));
  }
  if (self->_operatorCarrierCode)
  {
    -[_SFPBFlight operatorCarrierCode](self, "operatorCarrierCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("operatorCarrierCode"));

  }
  if (self->_operatorFlightNumber)
  {
    -[_SFPBFlight operatorFlightNumber](self, "operatorFlightNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("operatorFlightNumber"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBFlight dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBFlight)initWithJSON:(id)a3
{
  void *v4;
  _SFPBFlight *v5;
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
    self = -[_SFPBFlight initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBFlight)initWithDictionary:(id)a3
{
  id v4;
  _SFPBFlight *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _SFPBFlightLeg *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _SFPBFlight *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_SFPBFlight;
  v5 = -[_SFPBFlight init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flightID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBFlight setFlightID:](v5, "setFlightID:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carrierCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBFlight setCarrierCode:](v5, "setCarrierCode:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carrierName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBFlight setCarrierName:](v5, "setCarrierName:", v11);

    }
    v35 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flightNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBFlight setFlightNumber:](v5, "setFlightNumber:", v13);

    }
    v34 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = v8;
      v33 = v6;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = -[_SFPBFlightLeg initWithDictionary:]([_SFPBFlightLeg alloc], "initWithDictionary:", v20);
              -[_SFPBFlight addLegs:](v5, "addLegs:", v21);

            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v17);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operatorCarrierCode"), v32, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBFlight setOperatorCarrierCode:](v5, "setOperatorCarrierCode:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operatorFlightNumber"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBFlight setOperatorFlightNumber:](v5, "setOperatorFlightNumber:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carrierPhoneNumber"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBFlight setCarrierPhoneNumber:](v5, "setCarrierPhoneNumber:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("carrierWebsite"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBFlight setCarrierWebsite:](v5, "setCarrierWebsite:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (NSString)flightID
{
  return self->_flightID;
}

- (NSString)carrierCode
{
  return self->_carrierCode;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (NSArray)legs
{
  return self->_legs;
}

- (NSString)operatorCarrierCode
{
  return self->_operatorCarrierCode;
}

- (NSString)operatorFlightNumber
{
  return self->_operatorFlightNumber;
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (NSString)carrierWebsite
{
  return self->_carrierWebsite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierWebsite, 0);
  objc_storeStrong((id *)&self->_carrierPhoneNumber, 0);
  objc_storeStrong((id *)&self->_operatorFlightNumber, 0);
  objc_storeStrong((id *)&self->_operatorCarrierCode, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_carrierCode, 0);
  objc_storeStrong((id *)&self->_flightID, 0);
}

@end
