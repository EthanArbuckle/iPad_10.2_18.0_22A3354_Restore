@implementation MCCSecretAgentContext

- (MCCSecretAgentContext)initWithCoder:(id)a3
{
  id v4;
  MCCSecretAgentContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *commonName;
  uint64_t v11;
  NSString *country;
  uint64_t v13;
  NSString *state;
  uint64_t v15;
  NSString *organization;
  uint64_t v17;
  NSString *organizationUnit;
  uint64_t v19;
  NSDictionary *csrAltName;
  uint64_t v21;
  NSString *keyType;
  uint64_t v23;
  NSString *certType;

  v4 = a3;
  v5 = -[MCCSecretAgentContext init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_commonName"));
    v9 = objc_claimAutoreleasedReturnValue();
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_country"));
    v11 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_state"));
    v13 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_organization"));
    v15 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_organizationUnit"));
    v17 = objc_claimAutoreleasedReturnValue();
    organizationUnit = v5->_organizationUnit;
    v5->_organizationUnit = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_csrAltName"));
    v19 = objc_claimAutoreleasedReturnValue();
    csrAltName = v5->_csrAltName;
    v5->_csrAltName = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyType"));
    v21 = objc_claimAutoreleasedReturnValue();
    keyType = v5->_keyType;
    v5->_keyType = (NSString *)v21;

    v5->_keyValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_keyValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_certType"));
    v23 = objc_claimAutoreleasedReturnValue();
    certType = v5->_certType;
    v5->_certType = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *commonName;
  id v5;

  commonName = self->_commonName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", commonName, CFSTR("_commonName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("_country"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organization, CFSTR("_organization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationUnit, CFSTR("_organizationUnit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_csrAltName, CFSTR("_csrAltName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyType, CFSTR("_keyType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_keyValue, CFSTR("_keyValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certType, CFSTR("_certType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
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

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_commonName, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_country, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_state, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_organization, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_organizationUnit, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSDictionary copy](self->_csrAltName, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSString copy](self->_keyType, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  v4[8] = self->_keyValue;
  v19 = -[NSString copy](self->_certType, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)organizationUnit
{
  return self->_organizationUnit;
}

- (void)setOrganizationUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)csrAltName
{
  return self->_csrAltName;
}

- (void)setCsrAltName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)keyValue
{
  return self->_keyValue;
}

- (void)setKeyValue:(int64_t)a3
{
  self->_keyValue = a3;
}

- (NSString)certType
{
  return self->_certType;
}

- (void)setCertType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certType, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
  objc_storeStrong((id *)&self->_csrAltName, 0);
  objc_storeStrong((id *)&self->_organizationUnit, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end
