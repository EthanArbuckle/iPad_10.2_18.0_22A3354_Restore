@implementation PPPostalAddress

- (PPPostalAddress)initWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10
{
  id v17;
  PPPostalAddress *v18;
  PPPostalAddress *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PPPostalAddress;
  v18 = -[PPPostalAddress init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_thoroughfare, a3);
    objc_storeStrong((id *)&v19->_subThoroughfare, a4);
    objc_storeStrong((id *)&v19->_locality, a5);
    objc_storeStrong((id *)&v19->_subLocality, a6);
    objc_storeStrong((id *)&v19->_administrativeArea, a7);
    objc_storeStrong((id *)&v19->_subAdministrativeArea, a8);
    objc_storeStrong((id *)&v19->_postalCode, a9);
    objc_storeStrong((id *)&v19->_country, a10);
  }

  return v19;
}

- (PPPostalAddress)initWithContactsPostalAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PPPostalAddress *v19;
  void *v20;
  PPPostalAddress *v21;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "street");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v4, "street");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  v23 = v8;
  if (objc_msgSend(v8, "count") == 2)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "country");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ISOCountryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPostalAddress _countryStringWithCountry:isoCode:](self, "_countryStringWithCountry:isoCode:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "city");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subLocality");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subAdministrativeArea");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postalCode");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = self;
  v20 = (void *)v18;
  v21 = -[PPPostalAddress initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:](v19, "initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v5, v10, v14, v15, v16, v17, v18, v13);

  return v21;
}

- (PPPostalAddress)initWithFoundInAppsPostalAddress:(id)a3
{
  id v5;
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
  PPPostalAddress *v18;
  void *v19;
  void *v20;
  PPPostalAddress *v21;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPPostalAddress.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[postalAddress respondsToSelector:@selector((components))]"));

  }
  objc_msgSend(v5, "performSelector:", sel_components);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "street");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v6, "street");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  v25 = v5;
  if (objc_msgSend(v10, "count") == 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
    v11 = v7;
  }
  objc_msgSend(v6, "country");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isoCountryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPostalAddress _countryStringWithCountry:isoCode:](self, "_countryStringWithCountry:isoCode:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "city");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subLocality");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subAdministrativeArea");
  v18 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postalCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PPPostalAddress initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:](v18, "initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v11, v24, v15, v16, v17, v19, v20, v14);

  return v21;
}

- (id)toCNPostalAddress
{
  void *v3;
  void *v4;
  NSUInteger v5;
  NSString *country;

  v3 = (void *)objc_opt_new();
  if (-[NSString length](self->_thoroughfare, "length") && -[NSString length](self->_subThoroughfare, "length"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n%@"), self->_thoroughfare, self->_subThoroughfare);
    objc_msgSend(v3, "setStreet:", v4);

  }
  else
  {
    objc_msgSend(v3, "setStreet:", self->_thoroughfare);
  }
  objc_msgSend(v3, "setCity:", self->_locality);
  objc_msgSend(v3, "setSubLocality:", self->_subLocality);
  objc_msgSend(v3, "setState:", self->_administrativeArea);
  objc_msgSend(v3, "setSubAdministrativeArea:", self->_subAdministrativeArea);
  v5 = -[NSString length](self->_country, "length");
  country = self->_country;
  if (v5 == 2)
    objc_msgSend(v3, "setISOCountryCode:", country);
  else
    objc_msgSend(v3, "setCountry:", country);
  objc_msgSend(v3, "setPostalCode:", self->_postalCode);
  return v3;
}

- (id)singleLineNormalizedAddressString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[PPPostalAddress toCNPostalAddress](self, "toCNPostalAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    +[PPPostalAddress normalizeAddressString:](PPPostalAddress, "normalizeAddressString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPPostalAddress t:'%@' st:'%@' l:'%@' sl:'%@' a:'%@' sa:'%@' pc:'%@' c:'%@'>"), self->_thoroughfare, self->_subThoroughfare, self->_locality, self->_subLocality, self->_administrativeArea, self->_subAdministrativeArea, self->_postalCode, self->_country);
}

- (PPPostalAddress)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PPPostalAddress *v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("tho"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("sth"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("loc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("slo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("aaa"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("saa"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("pco"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("cou"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PPPostalAddress initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:](self, "initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v6, v7, v8, v9, v10, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *thoroughfare;
  id v5;

  thoroughfare = self->_thoroughfare;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", thoroughfare, CFSTR("tho"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subThoroughfare, CFSTR("sth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locality, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subLocality, CFSTR("slo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_administrativeArea, CFSTR("aaa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subAdministrativeArea, CFSTR("saa"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("pco"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("cou"));

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

  v3 = -[NSString hash](self->_thoroughfare, "hash");
  v4 = -[NSString hash](self->_subThoroughfare, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_locality, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_subLocality, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_administrativeArea, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_subAdministrativeArea, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_postalCode, "hash") - v8 + 32 * v8;
  return -[NSString hash](self->_country, "hash") - v9 + 32 * v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v5 = (void *)objc_opt_class();
  v6 = (void *)-[NSString copyWithZone:](self->_thoroughfare, "copyWithZone:", a3);
  v7 = (void *)-[NSString copyWithZone:](self->_subThoroughfare, "copyWithZone:", a3);
  v8 = (void *)-[NSString copyWithZone:](self->_locality, "copyWithZone:", a3);
  v9 = (void *)-[NSString copyWithZone:](self->_subLocality, "copyWithZone:", a3);
  v10 = (void *)-[NSString copyWithZone:](self->_administrativeArea, "copyWithZone:", a3);
  v11 = (void *)-[NSString copyWithZone:](self->_subAdministrativeArea, "copyWithZone:", a3);
  v12 = (void *)-[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v13 = (void *)-[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  objc_msgSend(v5, "postalAddressWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PPPostalAddress *v4;
  PPPostalAddress *v5;
  BOOL v6;

  v4 = (PPPostalAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPPostalAddress isEqualToPostalAddress:](self, "isEqualToPostalAddress:", v5);

  return v6;
}

- (BOOL)isEqualToPostalAddress:(id)a3
{
  id *v4;
  id *v5;
  NSString *thoroughfare;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *subThoroughfare;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *locality;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *subLocality;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *administrativeArea;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSString *subAdministrativeArea;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *postalCode;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  char v41;
  NSString *v43;
  NSString *v44;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_28;
  thoroughfare = self->_thoroughfare;
  v7 = (NSString *)v4[1];
  if (thoroughfare == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = thoroughfare;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_28;
  }
  subThoroughfare = self->_subThoroughfare;
  v12 = (NSString *)v5[2];
  if (subThoroughfare == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = subThoroughfare;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_28;
  }
  locality = self->_locality;
  v17 = (NSString *)v5[3];
  if (locality == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = locality;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_28;
  }
  subLocality = self->_subLocality;
  v22 = (NSString *)v5[4];
  if (subLocality == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = subLocality;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_28;
  }
  administrativeArea = self->_administrativeArea;
  v27 = (NSString *)v5[5];
  if (administrativeArea == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = administrativeArea;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_28;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  v32 = (NSString *)v5[6];
  if (subAdministrativeArea == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = subAdministrativeArea;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_28;
  }
  postalCode = self->_postalCode;
  v37 = (NSString *)v5[7];
  if (postalCode == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = postalCode;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
    {
LABEL_28:
      v41 = 0;
      goto LABEL_29;
    }
  }
  v43 = self->_country;
  v44 = v43;
  if (v43 == v5[8])
    v41 = 1;
  else
    v41 = -[NSString isEqual:](v43, "isEqual:");

LABEL_29:
  return v41;
}

- (id)_countryStringWithCountry:(id)a3 isoCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v6, "uppercaseString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v8 = v5;
    if ((unint64_t)objc_msgSend(v8, "length") <= 3)
    {
      v9 = (void *)MEMORY[0x18D7805AC]();
      objc_msgSend(v8, "uppercaseString");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v9);

      v8 = (id)v10;
    }
  }

  return v8;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
}

+ (id)postalAddressWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithThoroughfare:subThoroughfare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:country:", v24, v23, v22, v21, v20, v19, v18, v17);

  return v25;
}

+ (id)normalizeAddressString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_7854);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterUsingPredicate:", v8);

  objc_msgSend(v7, "_pas_componentsJoinedByString:", CFSTR(" "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_componentsJoinedByString:", &stru_1E226D4B0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

BOOL __42__PPPostalAddress_normalizeAddressString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

@end
