@implementation PPPBLabeledPostalAddress

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (BOOL)hasSubLocality
{
  return self->_subLocality != 0;
}

- (BOOL)hasCity
{
  return self->_city != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPPBLabeledPostalAddress;
  -[PPPBLabeledPostalAddress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBLabeledPostalAddress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *label;
  NSString *street;
  NSString *subLocality;
  NSString *city;
  NSString *subAdministrativeArea;
  NSString *state;
  NSString *postalCode;
  NSString *country;
  NSString *isoCountryCode;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  street = self->_street;
  if (street)
    objc_msgSend(v4, "setObject:forKey:", street, CFSTR("street"));
  subLocality = self->_subLocality;
  if (subLocality)
    objc_msgSend(v4, "setObject:forKey:", subLocality, CFSTR("subLocality"));
  city = self->_city;
  if (city)
    objc_msgSend(v4, "setObject:forKey:", city, CFSTR("city"));
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea)
    objc_msgSend(v4, "setObject:forKey:", subAdministrativeArea, CFSTR("subAdministrativeArea"));
  state = self->_state;
  if (state)
    objc_msgSend(v4, "setObject:forKey:", state, CFSTR("state"));
  postalCode = self->_postalCode;
  if (postalCode)
    objc_msgSend(v4, "setObject:forKey:", postalCode, CFSTR("postalCode"));
  country = self->_country;
  if (country)
    objc_msgSend(v4, "setObject:forKey:", country, CFSTR("country"));
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
    objc_msgSend(v4, "setObject:forKey:", isoCountryCode, CFSTR("isoCountryCode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBLabeledPostalAddressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subLocality)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_postalCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v5;
  }
  if (self->_street)
  {
    objc_msgSend(v5, "setStreet:");
    v4 = v5;
  }
  if (self->_subLocality)
  {
    objc_msgSend(v5, "setSubLocality:");
    v4 = v5;
  }
  if (self->_city)
  {
    objc_msgSend(v5, "setCity:");
    v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    objc_msgSend(v5, "setSubAdministrativeArea:");
    v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
    v4 = v5;
  }
  if (self->_postalCode)
  {
    objc_msgSend(v5, "setPostalCode:");
    v4 = v5;
  }
  if (self->_country)
  {
    objc_msgSend(v5, "setCountry:");
    v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_street, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  v10 = -[NSString copyWithZone:](self->_subLocality, "copyWithZone:", a3);
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  v14 = -[NSString copyWithZone:](self->_subAdministrativeArea, "copyWithZone:", a3);
  v15 = (void *)v5[8];
  v5[8] = v14;

  v16 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  v20 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v21 = (void *)v5[2];
  v5[2] = v20;

  v22 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *label;
  NSString *street;
  NSString *subLocality;
  NSString *city;
  NSString *subAdministrativeArea;
  NSString *state;
  NSString *postalCode;
  NSString *country;
  NSString *isoCountryCode;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  label = self->_label;
  if ((unint64_t)label | v4[4])
  {
    if (!-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_20;
  }
  if (((street = self->_street, !((unint64_t)street | v4[7]))
     || -[NSString isEqual:](street, "isEqual:"))
    && ((subLocality = self->_subLocality, !((unint64_t)subLocality | v4[9]))
     || -[NSString isEqual:](subLocality, "isEqual:"))
    && ((city = self->_city, !((unint64_t)city | v4[1])) || -[NSString isEqual:](city, "isEqual:"))
    && ((subAdministrativeArea = self->_subAdministrativeArea, !((unint64_t)subAdministrativeArea | v4[8]))
     || -[NSString isEqual:](subAdministrativeArea, "isEqual:"))
    && ((state = self->_state, !((unint64_t)state | v4[6]))
     || -[NSString isEqual:](state, "isEqual:"))
    && ((postalCode = self->_postalCode, !((unint64_t)postalCode | v4[5]))
     || -[NSString isEqual:](postalCode, "isEqual:"))
    && ((country = self->_country, !((unint64_t)country | v4[2]))
     || -[NSString isEqual:](country, "isEqual:")))
  {
    isoCountryCode = self->_isoCountryCode;
    if ((unint64_t)isoCountryCode | v4[3])
      v14 = -[NSString isEqual:](isoCountryCode, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_label, "hash");
  v4 = -[NSString hash](self->_street, "hash") ^ v3;
  v5 = -[NSString hash](self->_subLocality, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_city, "hash");
  v7 = -[NSString hash](self->_subAdministrativeArea, "hash");
  v8 = v7 ^ -[NSString hash](self->_state, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_postalCode, "hash");
  v10 = -[NSString hash](self->_country, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_isoCountryCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[PPPBLabeledPostalAddress setLabel:](self, "setLabel:");
  if (v4[7])
    -[PPPBLabeledPostalAddress setStreet:](self, "setStreet:");
  if (v4[9])
    -[PPPBLabeledPostalAddress setSubLocality:](self, "setSubLocality:");
  if (v4[1])
    -[PPPBLabeledPostalAddress setCity:](self, "setCity:");
  if (v4[8])
    -[PPPBLabeledPostalAddress setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  if (v4[6])
    -[PPPBLabeledPostalAddress setState:](self, "setState:");
  if (v4[5])
    -[PPPBLabeledPostalAddress setPostalCode:](self, "setPostalCode:");
  if (v4[2])
    -[PPPBLabeledPostalAddress setCountry:](self, "setCountry:");
  if (v4[3])
    -[PPPBLabeledPostalAddress setIsoCountryCode:](self, "setIsoCountryCode:");

}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
  objc_storeStrong((id *)&self->_street, a3);
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
  objc_storeStrong((id *)&self->_subLocality, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end
