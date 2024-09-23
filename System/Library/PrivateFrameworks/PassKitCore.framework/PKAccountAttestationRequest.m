@implementation PKAccountAttestationRequest

+ (id)createAnonymizationSalt
{
  void *v2;
  NSObject *v3;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08X"), arc4random_uniform(0xFFFFFFFF));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v2;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Generating salt: '%@'", buf, 0xCu);
  }

  return v2;
}

+ (id)keychainDataWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_keychainItemWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3)
    *a3 = 0;
  if (v5)
  {
    v22 = 0;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v22);
    v8 = v22;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      v14 = objc_opt_class();
      objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0CB2CD0];
      v21 = 0;
      objc_msgSend(v7, "decodeTopLevelObjectOfClasses:forKey:error:", v15, v16, &v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;

      objc_msgSend(v7, "finishDecoding");
      if (v17)
        v18 = v10 == 0;
      else
        v18 = 0;
      if (v18)
      {
        v12 = v17;
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Account Attestation: Could not parse keychain data: %@", buf, 0xCu);
        }

        v12 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v10);
      }

    }
    else
    {
      v10 = v8;
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Account Attestation: Could not initialize unarchiver with keychain data: %@", buf, 0xCu);
      }

      if (a3)
      {
        v10 = objc_retainAutorelease(v10);
        v12 = 0;
        *a3 = v10;
      }
      else
      {
        v12 = 0;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)defaultAnonymizationSaltWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "keychainDataWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v8 = "Account Attestation: No keychain data found";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 2u);
    }
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("DefaultSalt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      v8 = "Account Attestation: Missing default salt value";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v7)
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Account Attestation: Found default salt: '%@'", (uint8_t *)&v10, 0xCu);
  }
LABEL_11:

  return v5;
}

+ (id)setDefaultAnonymizationSalt:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0;
  objc_msgSend(a1, "keychainDataWithError:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    if (v7)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v4)
      {
        if (v11)
        {
          *(_DWORD *)buf = 138412290;
          v24 = 0;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Account Attestation: Clearing default salt: '%@'", buf, 0xCu);
        }

        objc_msgSend(v7, "removeObjectForKey:", CFSTR("DefaultSalt"));
        goto LABEL_18;
      }
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Account Attestation: Updating default salt: '%@'", buf, 0xCu);
      }

      v12 = v7;
    }
    else
    {
      if (!v4)
      {
        v9 = 0;
        goto LABEL_24;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Account Attestation: Creating new keychain data with salt: '%@'", buf, 0xCu);
      }

      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = v12;
    }
    objc_msgSend(v12, "setObject:forKey:", v4, CFSTR("DefaultSalt"));
LABEL_18:
    v14 = (void *)MEMORY[0x1E0CB36F8];
    v15 = (void *)objc_msgSend(v7, "copy");
    v21 = 0;
    objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v21;

    objc_msgSend(a1, "_keychainItemWrapper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v16, *MEMORY[0x1E0CD70D8]);

    if (v17)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v17;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Account Attestation: Error writing information to keychain: %@", buf, 0xCu);
      }

    }
    v9 = v17;

    goto LABEL_23;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Account Attestation: Failed to load key chain data to set: %@", buf, 0xCu);
  }

  v9 = v6;
LABEL_23:

LABEL_24:
  return v9;
}

+ (void)removeAccountAttesationData
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Removing data...", v5, 2u);
  }

  objc_msgSend(a1, "_keychainItemWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetKeychainItem");

}

+ (void)removeLocalAccountAttesationData
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Account Attestation: Removing local data...", v5, 2u);
  }

  objc_msgSend(a1, "_keychainItemWrapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetLocalKeychainItem");

}

+ (id)_keychainItemWrapper
{
  return -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:accessibility:", CFSTR("PKAnonymizationSaltKeychainKey"), CFSTR("com.apple.passd"), CFSTR("com.apple.passd.account-attestation"), 1, 1, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAttestationRequest)initWithCoder:(id)a3
{
  id v4;
  PKAccountAttestationRequest *v5;
  uint64_t v6;
  PKSecureElementCertificateSet *casdCertificate;
  uint64_t v8;
  NSString *anonymizationSalt;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountAttestationRequest;
  v5 = -[PKAccountAttestationRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("casdCertificate"));
    v6 = objc_claimAutoreleasedReturnValue();
    casdCertificate = v5->_casdCertificate;
    v5->_casdCertificate = (PKSecureElementCertificateSet *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anonymizationSalt"));
    v8 = objc_claimAutoreleasedReturnValue();
    anonymizationSalt = v5->_anonymizationSalt;
    v5->_anonymizationSalt = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKSecureElementCertificateSet *casdCertificate;
  id v5;

  casdCertificate = self->_casdCertificate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", casdCertificate, CFSTR("casdCertificate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_anonymizationSalt, CFSTR("anonymizationSalt"));

}

- (PKSecureElementCertificateSet)casdCertificate
{
  return self->_casdCertificate;
}

- (void)setCasdCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_casdCertificate, a3);
}

- (NSString)anonymizationSalt
{
  return self->_anonymizationSalt;
}

- (void)setAnonymizationSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizationSalt, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
}

@end
