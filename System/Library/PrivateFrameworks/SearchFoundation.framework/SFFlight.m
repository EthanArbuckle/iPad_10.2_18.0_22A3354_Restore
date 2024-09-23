@implementation SFFlight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFFlight)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFlight *v6;
  SFFlight *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBFlight initWithData:]([_SFPBFlight alloc], "initWithData:", v5);
  v7 = -[SFFlight initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBFlight *v6;

  v4 = a3;
  v6 = -[_SFPBFlight initWithFacade:]([_SFPBFlight alloc], "initWithFacade:", self);
  -[_SFPBFlight data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBFlight *v2;
  void *v3;

  v2 = -[_SFPBFlight initWithFacade:]([_SFPBFlight alloc], "initWithFacade:", self);
  -[_SFPBFlight dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBFlight *v2;
  void *v3;

  v2 = -[_SFPBFlight initWithFacade:]([_SFPBFlight alloc], "initWithFacade:", self);
  -[_SFPBFlight jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFFlight flightID](self, "flightID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setFlightID:", v6);

  -[SFFlight carrierCode](self, "carrierCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCarrierCode:", v8);

  -[SFFlight carrierName](self, "carrierName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCarrierName:", v10);

  -[SFFlight flightNumber](self, "flightNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setFlightNumber:", v12);

  -[SFFlight legs](self, "legs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setLegs:", v14);

  -[SFFlight operatorCarrierCode](self, "operatorCarrierCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setOperatorCarrierCode:", v16);

  -[SFFlight operatorFlightNumber](self, "operatorFlightNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setOperatorFlightNumber:", v18);

  -[SFFlight carrierPhoneNumber](self, "carrierPhoneNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setCarrierPhoneNumber:", v20);

  -[SFFlight carrierWebsite](self, "carrierWebsite");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setCarrierWebsite:", v22);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFFlight *v4;
  SFFlight *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
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

  v4 = (SFFlight *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFFlight isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFFlight flightID](self, "flightID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight flightID](v5, "flightID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v11 = 0;
LABEL_50:

        goto LABEL_51;
      }
      -[SFFlight flightID](self, "flightID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFFlight flightID](self, "flightID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight flightID](v5, "flightID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v79 = v10;
        v80 = v9;
      }
      -[SFFlight carrierCode](self, "carrierCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight carrierCode](v5, "carrierCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_46;
      -[SFFlight carrierCode](self, "carrierCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[SFFlight carrierCode](self, "carrierCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight carrierCode](v5, "carrierCode");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v15;
        if (!objc_msgSend(v15, "isEqual:", v76))
        {
LABEL_44:

LABEL_45:
          goto LABEL_46;
        }
      }
      v78 = v14;
      -[SFFlight carrierName](self, "carrierName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight carrierName](v5, "carrierName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_46:

          v11 = 0;
          if (!v8)
          {
LABEL_49:

            goto LABEL_50;
          }
          goto LABEL_47;
        }
        goto LABEL_44;
      }
      v73 = v16;
      v74 = v17;
      -[SFFlight carrierName](self, "carrierName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (v75)
      {
        -[SFFlight carrierName](self, "carrierName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight carrierName](v5, "carrierName");
        v71 = v18;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqual:", v72))
        {
LABEL_42:

LABEL_43:
          if (!v14)
            goto LABEL_46;
          goto LABEL_44;
        }
      }
      -[SFFlight flightNumber](self, "flightNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;
      -[SFFlight flightNumber](v5, "flightNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)v20 == (v21 != 0))
      {

        goto LABEL_41;
      }
      v69 = v21;
      v70 = v19;
      -[SFFlight flightNumber](self, "flightNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[SFFlight flightNumber](self, "flightNumber");
        v20 = objc_claimAutoreleasedReturnValue();
        -[SFFlight flightNumber](v5, "flightNumber");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend((id)v20, "isEqual:"))
          goto LABEL_39;
      }
      v68 = v22;
      v66 = (void *)v20;
      -[SFFlight legs](self, "legs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight legs](v5, "legs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v23 == 0) == (v24 != 0))
      {

        goto LABEL_38;
      }
      v64 = v23;
      v65 = v24;
      -[SFFlight legs](self, "legs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[SFFlight legs](self, "legs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight legs](v5, "legs");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "isEqual:"))
        {
LABEL_36:

LABEL_37:
LABEL_38:
          v20 = (uint64_t)v66;
          v22 = v68;
          if (!v68)
          {
LABEL_40:

LABEL_41:
            v14 = v78;
            if (!v75)
              goto LABEL_43;
            goto LABEL_42;
          }
LABEL_39:

          goto LABEL_40;
        }
      }
      v61 = v23;
      v63 = v25;
      -[SFFlight operatorCarrierCode](self, "operatorCarrierCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight operatorCarrierCode](v5, "operatorCarrierCode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v26 == 0) == (v27 != 0))
      {

        v23 = v61;
        if (!v25)
          goto LABEL_37;
        goto LABEL_36;
      }
      v58 = v27;
      v59 = v26;
      -[SFFlight operatorCarrierCode](self, "operatorCarrierCode");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        -[SFFlight operatorCarrierCode](self, "operatorCarrierCode");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight operatorCarrierCode](v5, "operatorCarrierCode");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v28;
        if (!objc_msgSend(v28, "isEqual:", v56))
          goto LABEL_58;
      }
      -[SFFlight operatorFlightNumber](self, "operatorFlightNumber");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight operatorFlightNumber](v5, "operatorFlightNumber");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v30 == 0) == (v31 != 0))
      {

        if (!v60)
        {
          v35 = v68;
LABEL_59:

          if (v25)
          {

          }
          v14 = v78;
          if (v35)
          {

          }
          if (v75)
          {

          }
          if (!v78)
            goto LABEL_45;
          goto LABEL_44;
        }
LABEL_58:
        v35 = v68;

        goto LABEL_59;
      }
      v54 = v30;
      v55 = v31;
      -[SFFlight operatorFlightNumber](self, "operatorFlightNumber");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        -[SFFlight operatorFlightNumber](self, "operatorFlightNumber");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight operatorFlightNumber](v5, "operatorFlightNumber");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v33;
        if (!objc_msgSend(v33, "isEqual:"))
        {
          v11 = 0;
          v34 = v63;
LABEL_82:

LABEL_83:
          if (v60)
          {

          }
          v41 = v34;
          if (v34)
          {
            v42 = v72;

          }
          else
          {
            v42 = v72;
          }

          if (v68)
          {

          }
          if (v75)
          {

          }
          if (v78)
          {

          }
          if (!v8)
            goto LABEL_49;
LABEL_47:
          v10 = v79;
          v9 = v80;
          goto LABEL_48;
        }
      }
      -[SFFlight carrierPhoneNumber](self, "carrierPhoneNumber");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight carrierPhoneNumber](v5, "carrierPhoneNumber");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v53 == 0) == (v36 != 0))
      {

        v11 = 0;
        goto LABEL_81;
      }
      v49 = v36;
      -[SFFlight carrierPhoneNumber](self, "carrierPhoneNumber");
      v50 = objc_claimAutoreleasedReturnValue();
      if (!v50
        || (-[SFFlight carrierPhoneNumber](self, "carrierPhoneNumber"),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFFlight carrierPhoneNumber](v5, "carrierPhoneNumber"),
            v47 = (void *)objc_claimAutoreleasedReturnValue(),
            v48 = v37,
            objc_msgSend(v37, "isEqual:")))
      {
        -[SFFlight carrierWebsite](self, "carrierWebsite");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFlight carrierWebsite](v5, "carrierWebsite");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v46 == 0) == (v45 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFFlight carrierWebsite](self, "carrierWebsite");
          v39 = objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v40 = (void *)v39;
            -[SFFlight carrierWebsite](self, "carrierWebsite");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFFlight carrierWebsite](v5, "carrierWebsite");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v44, "isEqual:", v43);

          }
          else
          {

            v11 = 1;
          }
        }
        v38 = (void *)v50;
        if (!v50)
          goto LABEL_80;
      }
      else
      {
        v11 = 0;
        v38 = (void *)v50;
      }

LABEL_80:
LABEL_81:
      v34 = v63;
      if (!v32)
        goto LABEL_83;
      goto LABEL_82;
    }
    v11 = 0;
  }
LABEL_51:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v21;

  -[SFFlight flightID](self, "flightID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "hash");
  -[SFFlight carrierCode](self, "carrierCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFFlight carrierName](self, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFFlight flightNumber](self, "flightNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[SFFlight legs](self, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SFFlight operatorCarrierCode](self, "operatorCarrierCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SFFlight operatorFlightNumber](self, "operatorFlightNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[SFFlight carrierPhoneNumber](self, "carrierPhoneNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[SFFlight carrierWebsite](self, "carrierWebsite");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (NSString)flightID
{
  return self->_flightID;
}

- (void)setFlightID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)carrierCode
{
  return self->_carrierCode;
}

- (void)setCarrierCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (void)setFlightNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)legs
{
  return self->_legs;
}

- (void)setLegs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)operatorCarrierCode
{
  return self->_operatorCarrierCode;
}

- (void)setOperatorCarrierCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)operatorFlightNumber
{
  return self->_operatorFlightNumber;
}

- (void)setOperatorFlightNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)carrierPhoneNumber
{
  return self->_carrierPhoneNumber;
}

- (void)setCarrierPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)carrierWebsite
{
  return self->_carrierWebsite;
}

- (void)setCarrierWebsite:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (SFFlight)initWithProtobuf:(id)a3
{
  id v4;
  SFFlight *v5;
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
  SFFlightLeg *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SFFlight *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFFlight;
  v5 = -[SFFlight init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "flightID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "flightID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setFlightID:](v5, "setFlightID:", v7);

    }
    objc_msgSend(v4, "carrierCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "carrierCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setCarrierCode:](v5, "setCarrierCode:", v9);

    }
    objc_msgSend(v4, "carrierName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "carrierName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setCarrierName:](v5, "setCarrierName:", v11);

    }
    objc_msgSend(v4, "flightNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "flightNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setFlightNumber:](v5, "setFlightNumber:", v13);

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
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
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
          v21 = -[SFFlightLeg initWithProtobuf:]([SFFlightLeg alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v18);
    }

    -[SFFlight setLegs:](v5, "setLegs:", v15);
    objc_msgSend(v4, "operatorCarrierCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "operatorCarrierCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setOperatorCarrierCode:](v5, "setOperatorCarrierCode:", v23);

    }
    objc_msgSend(v4, "operatorFlightNumber");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "operatorFlightNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setOperatorFlightNumber:](v5, "setOperatorFlightNumber:", v25);

    }
    objc_msgSend(v4, "carrierPhoneNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "carrierPhoneNumber");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setCarrierPhoneNumber:](v5, "setCarrierPhoneNumber:", v27);

    }
    objc_msgSend(v4, "carrierWebsite");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "carrierWebsite");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFlight setCarrierWebsite:](v5, "setCarrierWebsite:", v29);

    }
    v30 = v5;

  }
  return v5;
}

@end
