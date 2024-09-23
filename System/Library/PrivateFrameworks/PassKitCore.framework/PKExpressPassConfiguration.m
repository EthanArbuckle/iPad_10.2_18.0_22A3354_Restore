@implementation PKExpressPassConfiguration

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5
{
  PKExpressPassConfiguration *result;
  PKExpressPassConfiguration *v10;
  PKExpressPassConfiguration *v11;
  uint64_t v12;
  NSString *passUniqueIdentifier;
  objc_super v14;

  result = (PKExpressPassConfiguration *)a3;
  if (result)
  {
    v10 = result;
    v14.receiver = self;
    v14.super_class = (Class)PKExpressPassConfiguration;
    v11 = -[PKExpressPassConfiguration init](&v14, sel_init);
    if (v11)
    {
      -[PKExpressPassConfiguration passUniqueIdentifier](v10, "passUniqueIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      passUniqueIdentifier = v11->_passUniqueIdentifier;
      v11->_passUniqueIdentifier = (NSString *)v12;

      objc_storeStrong((id *)&v11->_passInformation, a3);
      v11->_isNFCExpressEnabled = a4;
      v11->_isUWBExpressEnabled = a5;
      if (!a4 && !a5)
      {

        v11 = 0;
      }
    }

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)initForPaymentPass:(id)a3 isNFCExpressEnabled:(BOOL)a4 isUWBExpressEnabled:(BOOL)a5 withTechologyTest:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PKExpressPassConfiguration *v13;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:]([PKExpressPassInformation alloc], "initForPaymentPass:withTechologyTest:", v11, v10);

  if (v12)
  {
    v13 = -[PKExpressPassConfiguration initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:](self, "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v12, v7, v6);
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forSecureElementPass:(id)a4
{
  id v6;
  void *v7;
  PKExpressPassConfiguration *v8;

  v6 = a3;
  objc_msgSend(a4, "devicePaymentApplications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKExpressPassConfiguration initWithPassInformation:forPaymentApplications:](self, "initWithPassInformation:forPaymentApplications:", v6, v7);

  return v8;
}

- (PKExpressPassConfiguration)initWithPassInformation:(id)a3 forPaymentApplications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  PKExpressPassConfiguration *v18;
  id v20;
  PKExpressPassConfiguration *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v21 = self;
    objc_msgSend(v6, "paymentApplicationIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v20 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "applicationIdentifier", v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v8, "containsObject:", v16);

          if (v17)
            v12 |= objc_msgSend(v15, "supportedRadioTechnologies");
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    self = -[PKExpressPassConfiguration initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:](v21, "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v6, v12 & 1, (v12 >> 1) & 1);
    v18 = self;
    v7 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  PKExpressPassConfiguration *v4;
  char isKindOfClass;
  PKExpressPassConfiguration *v6;
  PKExpressPassConfiguration *v7;
  BOOL v8;

  v4 = (PKExpressPassConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    if ((isKindOfClass & 1) != 0
      && -[NSString isEqualToString:](self->_passUniqueIdentifier, "isEqualToString:", v4->_passUniqueIdentifier)
      && -[PKExpressPassInformation isEqual:](self->_passInformation, "isEqual:", v4->_passInformation)
      && self->_isNFCExpressEnabled != !v4->_isNFCExpressEnabled)
    {
      v8 = self->_isUWBExpressEnabled ^ !v4->_isUWBExpressEnabled;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_passUniqueIdentifier, "hash");
  v4 = -[PKExpressPassInformation hash](self->_passInformation, "hash");
  v5 = self->_isNFCExpressEnabled - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return self->_isUWBExpressEnabled - v5 + 32 * v5 + 15699857;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = CFSTR("YES");
  if (self->_isNFCExpressEnabled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!self->_isUWBExpressEnabled)
    v4 = CFSTR("NO");
  return objc_autoreleaseReturnValue((id)objc_msgSend(v3, "initWithFormat:", CFSTR("<PKExpressPassConfiguration: %p; Pass %@; NFC Express Enabled: %@; UWB Express Enabled: %@; Information: %@>"),
                                           self,
                                           self->_passUniqueIdentifier,
                                           v5,
                                           v4,
                                           self->_passInformation));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passUniqueIdentifier;
  id v5;

  passUniqueIdentifier = self->_passUniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passInformation, CFSTR("passInformation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNFCExpressEnabled, CFSTR("isNFCExpressEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isUWBExpressEnabled, CFSTR("isUWBExpressEnabled"));

}

- (PKExpressPassConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PKExpressPassConfiguration *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passInformation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNFCExpressEnabled"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUWBExpressEnabled"));

  v8 = -[PKExpressPassConfiguration initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:](self, "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v5, v6, v7);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKExpressPassInformation *v5;
  PKExpressPassConfiguration *v6;

  v5 = -[PKExpressPassInformation initWithExpressPassInformation:](+[PKExpressPassInformation allocWithZone:](PKExpressPassInformation, "allocWithZone:"), "initWithExpressPassInformation:", self->_passInformation);
  v6 = -[PKExpressPassConfiguration initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:](+[PKExpressPassConfiguration allocWithZone:](PKExpressPassConfiguration, "allocWithZone:", a3), "initWithPassInformation:isNFCExpressEnabled:isUWBExpressEnabled:", v5, self->_isNFCExpressEnabled, self->_isUWBExpressEnabled);

  return v6;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (PKExpressPassInformation)passInformation
{
  return self->_passInformation;
}

- (BOOL)isNFCExpressEnabled
{
  return self->_isNFCExpressEnabled;
}

- (BOOL)isUWBExpressEnabled
{
  return self->_isUWBExpressEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passInformation, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
