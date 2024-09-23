@implementation PKIdentityProofingConfiguration

- (PKIdentityProofingConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIdentityProofingConfiguration;
  return -[PKIdentityProofingConfiguration init](&v3, sel_init);
}

- (PKIdentityProofingConfiguration)initWithCIDVUIProofingConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  PKIdentityProofingConfiguration *v15;

  v3 = a3;
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "target");
  objc_msgSend(v3, "credentialIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "status");
  if (v8 > 0xC)
    v9 = 4;
  else
    v9 = qword_190453E30[v8];
  if (v6 == 1)
    v10 = 1;
  else
    v10 = 2 * (v6 == 2);
  objc_msgSend(v3, "productIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountKeyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "idType") == 0;
  objc_msgSend(v3, "extendedReviewURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKIdentityProofingConfiguration initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:](self, "initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:", v4, v5, v10, v7, v9, v11, v12, v13, v14);

  return v15;
}

- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10
{
  return -[PKIdentityProofingConfiguration initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:](self, "initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:", a3, a4, a5, a6, a7, a8, a9, a10, 0);
}

- (PKIdentityProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 credentialIdentifier:(id)a6 status:(int64_t)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 learnMoreURL:(id)a11
{
  id v16;
  id v17;
  id v18;
  PKIdentityProofingConfiguration *v19;
  PKIdentityProofingConfiguration *v20;
  id v24;
  id v25;
  id v26;

  v16 = a3;
  v26 = a4;
  v25 = a6;
  v24 = a8;
  v17 = a9;
  v18 = a11;
  v19 = -[PKIdentityProofingConfiguration init](self, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_state, a3);
    objc_storeStrong((id *)&v20->_country, a4);
    v20->_target = a5;
    objc_storeStrong((id *)&v20->_credentialIdentifier, a6);
    v20->_status = a7;
    objc_storeStrong((id *)&v20->_productIdentifier, a8);
    objc_storeStrong((id *)&v20->_accountKeyIdentifier, a9);
    v20->_idType = a10;
    objc_storeStrong((id *)&v20->_learnMoreURL, a11);
  }

  return v20;
}

- (PKIdentityProofingConfiguration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PKIdentityProofingConfiguration *v16;
  void *v18;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("country"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("target"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKIdentityProofingConfigurationTargetDeviceTypeFromString(v6);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("credentialIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PKIdentityProofingStatusFromString(v9);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("productIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountKeyIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("idType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKSecureElementIdentityPassTypeFromString(v13);

    objc_msgSend(v4, "PKURLForKey:", CFSTR("learnMoreURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[PKIdentityProofingConfiguration initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:](self, "initWithState:country:target:credentialIdentifier:status:productIdentifier:accountKeyIdentifier:idType:learnMoreURL:", v18, v5, v7, v8, v10, v11, v12, v14, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *state;
  int64_t target;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  state = self->_state;
  v10 = a3;
  objc_msgSend(v10, "encodeObject:forKey:", state, CFSTR("state"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_country, CFSTR("country"));
  target = self->_target;
  v6 = CFSTR("phone");
  if (target != 1)
    v6 = 0;
  if (target == 2)
    v7 = CFSTR("watch");
  else
    v7 = v6;
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("target"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  PKIdentityProofingStatusToString(self->_status);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("status"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_productIdentifier, CFSTR("productIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));
  PKSecureElementIdentityPassTypeToString(self->_idType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("idType"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_learnMoreURL, CFSTR("learnMoreURL"));
}

- (PKIdentityProofingConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKIdentityProofingConfiguration *v5;
  uint64_t v6;
  NSString *state;
  uint64_t v8;
  NSString *country;
  void *v10;
  uint64_t v11;
  NSString *credentialIdentifier;
  void *v13;
  uint64_t v14;
  NSString *productIdentifier;
  uint64_t v16;
  NSString *accountKeyIdentifier;
  void *v18;
  uint64_t v19;
  NSURL *learnMoreURL;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKIdentityProofingConfiguration;
  v5 = -[PKIdentityProofingConfiguration init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v6 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
    v8 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_target = PKIdentityProofingConfigurationTargetDeviceTypeFromString(v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = PKIdentityProofingStatusFromString(v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountKeyIdentifier = v5->_accountKeyIdentifier;
    v5->_accountKeyIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_idType = PKSecureElementIdentityPassTypeFromString(v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learnMoreURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v19;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[PKIdentityProofingConfiguration _mutableDictionaryRepresentation](self, "_mutableDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_mutableDictionaryRepresentation
{
  id v3;
  int64_t target;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_state, CFSTR("state"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_country, CFSTR("country"));
  target = self->_target;
  v5 = CFSTR("phone");
  if (target != 1)
    v5 = 0;
  if (target == 2)
    v6 = CFSTR("watch");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("target"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  PKIdentityProofingStatusToString(self->_status);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("status"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_productIdentifier, CFSTR("productIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountKeyIdentifier, CFSTR("accountKeyIdentifier"));
  PKSecureElementIdentityPassTypeToString(self->_idType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("idType"));

  -[NSURL absoluteString](self->_learnMoreURL, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("learnMoreURL"));

  return v3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeyIdentifier, a3);
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
