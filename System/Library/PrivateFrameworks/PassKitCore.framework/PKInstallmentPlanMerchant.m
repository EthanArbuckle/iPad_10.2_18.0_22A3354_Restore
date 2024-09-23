@implementation PKInstallmentPlanMerchant

- (PKInstallmentPlanMerchant)initWithDictionary:(id)a3
{
  id v4;
  PKInstallmentPlanMerchant *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *city;
  uint64_t v12;
  NSString *state;
  uint64_t v14;
  NSString *postalCode;
  uint64_t v16;
  NSString *country;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKInstallmentPlanMerchant;
  v5 = -[PKInstallmentPlanMerchant init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_categoryCode = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("categoryCode"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("city"));
    v10 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v12 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("postalCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("country"));
    v16 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v16;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKInstallmentPlanMerchant *v4;
  PKInstallmentPlanMerchant *v5;
  BOOL v6;

  v4 = (PKInstallmentPlanMerchant *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKInstallmentPlanMerchant isEqualToInstallmentPlanMerchant:](self, "isEqualToInstallmentPlanMerchant:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlanMerchant:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *country;
  void *v20;
  NSString *v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[1];
    v7 = self->_identifier;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
        goto LABEL_39;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v10)
        goto LABEL_40;
    }
    v11 = (void *)v5[2];
    v7 = self->_name;
    v12 = v11;
    if (v7 == v12)
    {

    }
    else
    {
      v9 = v12;
      LOBYTE(v10) = 0;
      if (!v7 || !v12)
        goto LABEL_39;
      v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

      if (!v10)
        goto LABEL_40;
    }
    if (self->_categoryCode == v5[3])
    {
      v13 = (void *)v5[4];
      v7 = self->_city;
      v14 = v13;
      if (v7 == v14)
      {

      }
      else
      {
        v9 = v14;
        LOBYTE(v10) = 0;
        if (!v7 || !v14)
          goto LABEL_39;
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);

        if (!v10)
          goto LABEL_40;
      }
      v15 = (void *)v5[5];
      v7 = self->_state;
      v16 = v15;
      if (v7 == v16)
      {

      }
      else
      {
        v9 = v16;
        LOBYTE(v10) = 0;
        if (!v7 || !v16)
          goto LABEL_39;
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v16);

        if (!v10)
          goto LABEL_40;
      }
      v17 = (void *)v5[6];
      v7 = self->_postalCode;
      v18 = v17;
      if (v7 == v18)
      {

LABEL_34:
        country = self->_country;
        v20 = (void *)v5[7];
        v7 = country;
        v21 = v20;
        if (v7 == v21)
        {
          LOBYTE(v10) = 1;
          v9 = v7;
        }
        else
        {
          v9 = v21;
          LOBYTE(v10) = 0;
          if (v7 && v21)
            LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v21);
        }
        goto LABEL_39;
      }
      v9 = v18;
      LOBYTE(v10) = 0;
      if (v7 && v18)
      {
        v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

        if (!v10)
          goto LABEL_40;
        goto LABEL_34;
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  LOBYTE(v10) = 0;
LABEL_40:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_city);
  objc_msgSend(v3, "safelyAddObject:", self->_state);
  objc_msgSend(v3, "safelyAddObject:", self->_postalCode);
  objc_msgSend(v3, "safelyAddObject:", self->_country);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_categoryCode - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKInstallmentPlanMerchant)initWithCoder:(id)a3
{
  id v4;
  PKInstallmentPlanMerchant *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *city;
  uint64_t v12;
  NSString *state;
  uint64_t v14;
  NSString *postalCode;
  uint64_t v16;
  NSString *country;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKInstallmentPlanMerchant;
  v5 = -[PKInstallmentPlanMerchant init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
    v10 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v12 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postalCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    postalCode = v5->_postalCode;
    v5->_postalCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
    v16 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_city, CFSTR("city"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_postalCode, CFSTR("postalCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("country"));

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v16 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v17 = (void *)v5[7];
  v5[7] = v16;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)categoryCode
{
  return self->_categoryCode;
}

- (void)setCategoryCode:(unint64_t)a3
{
  self->_categoryCode = a3;
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
