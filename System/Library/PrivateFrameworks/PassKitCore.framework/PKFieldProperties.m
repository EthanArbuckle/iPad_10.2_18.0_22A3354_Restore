@implementation PKFieldProperties

- (void)encodeWithCoder:(id)a3
{
  unint64_t technology;
  id v5;

  technology = self->_technology;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", technology, CFSTR("technology"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_terminalType, CFSTR("terminalType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessTerminalSubtype, CFSTR("terminalSubtype"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_valueAddedServiceMode, CFSTR("valueAddedServiceMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_authenticationRequired, CFSTR("authenticationRequired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_backgroundTransaction, CFSTR("backgroundTransaction"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairingRequested, CFSTR("pairingRequested"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_carKeyBrandCode, CFSTR("carKeyBrandCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_TCIs, CFSTR("TCIs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantIdentifiers, CFSTR("merchantIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_secondaryPropertiesRequired, CFSTR("secondaryPropertiesRequired"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_secondaryPropertiesAcquired, CFSTR("secondaryPropertiesAquired"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fieldType, CFSTR("ecpTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));

}

- (int64_t)valueAddedServiceMode
{
  return self->_valueAddedServiceMode;
}

- (int64_t)terminalType
{
  return self->_terminalType;
}

- (unint64_t)technology
{
  return self->_technology;
}

- (void)setTCIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setReaderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setPairingRequested:(unint64_t)a3
{
  self->_pairingRequested = a3;
}

- (void)setFieldType:(unint64_t)a3
{
  self->_fieldType = a3;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_authenticationRequired = a3;
}

- (NSArray)merchantIdentifiers
{
  return self->_merchantIdentifiers;
}

- (PKFieldProperties)initWithTechnology:(unint64_t)a3 terminalType:(int64_t)a4 accessTerminalSubtype:(int64_t)a5 valueAddedServiceMode:(int64_t)a6
{
  PKFieldProperties *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKFieldProperties;
  result = -[PKFieldProperties init](&v11, sel_init);
  if (result)
  {
    result->_technology = a3;
    result->_terminalType = a4;
    result->_valueAddedServiceMode = a6;
    result->_accessTerminalSubtype = a5;
    result->_pairingRequested = 2 * (a5 != 2);
  }
  return result;
}

- (PKFieldProperties)initWithCoder:(id)a3
{
  id v4;
  PKFieldProperties *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *TCIs;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *merchantIdentifiers;
  uint64_t v16;
  NSString *credentialIdentifier;
  uint64_t v18;
  NSString *applicationIdentifier;
  uint64_t v20;
  NSData *readerIdentifier;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFieldProperties;
  v5 = -[PKFieldProperties init](&v23, sel_init);
  if (v5)
  {
    v5->_technology = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("technology"));
    v5->_terminalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalType"));
    v5->_accessTerminalSubtype = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("terminalSubtype"));
    v5->_valueAddedServiceMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("valueAddedServiceMode"));
    v5->_authenticationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("authenticationRequired"));
    v5->_backgroundTransaction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("backgroundTransaction"));
    v5->_pairingRequested = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pairingRequested"));
    v5->_carKeyBrandCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carKeyBrandCode"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("TCIs"));
    v9 = objc_claimAutoreleasedReturnValue();
    TCIs = v5->_TCIs;
    v5->_TCIs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("merchantIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    merchantIdentifiers = v5->_merchantIdentifiers;
    v5->_merchantIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v18;

    v5->_secondaryPropertiesRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryPropertiesRequired"));
    v5->_secondaryPropertiesAcquired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secondaryPropertiesAquired"));
    v5->_fieldType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ecpTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v20;

  }
  return v5;
}

- (BOOL)backgroundTransaction
{
  return self->_backgroundTransaction;
}

- (int64_t)accessTerminalSubtype
{
  return self->_accessTerminalSubtype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifiers, 0);
  objc_storeStrong((id *)&self->_TCIs, 0);
}

+ (id)fieldPropertiesForFieldNotification:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  PKFieldProperties *v26;
  unsigned int v28;
  unsigned int v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v28 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "rfTechnology") & 0xF;
  v6 = objc_msgSend(v4, "notificationType");
  v28 = v5;
  if (v6 != 3)
  {
    if (v6 == 2)
    {
      v7 = PKFieldTerminalTypeForNFTerminalType(objc_msgSend(v4, "terminalType"));
      v8 = objc_msgSend(v4, "terminalMode");
      if (v8 >= 4)
        v9 = 0;
      else
        v9 = 4 - v8;
      v29 = objc_msgSend(v4, "odaRequired");
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 1;
      goto LABEL_14;
    }
LABEL_9:
    v10 = 0;
    v14 = 0;
    v29 = 0;
    v11 = 0;
    v12 = 0;
    v9 = 0;
    v13 = 0;
    v7 = 0;
    goto LABEL_14;
  }
  v15 = v4;
  v16 = objc_msgSend(v15, "terminalType") - 1;
  if (v16 > 4)
    v7 = 0;
  else
    v7 = qword_190455948[v16];
  v29 = objc_msgSend(v15, "odaRequired");
  v13 = objc_msgSend(v15, "terminalSubType");
  objc_msgSend(v15, "tciArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "readerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = 1;
  v14 = 2;
LABEL_14:
  PKFieldValueAddedServiceModeOverride();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v18)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v18;
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Field Properties Overriding Mode: %tu", buf, 0xCu);
    }

    v20 = 8;
  }
  else
  {
    v20 = v28;
    v18 = v9;
  }
  if (v7 == 3)
    v21 = v10;
  else
    v21 = 0;
  if (v21 != 1 || v13 > 0xB)
    goto LABEL_33;
  v22 = 1;
  if (((1 << v13) & 0xF22) == 0)
  {
    if (!v13)
    {
LABEL_34:
      v25 = 2;
      goto LABEL_35;
    }
LABEL_33:
    v22 = 0;
    goto LABEL_34;
  }
  v23 = objc_msgSend(v4, "pairingMode");
  if (v23)
    v24 = 2;
  else
    v24 = 0;
  if (v23 == 1)
    v25 = 1;
  else
    v25 = v24;
  v22 = 2;
LABEL_35:
  v26 = -[PKFieldProperties initWithTechnology:terminalType:accessTerminalSubtype:valueAddedServiceMode:]([PKFieldProperties alloc], "initWithTechnology:terminalType:accessTerminalSubtype:valueAddedServiceMode:", v20, v7, v22, v18);
  -[PKFieldProperties setTCIs:](v26, "setTCIs:", v11);
  -[PKFieldProperties setAuthenticationRequired:](v26, "setAuthenticationRequired:", v29);
  -[PKFieldProperties setFieldType:](v26, "setFieldType:", v14);
  -[PKFieldProperties setReaderIdentifier:](v26, "setReaderIdentifier:", v12);
  -[PKFieldProperties setPairingRequested:](v26, "setPairingRequested:", v25);

  return v26;
}

- (id)description
{
  void *v3;
  unint64_t pairingRequested;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  unint64_t v11;
  unint64_t valueAddedServiceMode;
  const __CFString *v13;
  const char *v14;
  const char *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  NSArray *TCIs;
  NSString *credentialIdentifier;
  NSString *applicationIdentifier;
  void *v22;
  void *v23;
  void *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  -[NSArray pk_arrayByApplyingBlock:](self->_merchantIdentifiers, "pk_arrayByApplyingBlock:", &__block_literal_global_163);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pairingRequested = self->_pairingRequested;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v32.receiver = self;
  v32.super_class = (Class)PKFieldProperties;
  -[PKFieldProperties description](&v32, sel_description);
  v6 = objc_claimAutoreleasedReturnValue();
  PKFieldTechnologyDescriptions(self->_technology);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("None");
  v10 = CFSTR("Unknown");
  switch(self->_terminalType)
  {
    case 0:
      break;
    case 1:
      v10 = CFSTR("Payment");
      break;
    case 2:
      v10 = CFSTR("Transit");
      break;
    case 3:
      v11 = self->_accessTerminalSubtype - 1;
      if (v11 >= 3)
        v9 = CFSTR("Unknown");
      else
        v9 = off_1E2AD5848[v11];
      v10 = CFSTR("Access");
      break;
    case 4:
      v10 = CFSTR("Identity");
      break;
    case 5:
      v10 = CFSTR("Connection Handover");
      break;
    default:
      v9 = CFSTR("Unknown");
      v10 = CFSTR("unknown");
      break;
  }
  valueAddedServiceMode = self->_valueAddedServiceMode;
  v30 = v5;
  v31 = (void *)v6;
  v28 = (void *)v8;
  v29 = v7;
  v26 = v10;
  v27 = v9;
  if (valueAddedServiceMode > 4)
    v13 = CFSTR("unknown");
  else
    v13 = off_1E2AD5860[valueAddedServiceMode];
  v14 = "unknown";
  if (pairingRequested == 1)
    v14 = "yes";
  if (pairingRequested == 2)
    v15 = "no";
  else
    v15 = v14;
  if (self->_authenticationRequired)
    v16 = CFSTR("yes");
  else
    v16 = CFSTR("no");
  if (self->_backgroundTransaction)
    v17 = CFSTR("yes");
  else
    v17 = CFSTR("no");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v3;
  TCIs = self->_TCIs;
  applicationIdentifier = self->_applicationIdentifier;
  credentialIdentifier = self->_credentialIdentifier;
  -[NSData hexEncoding](self->_readerIdentifier, "hexEncoding");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("[%@ Technology: %@, Terminal Type: %@ (%@), VAS Mode: %@, Authentication Required: %@, Pairing Requested: %s, Background Transaction: %@, Merchant Identifiers: %@, TCIs: %@, Credential Identifier: %@, AID: %@, Reader Identifier: %@, Secondary Properties Required: %d, Secondary Properties Acquired: %d]"), v31, v28, v26, v27, v13, v16, v15, v17, v18, TCIs, credentialIdentifier, applicationIdentifier, v22, self->_secondaryPropertiesRequired, self->_secondaryPropertiesAcquired);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

uint64_t __32__PKFieldProperties_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hexEncoding");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)shouldIgnore
{
  unint64_t terminalType;

  if ((self->_technology & 8) == 0)
    return 0;
  terminalType = self->_terminalType;
  if (terminalType > 5 || ((1 << terminalType) & 0x16) != 0)
    return 0;
  if (((1 << terminalType) & 0x21) != 0)
    return 1;
  return self->_accessTerminalSubtype == 2;
}

- (BOOL)authenticationRequired
{
  return self->_authenticationRequired;
}

- (void)setBackgroundTransaction:(BOOL)a3
{
  self->_backgroundTransaction = a3;
}

- (BOOL)secondaryPropertiesRequired
{
  return self->_secondaryPropertiesRequired;
}

- (void)setSecondaryPropertiesRequired:(BOOL)a3
{
  self->_secondaryPropertiesRequired = a3;
}

- (BOOL)secondaryPropertiesAcquired
{
  return self->_secondaryPropertiesAcquired;
}

- (void)setSecondaryPropertiesAcquired:(BOOL)a3
{
  self->_secondaryPropertiesAcquired = a3;
}

- (int64_t)carKeyBrandCode
{
  return self->_carKeyBrandCode;
}

- (void)setCarKeyBrandCode:(int64_t)a3
{
  self->_carKeyBrandCode = a3;
}

- (unint64_t)pairingRequested
{
  return self->_pairingRequested;
}

- (unint64_t)fieldType
{
  return self->_fieldType;
}

- (NSArray)TCIs
{
  return self->_TCIs;
}

- (void)setMerchantIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

+ (id)fieldPropertiesForSTSFieldNotification:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  PKFieldProperties *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "fieldType") == 1)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "nfcTechnology");
    v8 = objc_msgSend(v3, "terminalType") - 1;
    if (v8 > 8)
      v9 = 0;
    else
      v9 = qword_190455970[v8];
    v11 = objc_msgSend(v3, "terminalType") - 3;
    if (v11 > 6)
      v12 = 0;
    else
      v12 = qword_1904559B8[v11];
    v13 = objc_msgSend(v6, "terminalMode");
    if (v13 >= 4)
      v14 = 0;
    else
      v14 = 4 - v13;
    objc_msgSend(v6, "ecpVersion");
    v15 = objc_msgSend(v3, "odaRequired");
    objc_msgSend(v6, "tcis");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKFieldValueAddedServiceModeOverride();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    if (v18)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 134217984;
        v23 = v18;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Field Properties Overriding Mode: %tu", (uint8_t *)&v22, 0xCu);
      }

      v20 = 8;
    }
    else
    {
      v20 = v7 & 0xF;
      v18 = v14;
    }
    v10 = -[PKFieldProperties initWithTechnology:terminalType:accessTerminalSubtype:valueAddedServiceMode:]([PKFieldProperties alloc], "initWithTechnology:terminalType:accessTerminalSubtype:valueAddedServiceMode:", v20, v9, v12, v18);
    -[PKFieldProperties setTCIs:](v10, "setTCIs:", v16);
    -[PKFieldProperties setAuthenticationRequired:](v10, "setAuthenticationRequired:", v15);
    -[PKFieldProperties setFieldType:](v10, "setFieldType:", 0);
    if (objc_msgSend(v6, "terminalType") == 9)
      -[PKFieldProperties setPairingRequested:](v10, "setPairingRequested:", 0);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
