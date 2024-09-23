@implementation PKPaymentProvisioningPassData

- (PKPaymentProvisioningPassData)init
{

  return 0;
}

- (PKPaymentProvisioningPassData)initWithSecureElementPass:(id)a3
{
  id v4;
  PKSecureElementPass *v5;
  NSObject *p_super;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PKPaymentProvisioningPassData initWithSecureElementPass:]";
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "%s called with nil pass. Returning self as nil.", buf, 0xCu);
    }
    goto LABEL_6;
  }
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentProvisioningPassData;
  self = -[PKPaymentProvisioningPassData init](&v8, sel_init);
  if (self)
  {
    v5 = (PKSecureElementPass *)v4;
    p_super = &self->_secureElementPass->super.super.super;
    self->_secureElementPass = v5;
LABEL_6:

  }
  return self;
}

- (PKPaymentProvisioningPassData)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentProvisioningPassData *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSURL *passURL;
  uint64_t v10;
  NSString *ownershipToken;
  uint64_t v12;
  NSString *ownershipTokenIdentifier;
  NSObject *v14;
  void *v15;
  id v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentProvisioningPassData;
  v5 = -[PKPaymentProvisioningPassData init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("passURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
      passURL = v5->_passURL;
      v5->_passURL = (NSURL *)v8;

      v5->_willProvisionWithAuthenticationDisabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("willProvisionWithAuthenticationDisabled"));
      objc_msgSend(v4, "PKStringForKey:", CFSTR("ownershipToken"));
      v10 = objc_claimAutoreleasedReturnValue();
      ownershipToken = v5->_ownershipToken;
      v5->_ownershipToken = (NSString *)v10;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("ownershipTokenIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
      v5->_ownershipTokenIdentifier = (NSString *)v12;

      v5->_suppressMakeDefaultPaymentPassOffer = objc_msgSend(v4, "PKBoolForKey:", CFSTR("suppressMakeDefaultPaymentPassOffer"));
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        v16 = v15;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Malformed response: Missing passURL when creating %@", buf, 0xCu);

      }
      v7 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (PKPaymentProvisioningPassData)initWithPassURL:(id)a3
{
  id v5;
  PKPaymentProvisioningPassData *v6;
  PKPaymentProvisioningPassData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentProvisioningPassData;
  v6 = -[PKPaymentProvisioningPassData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_passURL, a3);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKObject uniqueID](self->_secureElementPass, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("pass identifier: '%@'; "), v7);

  -[NSURL absoluteString](self->_passURL, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("pass url: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR("deviceCredential: %@; "), self->_deviceCredential);
  if (self->_willProvisionWithAuthenticationDisabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("willProvisionWithAuthenticationDisabled: '%@'; "), v9);
  if (self->_suppressMakeDefaultPaymentPassOffer)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("suppressMakeDefaultPaymentPassOffer: '%@'; "), v10);
  objc_msgSend(v6, "appendFormat:", CFSTR("ownershipToken: '%@'; "), self->_ownershipToken);
  objc_msgSend(v6, "appendFormat:", CFSTR("ownershipTokenIdentifier: '%@'; "), self->_ownershipTokenIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentProvisioningPassData *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = (PKPaymentProvisioningPassData *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PKObject uniqueID](self->_secureElementPass, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject uniqueID](v4->_secureElementPass, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v7 && v8)
          v10 = objc_msgSend(v7, "isEqualToString:", v8);
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_passURL)
  {
    v7[0] = self->_passURL;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKObject uniqueID](self->_secureElementPass, "uniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4 = PKCombinedHash(17, v2);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentProvisioningPassData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningPassData *v5;
  uint64_t v6;
  NSURL *passURL;
  uint64_t v8;
  PKSecureElementPass *secureElementPass;
  uint64_t v10;
  PKAppletSubcredential *deviceCredential;
  uint64_t v12;
  NSString *ownershipToken;
  uint64_t v14;
  NSString *ownershipTokenIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentProvisioningPassData;
  v5 = -[PKPaymentProvisioningPassData init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    passURL = v5->_passURL;
    v5->_passURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementPass"));
    v8 = objc_claimAutoreleasedReturnValue();
    secureElementPass = v5->_secureElementPass;
    v5->_secureElementPass = (PKSecureElementPass *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceCredential"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceCredential = v5->_deviceCredential;
    v5->_deviceCredential = (PKAppletSubcredential *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownershipToken"));
    v12 = objc_claimAutoreleasedReturnValue();
    ownershipToken = v5->_ownershipToken;
    v5->_ownershipToken = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownershipTokenIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownershipTokenIdentifier = v5->_ownershipTokenIdentifier;
    v5->_ownershipTokenIdentifier = (NSString *)v14;

    v5->_willProvisionWithAuthenticationDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("willProvisionWithAuthenticationDisabled"));
    v5->_suppressMakeDefaultPaymentPassOffer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressMakeDefaultPaymentPassOffer"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *passURL;
  id v5;

  passURL = self->_passURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passURL, CFSTR("passURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementPass, CFSTR("secureElementPass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceCredential, CFSTR("deviceCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownershipToken, CFSTR("ownershipToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownershipTokenIdentifier, CFSTR("ownershipTokenIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_willProvisionWithAuthenticationDisabled, CFSTR("willProvisionWithAuthenticationDisabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suppressMakeDefaultPaymentPassOffer, CFSTR("suppressMakeDefaultPaymentPassOffer"));

}

- (NSURL)passURL
{
  return self->_passURL;
}

- (PKSecureElementPass)secureElementPass
{
  return self->_secureElementPass;
}

- (void)setSecureElementPass:(id)a3
{
  objc_storeStrong((id *)&self->_secureElementPass, a3);
}

- (PKAppletSubcredential)deviceCredential
{
  return self->_deviceCredential;
}

- (void)setDeviceCredential:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCredential, a3);
}

- (BOOL)willProvisionWithAuthenticationDisabled
{
  return self->_willProvisionWithAuthenticationDisabled;
}

- (void)setWillProvisionWithAuthenticationDisabled:(BOOL)a3
{
  self->_willProvisionWithAuthenticationDisabled = a3;
}

- (BOOL)suppressMakeDefaultPaymentPassOffer
{
  return self->_suppressMakeDefaultPaymentPassOffer;
}

- (NSString)ownershipToken
{
  return self->_ownershipToken;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);
  objc_storeStrong((id *)&self->_deviceCredential, 0);
  objc_storeStrong((id *)&self->_secureElementPass, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
}

@end
