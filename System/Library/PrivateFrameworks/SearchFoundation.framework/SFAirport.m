@implementation SFAirport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAirport *v6;
  SFAirport *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAirport initWithData:]([_SFPBAirport alloc], "initWithData:", v5);
  v7 = -[SFAirport initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAirport *v6;

  v4 = a3;
  v6 = -[_SFPBAirport initWithFacade:]([_SFPBAirport alloc], "initWithFacade:", self);
  -[_SFPBAirport data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAirport *v2;
  void *v3;

  v2 = -[_SFPBAirport initWithFacade:]([_SFPBAirport alloc], "initWithFacade:", self);
  -[_SFPBAirport dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAirport *v2;
  void *v3;

  v2 = -[_SFPBAirport initWithFacade:]([_SFPBAirport alloc], "initWithFacade:", self);
  -[_SFPBAirport jsonData](v2, "jsonData");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFAirport code](self, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCode:", v6);

  -[SFAirport timezone](self, "timezone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTimezone:", v8);

  -[SFAirport location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLocation:", v10);

  -[SFAirport city](self, "city");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setCity:", v12);

  -[SFAirport street](self, "street");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setStreet:", v14);

  -[SFAirport district](self, "district");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setDistrict:", v16);

  -[SFAirport state](self, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setState:", v18);

  -[SFAirport postalCode](self, "postalCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setPostalCode:", v20);

  -[SFAirport countryCode](self, "countryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setCountryCode:", v22);

  -[SFAirport country](self, "country");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setCountry:", v24);

  -[SFAirport name](self, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setName:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAirport *v4;
  SFAirport *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  void *v20;
  SFAirport *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  SFAirport *v46;
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
  __int128 v99;
  _QWORD v100[6];
  int v101;
  int v102;
  id v103;
  id v104;
  _QWORD v105[4];

  v4 = (SFAirport *)a3;
  if (self == v4)
  {
    v18 = 1;
    goto LABEL_78;
  }
  if (!-[SFAirport isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v18 = 0;
    goto LABEL_78;
  }
  v5 = v4;
  -[SFAirport code](self, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport code](v5, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v7;
  v104 = v6;
  v101 = v7 != 0;
  v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  -[SFAirport code](self, "code");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    -[SFAirport code](self, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport code](v5, "code");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport timezone](self, "timezone");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport timezone](v5, "timezone");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    *(_QWORD *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  -[SFAirport timezone](self, "timezone");
  v19 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    -[SFAirport timezone](self, "timezone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport timezone](v5, "timezone");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 28);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport location](self, "location");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport location](v5, "location");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 28);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  -[SFAirport location](self, "location");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    -[SFAirport location](self, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport location](v5, "location");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 24);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport city](self, "city");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport city](v5, "city");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    memset(v105, 0, 24);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  -[SFAirport city](self, "city");
  v30 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    -[SFAirport city](self, "city");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport city](v5, "city");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport street](self, "street");
  v32 = objc_claimAutoreleasedReturnValue();
  -[SFAirport street](v5, "street");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    v99 = 0uLL;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  -[SFAirport street](self, "street");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    -[SFAirport street](self, "street");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport street](v5, "street");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      v99 = 0uLL;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      memset(v105, 0, 20);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  -[SFAirport district](self, "district");
  v36 = objc_claimAutoreleasedReturnValue();
  -[SFAirport district](v5, "district");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(_QWORD *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    memset(v105, 0, 20);
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFAirport district](self, "district");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    -[SFAirport district](self, "district");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport district](v5, "district");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(_QWORD *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport state](self, "state");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport state](v5, "state");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(_QWORD *)&v99 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((_QWORD *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  -[SFAirport state](self, "state");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    -[SFAirport state](self, "state");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport state](v5, "state");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(_QWORD *)&v99 = 0;
      v11 = 0;
      *(_QWORD *)((char *)v105 + 4) = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      LODWORD(v105[0]) = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  -[SFAirport postalCode](self, "postalCode");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirport postalCode](v5, "postalCode");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v67 == 0) == (v66 != 0))
  {
    v11 = 0;
    *(_QWORD *)((char *)v105 + 4) = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    LODWORD(v105[0]) = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  -[SFAirport postalCode](self, "postalCode");
  v39 = objc_claimAutoreleasedReturnValue();
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || (-[SFAirport postalCode](self, "postalCode"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFAirport postalCode](v5, "postalCode"),
        v59 = (void *)objc_claimAutoreleasedReturnValue(),
        v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    -[SFAirport countryCode](self, "countryCode");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirport countryCode](v5, "countryCode");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v62 == 0) == (v61 != 0))
    {
      v12 = 0;
      v105[0] = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((_QWORD *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      v11 = 1;
      *(_QWORD *)&v99 = 0x100000001;
    }
    else
    {
      -[SFAirport countryCode](self, "countryCode");
      v41 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v105[0]) = v41 != 0;
      v58 = (void *)v41;
      if (!v41
        || (-[SFAirport countryCode](self, "countryCode"),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFAirport countryCode](v46, "countryCode"),
            v54 = (void *)objc_claimAutoreleasedReturnValue(),
            v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        -[SFAirport country](self, "country");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAirport country](v46, "country");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v57 == 0) == (v56 != 0))
        {
          v14 = 0;
          LODWORD(v105[0]) = 0;
          v15 = 0;
          v16 = 0;
          v17 = 0;
          v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((_QWORD *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(_QWORD *)&v99 = 0x100000001;
          v11 = 1;
          v12 = 1;
          v13 = 1;
        }
        else
        {
          -[SFAirport country](self, "country");
          v43 = objc_claimAutoreleasedReturnValue();
          LODWORD(v105[0]) = v43 != 0;
          v53 = (void *)v43;
          if (!v43
            || (-[SFAirport country](self, "country"),
                v44 = (void *)objc_claimAutoreleasedReturnValue(),
                -[SFAirport country](v46, "country"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            -[SFAirport name](self, "name");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFAirport name](v46, "name");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v52 == 0) == (v51 != 0))
            {
              v16 = 0;
              v17 = 0;
              v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
            }
            else
            {
              -[SFAirport name](self, "name");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                -[SFAirport name](self, "name");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = v46;
                -[SFAirport name](v46, "name");
                v7 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v45;
                v18 = objc_msgSend(v45, "isEqual:", v7);
                v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((_QWORD *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(_QWORD *)&v99 = 0x100000001;
                v11 = 1;
                v12 = 1;
                v13 = 1;
                v14 = 1;
                v15 = 1;
                v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((_QWORD *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99 = 0x100000001;
              v11 = 1;
              v12 = 1;
              v13 = 1;
              v14 = 1;
              v15 = 1;
              v16 = 1;
              v18 = 1;
            }
          }
          else
          {
            v15 = 0;
            v16 = 0;
            v17 = 0;
            v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((_QWORD *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(_QWORD *)&v99 = 0x100000001;
            v11 = 1;
            v12 = 1;
            v13 = 1;
            v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        v13 = 0;
        v14 = 0;
        v105[0] = 0x100000000;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((_QWORD *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99 = 0x100000001;
        v11 = 1;
        v12 = 1;
      }
    }
  }
  else
  {
    v12 = 0;
    v105[0] = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(_QWORD *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  v5 = v46;
LABEL_15:
  if (v17)
  {
    v21 = v5;
    v22 = v11;
    v23 = v13;
    v24 = v12;
    v25 = v14;
    v26 = v15;
    v27 = v16;

    v16 = v27;
    v15 = v26;
    v14 = v25;
    v12 = v24;
    v13 = v23;
    v11 = v22;
    v5 = v21;
  }
  if (v16)

  if (v15)
  {

  }
  if (LODWORD(v105[0]))
  {

    if (!v14)
      goto LABEL_23;
LABEL_80:

    if (!v13)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v14)
    goto LABEL_80;
LABEL_23:
  if (v13)
  {
LABEL_24:

  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {

  }
  if (v12)

  if (DWORD1(v99))
  {

  }
  if (LODWORD(v105[1]))
  {

  }
  if (v11)

  if ((_DWORD)v99)
  {

  }
  if (HIDWORD(v105[1]))
  {

  }
  if (LODWORD(v100[0]))

  if (DWORD2(v99))
  {

  }
  if (LODWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[0]))

  if (HIDWORD(v99))
  {

  }
  if (LODWORD(v100[5]))
  {

  }
  if (HIDWORD(v100[1]))

  if (LODWORD(v100[1]))
  {

  }
  if (HIDWORD(v105[2]))
  {

  }
  if (HIDWORD(v100[2]))

  if (LODWORD(v100[2]))
  {

  }
  if (LODWORD(v105[3]))
  {

  }
  if (HIDWORD(v100[3]))

  if (LODWORD(v100[3]))
  {

  }
  if (HIDWORD(v105[3]))
  {

  }
  if (LODWORD(v100[4]))

  if (HIDWORD(v100[4]))
  {

  }
  if (HIDWORD(v100[5]))
  {

  }
  if (v102 != v101)

LABEL_78:
  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v23;
  void *v24;
  void *v25;

  -[SFAirport code](self, "code");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[SFAirport timezone](self, "timezone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v24, "hash") ^ v3;
  -[SFAirport location](self, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v23, "hash");
  -[SFAirport city](self, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[SFAirport street](self, "street");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFAirport district](self, "district");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[SFAirport state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[SFAirport postalCode](self, "postalCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFAirport countryCode](self, "countryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[SFAirport country](self, "country");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[SFAirport name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13 ^ v19 ^ objc_msgSend(v20, "hash");

  return v21;
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSTimeZone)timezone
{
  return self->_timezone;
}

- (void)setTimezone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)district
{
  return self->_district;
}

- (void)setDistrict:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_district, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

- (SFAirport)initWithProtobuf:(id)a3
{
  id v4;
  SFAirport *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SFLatLng *v12;
  void *v13;
  SFLatLng *v14;
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
  SFAirport *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SFAirport;
  v5 = -[SFAirport init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "code");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setCode:](v5, "setCode:", v7);

    }
    objc_msgSend(v4, "timezone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "timezone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBTimeZoneHandwrittenTranslator(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setTimezone:](v5, "setTimezone:", v10);

    }
    objc_msgSend(v4, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [SFLatLng alloc];
      objc_msgSend(v4, "location");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SFLatLng initWithProtobuf:](v12, "initWithProtobuf:", v13);
      -[SFAirport setLocation:](v5, "setLocation:", v14);

    }
    objc_msgSend(v4, "city");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "city");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setCity:](v5, "setCity:", v16);

    }
    objc_msgSend(v4, "street");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "street");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setStreet:](v5, "setStreet:", v18);

    }
    objc_msgSend(v4, "district");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "district");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setDistrict:](v5, "setDistrict:", v20);

    }
    objc_msgSend(v4, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v4, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setState:](v5, "setState:", v22);

    }
    objc_msgSend(v4, "postalCode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "postalCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setPostalCode:](v5, "setPostalCode:", v24);

    }
    objc_msgSend(v4, "countryCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "countryCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setCountryCode:](v5, "setCountryCode:", v26);

    }
    objc_msgSend(v4, "country");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "country");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setCountry:](v5, "setCountry:", v28);

    }
    objc_msgSend(v4, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirport setName:](v5, "setName:", v30);

    }
    v31 = v5;
  }

  return v5;
}

@end
