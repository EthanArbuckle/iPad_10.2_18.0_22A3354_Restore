@implementation PKSharingCarKeyMessage

- (PKSharingCarKeyMessage)initWithRawMessage:(id)a3 type:(unint64_t)a4 shareIdentifier:(id)a5 friendKeyIdentifier:(id)a6 carKeySharingDict:(id)a7
{
  PKSharingCarKeyMessage *v8;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  PKSharingCarKeyMessage *v21;
  objc_super v23;
  const __CFString *v24;
  _QWORD v25[2];

  v8 = 0;
  v25[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a5)
  {
    v13 = (objc_class *)MEMORY[0x1E0C99E08];
    v14 = a7;
    v15 = a6;
    v16 = a5;
    v17 = a3;
    v18 = objc_alloc_init(v13);
    objc_msgSend(v17, "hexEncoding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("sharingData"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("sharingId"));

    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("friendKeyId"));
    v24 = CFSTR("carKey");
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23.receiver = self;
    v23.super_class = (Class)PKSharingCarKeyMessage;
    v21 = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:](&v23, sel_initWithFormat_type_genericSharingDict_appleSharingDict_displayInformation_, 2, a4, v18, v20, 0);

    self = v21;
    v8 = self;
  }

  return v8;
}

- (BOOL)configureWithContent:(id)a3
{
  _BOOL4 v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSharingCarKeyMessage;
  v4 = -[PKSharingGenericMessage configureWithContent:](&v9, sel_configureWithContent_, a3);
  if (v4)
  {
    -[PKSharingCarKeyMessage underlyingPayload](self, "underlyingPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: car key message missing underlying sharing data", v8, 2u);
      }

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (NSDictionary)carKeySharingDict
{
  void *v2;
  void *v3;

  -[PKSharingGenericMessage appleSharingDict](self, "appleSharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKDictionaryForKey:", CFSTR("carKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)shareSessionIdentifier
{
  void *v2;
  void *v3;

  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("sharingSessionUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shareIdentifier
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  NSString *v7;
  int v9;
  PKSharingCarKeyMessage *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "PKStringForKey:", CFSTR("sharingId"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(v3, "PKStringForKey:", CFSTR("sharingIdentifier"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: Unable to find credential share identifier for %@", (uint8_t *)&v9, 0xCu);
      }

      v5 = 0;
      v4 = &stru_1E2ADF4C0;
    }
  }
  v7 = v4;

  return v7;
}

- (NSString)friendKeyIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("friendKeyId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "PKStringForKey:", CFSTR("friendKeyIdentifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSData)underlyingPayload
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSharingGenericMessage genericSharingDict](self, "genericSharingDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PKStringForKey:", CFSTR("sharingData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(v2, "PKStringForKey:", CFSTR("message")), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v3, "pk_decodeHexadecimal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

- (PKSharingCarKeyMessage)messageWithBindingAttestation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  PKSharingCarKeyMessage *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  PKSharingCarKeyMessage *v16;

  v4 = a3;
  -[PKSharingCarKeyMessage carKeySharingDict](self, "carKeySharingDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  objc_msgSend(v4, "hexEncoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("bindingAttestation"));
  v11 = [PKSharingCarKeyMessage alloc];
  -[PKSharingCarKeyMessage underlyingPayload](self, "underlyingPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKSharingMessage type](self, "type");
  -[PKSharingCarKeyMessage shareIdentifier](self, "shareIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingCarKeyMessage friendKeyIdentifier](self, "friendKeyIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKSharingCarKeyMessage initWithRawMessage:type:shareIdentifier:friendKeyIdentifier:carKeySharingDict:](v11, "initWithRawMessage:type:shareIdentifier:friendKeyIdentifier:carKeySharingDict:", v12, v13, v14, v15, v9);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
