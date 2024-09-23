@implementation _SFPBAirport

- (_SFPBAirport)initWithFacade:(id)a3
{
  id v4;
  _SFPBAirport *v5;
  void *v6;
  void *v7;
  void *v8;
  _SFPBTimeZone *v9;
  void *v10;
  _SFPBTimeZone *v11;
  void *v12;
  _SFPBLatLng *v13;
  void *v14;
  _SFPBLatLng *v15;
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
  _SFPBAirport *v32;

  v4 = a3;
  v5 = -[_SFPBAirport init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "code");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setCode:](v5, "setCode:", v7);

    }
    objc_msgSend(v4, "timezone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [_SFPBTimeZone alloc];
      objc_msgSend(v4, "timezone");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_SFPBTimeZone initWithNSTimeZone:](v9, "initWithNSTimeZone:", v10);
      -[_SFPBAirport setTimezone:](v5, "setTimezone:", v11);

    }
    objc_msgSend(v4, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_SFPBLatLng initWithFacade:](v13, "initWithFacade:", v14);
      -[_SFPBAirport setLocation:](v5, "setLocation:", v15);

    }
    objc_msgSend(v4, "city");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "city");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setCity:](v5, "setCity:", v17);

    }
    objc_msgSend(v4, "street");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "street");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setStreet:](v5, "setStreet:", v19);

    }
    objc_msgSend(v4, "district");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "district");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setDistrict:](v5, "setDistrict:", v21);

    }
    objc_msgSend(v4, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "state");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setState:](v5, "setState:", v23);

    }
    objc_msgSend(v4, "postalCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "postalCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setPostalCode:](v5, "setPostalCode:", v25);

    }
    objc_msgSend(v4, "countryCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "countryCode");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setCountryCode:](v5, "setCountryCode:", v27);

    }
    objc_msgSend(v4, "country");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "country");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setCountry:](v5, "setCountry:", v29);

    }
    objc_msgSend(v4, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBAirport setName:](v5, "setName:", v31);

    }
    v32 = v5;
  }

  return v5;
}

- (void)setCode:(id)a3
{
  NSString *v4;
  NSString *code;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  code = self->_code;
  self->_code = v4;

}

- (void)setTimezone:(id)a3
{
  objc_storeStrong((id *)&self->_timezone, a3);
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setCity:(id)a3
{
  NSString *v4;
  NSString *city;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  city = self->_city;
  self->_city = v4;

}

- (void)setStreet:(id)a3
{
  NSString *v4;
  NSString *street;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  street = self->_street;
  self->_street = v4;

}

- (void)setDistrict:(id)a3
{
  NSString *v4;
  NSString *district;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  district = self->_district;
  self->_district = v4;

}

- (void)setState:(id)a3
{
  NSString *v4;
  NSString *state;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  state = self->_state;
  self->_state = v4;

}

- (void)setPostalCode:(id)a3
{
  NSString *v4;
  NSString *postalCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  postalCode = self->_postalCode;
  self->_postalCode = v4;

}

- (void)setCountryCode:(id)a3
{
  NSString *v4;
  NSString *countryCode;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  countryCode = self->_countryCode;
  self->_countryCode = v4;

}

- (void)setCountry:(id)a3
{
  NSString *v4;
  NSString *country;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  country = self->_country;
  self->_country = v4;

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAirportReadFrom(self, (uint64_t)a3);
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
  id v15;

  v15 = a3;
  -[_SFPBAirport code](self, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBAirport timezone](self, "timezone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBAirport location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBAirport city](self, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBAirport street](self, "street");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    PBDataWriterWriteStringField();

  -[_SFPBAirport district](self, "district");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    PBDataWriterWriteStringField();

  -[_SFPBAirport state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PBDataWriterWriteStringField();

  -[_SFPBAirport postalCode](self, "postalCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    PBDataWriterWriteStringField();

  -[_SFPBAirport countryCode](self, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  -[_SFPBAirport country](self, "country");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteStringField();

  -[_SFPBAirport name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
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
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  BOOL v62;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  -[_SFPBAirport code](self, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport code](self, "code");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBAirport code](self, "code");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport timezone](self, "timezone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timezone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport timezone](self, "timezone");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBAirport timezone](self, "timezone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timezone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport location](self, "location");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBAirport location](self, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport city](self, "city");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBAirport city](self, "city");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "city");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport street](self, "street");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "street");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport street](self, "street");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBAirport street](self, "street");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "street");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport district](self, "district");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "district");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport district](self, "district");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBAirport district](self, "district");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "district");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport state](self, "state");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_SFPBAirport state](self, "state");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "state");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport postalCode](self, "postalCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport postalCode](self, "postalCode");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    -[_SFPBAirport postalCode](self, "postalCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postalCode");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v44, "isEqual:", v45);

    if (!v46)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport countryCode](self, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport countryCode](self, "countryCode");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_SFPBAirport countryCode](self, "countryCode");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport country](self, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_56;
  -[_SFPBAirport country](self, "country");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_SFPBAirport country](self, "country");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "country");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_57;
  }
  else
  {

  }
  -[_SFPBAirport name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBAirport name](self, "name");
    v57 = objc_claimAutoreleasedReturnValue();
    if (!v57)
    {

LABEL_60:
      v62 = 1;
      goto LABEL_58;
    }
    v58 = (void *)v57;
    -[_SFPBAirport name](self, "name");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if ((v61 & 1) != 0)
      goto LABEL_60;
  }
  else
  {
LABEL_56:

  }
LABEL_57:
  v62 = 0;
LABEL_58:

  return v62;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_code, "hash");
  v4 = -[_SFPBTimeZone hash](self->_timezone, "hash") ^ v3;
  v5 = -[_SFPBLatLng hash](self->_location, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_city, "hash");
  v7 = -[NSString hash](self->_street, "hash");
  v8 = v7 ^ -[NSString hash](self->_district, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_state, "hash");
  v10 = -[NSString hash](self->_postalCode, "hash");
  v11 = v10 ^ -[NSString hash](self->_countryCode, "hash");
  v12 = v11 ^ -[NSString hash](self->_country, "hash");
  return v9 ^ v12 ^ -[NSString hash](self->_name, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_city)
  {
    -[_SFPBAirport city](self, "city");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("city"));

  }
  if (self->_code)
  {
    -[_SFPBAirport code](self, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("code"));

  }
  if (self->_country)
  {
    -[_SFPBAirport country](self, "country");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("country"));

  }
  if (self->_countryCode)
  {
    -[_SFPBAirport countryCode](self, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("countryCode"));

  }
  if (self->_district)
  {
    -[_SFPBAirport district](self, "district");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("district"));

  }
  if (self->_location)
  {
    -[_SFPBAirport location](self, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("location"));

    }
  }
  if (self->_name)
  {
    -[_SFPBAirport name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("name"));

  }
  if (self->_postalCode)
  {
    -[_SFPBAirport postalCode](self, "postalCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("postalCode"));

  }
  if (self->_state)
  {
    -[_SFPBAirport state](self, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("state"));

  }
  if (self->_street)
  {
    -[_SFPBAirport street](self, "street");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("street"));

  }
  if (self->_timezone)
  {
    -[_SFPBAirport timezone](self, "timezone");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("timezone"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("timezone"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBAirport dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBAirport)initWithJSON:(id)a3
{
  void *v4;
  _SFPBAirport *v5;
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
    self = -[_SFPBAirport initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBAirport)initWithDictionary:(id)a3
{
  id v4;
  _SFPBAirport *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _SFPBTimeZone *v9;
  uint64_t v10;
  _SFPBLatLng *v11;
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
  _SFPBAirport *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPBAirport;
  v5 = -[_SFPBAirport init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBAirport setCode:](v5, "setCode:", v7);

    }
    v33 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timezone"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBTimeZone initWithDictionary:]([_SFPBTimeZone alloc], "initWithDictionary:", v8);
      -[_SFPBAirport setTimezone:](v5, "setTimezone:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v10);
      -[_SFPBAirport setLocation:](v5, "setLocation:", v11);

    }
    v31 = (void *)v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("city"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBAirport setCity:](v5, "setCity:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("street"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (void *)objc_msgSend(v14, "copy");
      -[_SFPBAirport setStreet:](v5, "setStreet:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("district"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(v16, "copy");
      -[_SFPBAirport setDistrict:](v5, "setDistrict:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v18, "copy");
      -[_SFPBAirport setState:](v5, "setState:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("postalCode"), v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[_SFPBAirport setPostalCode:](v5, "setPostalCode:", v21);

    }
    v32 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBAirport setCountryCode:](v5, "setCountryCode:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("country"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBAirport setCountry:](v5, "setCountry:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBAirport setName:](v5, "setName:", v27);

    }
    v28 = v5;

  }
  return v5;
}

- (NSString)code
{
  return self->_code;
}

- (_SFPBTimeZone)timezone
{
  return self->_timezone;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)district
{
  return self->_district;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)name
{
  return self->_name;
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

@end
