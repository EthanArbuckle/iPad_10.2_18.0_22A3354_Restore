@implementation PKAppletSubcredentialSharingConfirguration

- (PKAppletSubcredentialSharingConfirguration)initWithDictionary:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingConfirguration *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  PKPassShareActivationOptions *v9;
  PKPassShareActivationOptions *activationOptions;
  uint64_t v11;
  NSArray *entitlements;
  PKAppletSubcredentialSharingConfirguration *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingConfirguration init](self, "init");
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "objectForKey:", CFSTR("maxNumberOfSharedCredentials"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Received invalid credential entitlement dictionary - maxNumberOfSharedCredentials", buf, 2u);
    }
    goto LABEL_13;
  }
  v5->_maxNumberOfSharedCredentials = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(v4, "objectForKey:", CFSTR("numberOfShareableCredentials"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Received invalid credential entitlement dictionary - numberOfShareableCredentials", v16, 2u);
    }

LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v5->_numberOfShareableCredentials = -[NSObject unsignedIntegerValue](v7, "unsignedIntegerValue");
  v5->_sharingRequiresPassword = objc_msgSend(v4, "PKBoolForKey:", CFSTR("sharingRequiresPassword"));
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("shareActivationOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPassShareActivationOptions initWithCarKeyIdentifiers:]([PKPassShareActivationOptions alloc], "initWithCarKeyIdentifiers:", v8);
  activationOptions = v5->_activationOptions;
  v5->_activationOptions = v9;

  objc_msgSend(v4, "PKArrayForKey:", CFSTR("entitlements"));
  v11 = objc_claimAutoreleasedReturnValue();
  entitlements = v5->_entitlements;
  v5->_entitlements = (NSArray *)v11;

LABEL_7:
  v13 = v5;
LABEL_14:

  return v13;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxNumberOfSharedCredentials);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("maxNumberOfSharedCredentials"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfShareableCredentials);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfShareableCredentials"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharingRequiresPassword);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sharingRequiresPassword"));

  -[PKPassShareActivationOptions identifiers](self->_activationOptions, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("shareActivationOptions"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_entitlements, CFSTR("entitlements"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("shareableCredentials: '%ld' (%ld); "),
    self->_numberOfShareableCredentials,
    self->_maxNumberOfSharedCredentials);
  if (self->_sharingRequiresPassword)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v6, "appendFormat:", CFSTR("sharingRequiresPassword: '%@'; "), v7);
  objc_msgSend(v6, "appendFormat:", CFSTR("activationOptions: '%@'; "), self->_activationOptions);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t maxNumberOfSharedCredentials;
  id v5;

  maxNumberOfSharedCredentials = self->_maxNumberOfSharedCredentials;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", maxNumberOfSharedCredentials, CFSTR("maxNumberOfSharedCredentials"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numberOfShareableCredentials, CFSTR("numberOfShareableCredentials"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sharingRequiresPassword, CFSTR("sharingRequiresPassword"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationOptions, CFSTR("shareActivationOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entitlements, CFSTR("entitlements"));

}

- (PKAppletSubcredentialSharingConfirguration)initWithCoder:(id)a3
{
  id v4;
  PKAppletSubcredentialSharingConfirguration *v5;
  uint64_t v6;
  PKPassShareActivationOptions *activationOptions;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *entitlements;

  v4 = a3;
  v5 = -[PKAppletSubcredentialSharingConfirguration init](self, "init");
  if (v5)
  {
    v5->_maxNumberOfSharedCredentials = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxNumberOfSharedCredentials"));
    v5->_numberOfShareableCredentials = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfShareableCredentials"));
    v5->_sharingRequiresPassword = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharingRequiresPassword")) != 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareActivationOptions"));
    v6 = objc_claimAutoreleasedReturnValue();
    activationOptions = v5->_activationOptions;
    v5->_activationOptions = (PKPassShareActivationOptions *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("entitlements"));
    v13 = objc_claimAutoreleasedReturnValue();
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSArray *)v13;

  }
  return v5;
}

- (unint64_t)maxNumberOfSharedCredentials
{
  return self->_maxNumberOfSharedCredentials;
}

- (void)setMaxNumberOfSharedCredentials:(unint64_t)a3
{
  self->_maxNumberOfSharedCredentials = a3;
}

- (unint64_t)numberOfShareableCredentials
{
  return self->_numberOfShareableCredentials;
}

- (void)setNumberOfShareableCredentials:(unint64_t)a3
{
  self->_numberOfShareableCredentials = a3;
}

- (BOOL)sharingRequiresPassword
{
  return self->_sharingRequiresPassword;
}

- (void)setSharingRequiresPassword:(BOOL)a3
{
  self->_sharingRequiresPassword = a3;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (void)setActivationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_activationOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end
