@implementation PKVirtualCard

+ (id)cardsForPaymentPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cardsForPaymentPass:accordingToWebService:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cardsForPaymentPass:(id)a3 accordingToWebService:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PKVirtualCard *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "supportsVirtualCardNumberAccordingToWebService:", v6) & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v5, "devicePrimaryPaymentApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "virtualCardIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init(PKVirtualCard);
      -[PKVirtualCard setIdentifier:](v10, "setIdentifier:", v9);
      -[PKVirtualCard setType:](v10, "setType:", 2);
      objc_msgSend(v5, "primaryAccountNumberSuffix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard setFPANSuffix:](v10, "setFPANSuffix:", v11);

      objc_msgSend(v8, "dpanSuffix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard setDPANSuffix:](v10, "setDPANSuffix:", v12);

      objc_msgSend(v5, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard setDisplayName:](v10, "setDisplayName:", v13);

      -[PKVirtualCard setHasDynamicSecurityCode:](v10, "setHasDynamicSecurityCode:", 1);
      -[PKVirtualCard setState:](v10, "setState:", 1);
      +[PKPaymentOptionsDefaults defaults](PKPaymentOptionsDefaults, "defaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paymentPass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "defaultBillingAddressForPaymentPass:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKVirtualCard setBillingAddress:](v10, "setBillingAddress:", v16);

      -[PKVirtualCard setCredentialType:](v10, "setCredentialType:", objc_msgSend(v8, "paymentNetworkIdentifier"));
      -[PKVirtualCard setRefreshType:](v10, "setRefreshType:", objc_msgSend(v8, "vpanRefreshTypeAccordingToService:", v6));
      if (objc_msgSend(v5, "isPeerPaymentPass"))
        -[PKVirtualCard setBalanceSource:](v10, "setBalanceSource:", 1);
      objc_msgSend(v7, "addObject:", v10);

    }
    v17 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)demoVPANVirtualCards
{
  id v2;
  PKVirtualCard *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  PKVirtualCard *v9;
  PKVirtualCard *v10;
  PKVirtualCard *v11;
  void *v12;
  void *v13;
  void *v14;
  PKCurrencyAmount *v15;
  void *v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_ui())
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = objc_alloc_init(PKVirtualCard);
    -[PKVirtualCard setIdentifier:](v3, "setIdentifier:", CFSTR("DEMO_VPAN_IDENTIFIER_1"));
    -[PKVirtualCard setType:](v3, "setType:", 2);
    -[PKVirtualCard setFPANSuffix:](v3, "setFPANSuffix:", CFSTR("1111"));
    -[PKVirtualCard setDPANSuffix:](v3, "setDPANSuffix:", CFSTR("9876"));
    -[PKVirtualCard setDisplayName:](v3, "setDisplayName:", CFSTR("Demo Card 1"));
    -[PKVirtualCard setHasDynamicSecurityCode:](v3, "setHasDynamicSecurityCode:", 1);
    -[PKVirtualCard setState:](v3, "setState:", 1);
    -[PKVirtualCard setCredentialType:](v3, "setCredentialType:", 4);
    v4 = objc_alloc_init(MEMORY[0x1E0C97378]);
    objc_msgSend(v4, "setStreet:", CFSTR("1 Infinite Loop"));
    objc_msgSend(v4, "setCity:", CFSTR("Cupertino"));
    objc_msgSend(v4, "setState:", CFSTR("CA"));
    objc_msgSend(v4, "setPostalCode:", CFSTR("95014"));
    objc_msgSend(v4, "setCountry:", CFSTR("United States"));
    objc_msgSend(v4, "setISOCountryCode:", CFSTR("US"));
    v5 = objc_alloc(MEMORY[0x1E0C97338]);
    v6 = (void *)objc_msgSend(v5, "initWithLabel:value:", *MEMORY[0x1E0C96FF8], v4);
    v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v7, "setGivenName:", CFSTR("Johnny"));
    objc_msgSend(v7, "setFamilyName:", CFSTR("Appleseed"));
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPostalAddresses:", v8);

    -[PKVirtualCard setBillingAddress:](v3, "setBillingAddress:", v7);
    objc_msgSend(v2, "addObject:", v3);
    v9 = objc_alloc_init(PKVirtualCard);
    -[PKVirtualCard setIdentifier:](v9, "setIdentifier:", CFSTR("DEMO_VPAN_IDENTIFIER_2"));
    -[PKVirtualCard setType:](v9, "setType:", 2);
    -[PKVirtualCard setFPANSuffix:](v9, "setFPANSuffix:", CFSTR("2222"));
    -[PKVirtualCard setDPANSuffix:](v9, "setDPANSuffix:", CFSTR("5432"));
    -[PKVirtualCard setDisplayName:](v9, "setDisplayName:", CFSTR("Demo Card 2"));
    -[PKVirtualCard setHasDynamicSecurityCode:](v9, "setHasDynamicSecurityCode:", 1);
    -[PKVirtualCard setState:](v9, "setState:", 1);
    -[PKVirtualCard setCredentialType:](v9, "setCredentialType:", 4);
    objc_msgSend(v2, "addObject:", v9);
    v10 = objc_alloc_init(PKVirtualCard);
    -[PKVirtualCard setIdentifier:](v10, "setIdentifier:", CFSTR("DEMO_VPAN_IDENTIFIER_3"));
    -[PKVirtualCard setType:](v10, "setType:", 2);
    -[PKVirtualCard setFPANSuffix:](v10, "setFPANSuffix:", CFSTR("3333"));
    -[PKVirtualCard setDPANSuffix:](v10, "setDPANSuffix:", CFSTR("1098"));
    -[PKVirtualCard setDisplayName:](v10, "setDisplayName:", CFSTR("Demo Card 3"));
    -[PKVirtualCard setHasDynamicSecurityCode:](v10, "setHasDynamicSecurityCode:", 1);
    -[PKVirtualCard setState:](v10, "setState:", 1);
    -[PKVirtualCard setCredentialType:](v10, "setCredentialType:", 4);
    objc_msgSend(v2, "addObject:", v10);
    if (!_os_feature_enabled_impl())
    {
LABEL_9:
      v16 = (void *)objc_msgSend(v2, "copy");

      return v16;
    }
    v18 = v6;
    v11 = objc_alloc_init(PKVirtualCard);
    -[PKVirtualCard setIdentifier:](v11, "setIdentifier:", CFSTR("DEMO_VPAN_IDENTIFIER_4"));
    -[PKVirtualCard setType:](v11, "setType:", 2);
    -[PKVirtualCard setDisplayName:](v11, "setDisplayName:", CFSTR("Apple Cash"));
    -[PKVirtualCard setDPANSuffix:](v11, "setDPANSuffix:", CFSTR("7873"));
    -[PKVirtualCard setHasDynamicSecurityCode:](v11, "setHasDynamicSecurityCode:", 1);
    -[PKVirtualCard setState:](v11, "setState:", 1);
    -[PKVirtualCard setCredentialType:](v11, "setCredentialType:", 4);
    -[PKVirtualCard setBalanceSource:](v11, "setBalanceSource:", 1);
    PKVirtualCardFakeCashVPANBalance();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", v12);
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "pk_isNotANumber"))
        goto LABEL_8;

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", CFSTR("12.34"));
LABEL_8:
    v15 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v14, CFSTR("USD"), 0);
    -[PKVirtualCard setBalance:](v11, "setBalance:", v15);
    objc_msgSend(v2, "addObject:", v11);

    v6 = v18;
    goto LABEL_9;
  }
  return 0;
}

- (PKVirtualCard)initWithDictionary:(id)a3
{
  id v4;
  PKVirtualCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *cardholderName;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *FPANSuffix;
  uint64_t v14;
  NSString *dpanSuffix;
  uint64_t v16;
  NSString *expiration;
  uint64_t v18;
  NSDate *lastUpdatedDate;
  void *v20;
  char v21;
  uint64_t v22;
  NSString *securityCodeIdentifier;
  uint64_t v24;
  NSDate *securityCodeExpiration;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSData *encryptedData;
  uint64_t v34;
  NSData *ephemeralPublicKey;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKVirtualCard;
  v5 = -[PKVirtualCard init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("cardholderName"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKAccountVirtualCardStateFromString(v10);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountVirtualCardTypeFromString(v11);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("FPANSuffix"));
    v12 = objc_claimAutoreleasedReturnValue();
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("dpanSuffix"));
    v14 = objc_claimAutoreleasedReturnValue();
    dpanSuffix = v5->_dpanSuffix;
    v5->_dpanSuffix = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("expiration"));
    v16 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportsLocalStorage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v21 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("supportsLocalStorage"));
    else
      v21 = 1;
    v5->_supportsLocalStorage = v21;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("securityCodeIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    securityCodeIdentifier = v5->_securityCodeIdentifier;
    v5->_securityCodeIdentifier = (NSString *)v22;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("securityCodeExpiration"));
    v24 = objc_claimAutoreleasedReturnValue();
    securityCodeExpiration = v5->_securityCodeExpiration;
    v5->_securityCodeExpiration = (NSDate *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDynamicSecurityCode"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      LOBYTE(v26) = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasDynamicSecurityCode"));
    v5->_hasDynamicSecurityCode = v26;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("credentials"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "PKStringForKey:", CFSTR("encryptedData"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v30, 0);
      encryptedData = v5->_encryptedData;
      v5->_encryptedData = (NSData *)v32;

      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v31, 0);
      ephemeralPublicKey = v5->_ephemeralPublicKey;
      v5->_ephemeralPublicKey = (NSData *)v34;

    }
  }

  return v5;
}

- (id)mergeVirtualCardWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_encryptedData && self->_ephemeralPublicKey)
    {
      objc_msgSend(v4, "encryptedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEncryptedData:", v6);

      objc_msgSend(v5, "ephemeralPublicKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEphemeralPublicKey:", v7);

    }
    v8 = v5;
  }

  return v5;
}

- (BOOL)hasSensitiveCredentials
{
  return self->_encryptedData && self->_ephemeralPublicKey != 0;
}

- (NSString)displayablePANSuffix
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString length](self->_FPANSuffix, "length");
  v4 = 48;
  if (!v3)
    v4 = 56;
  return (NSString *)*(id *)((char *)&self->super.isa + v4);
}

- (BOOL)isEqualToSafariEntryWithPrimaryAccountNumber:(id)a3 expirationDate:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *expiration;
  void *v15;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") >= 0x10)
  {
    objc_msgSend(v6, "pk_zString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v7, "pk_zString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[PKVirtualCardCredentials primaryAccountNumber](self->_keychainCardCredentials, "primaryAccountNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_zString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKVirtualCard generateHashWithPrimaryAccountNumber:expirationDate:](self, "generateHashWithPrimaryAccountNumber:expirationDate:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      expiration = self->_expiration;
    else
      expiration = 0;
    -[PKVirtualCard generateHashWithPrimaryAccountNumber:expirationDate:](self, "generateHashWithPrimaryAccountNumber:expirationDate:", v12, expiration);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "isEqualToData:", v15);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)generateHashWithPrimaryAccountNumber:(id)a3 expirationDate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SHA256Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setLastAutoFilledBySafariWithCompletion:(id)a3
{
  id v4;
  int64_t type;
  void *v6;
  NSString *identifier;
  NSDate *v8;
  NSDate *lastAutoFilledBySafari;
  NSDate *v10;
  PKPaymentService *v11;
  NSDate *v12;
  NSDate *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  type = self->_type;
  if (type == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastAutoFilledBySafari = self->_lastAutoFilledBySafari;
    self->_lastAutoFilledBySafari = v8;
    v10 = v8;

    v11 = objc_alloc_init(PKPaymentService);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PKVirtualCard_setLastAutoFilledBySafariWithCompletion___block_invoke_2;
    v16[3] = &unk_1E2ABD9C8;
    v17 = v4;
    -[PKPaymentService updateDateLastUsedBySafari:forVirtualCard:completion:](v11, "updateDateLastUsedBySafari:forVirtualCard:completion:", v10, self, v16);

  }
  else if (type == 1)
  {
    if (!-[PKVirtualCard hasSensitiveCredentials](self, "hasSensitiveCredentials"))
    {
      if (self->_keychainCardCredentials)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v13 = self->_lastAutoFilledBySafari;
        self->_lastAutoFilledBySafari = v12;

        -[PKVirtualCard writeKeychainVirtualCardToKeychain](self, "writeKeychainVirtualCardToKeychain");
        if (!v4)
          goto LABEL_9;
      }
      else
      {
        -[PKVirtualCard keychainVirtualCard](self, "keychainVirtualCard");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastAutoFilledBySafari:", v15);

        objc_msgSend(v14, "writeKeychainVirtualCardToKeychain");
        if (!v4)
          goto LABEL_9;
      }
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      goto LABEL_9;
    }
    +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PKVirtualCard_setLastAutoFilledBySafariWithCompletion___block_invoke;
    v18[3] = &unk_1E2ABD9C8;
    v19 = v4;
    objc_msgSend(v6, "noteVirtualCardAutoFilledBySafari:completion:", identifier, v18);

  }
LABEL_9:

}

uint64_t __57__PKVirtualCard_setLastAutoFilledBySafariWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__PKVirtualCard_setLastAutoFilledBySafariWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setContactNameEnteredInSafari:(id)a3 completion:(id)a4
{
  NSString *v6;
  id v7;
  NSObject *v8;
  NSString *nameFromSafari;
  NSString *v10;
  PKPaymentService *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Safari called setContactNameEnteredInSafari: with name %@", buf, 0xCu);
  }

  nameFromSafari = self->_nameFromSafari;
  self->_nameFromSafari = v6;
  v10 = v6;

  v11 = objc_alloc_init(PKPaymentService);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PKVirtualCard_setContactNameEnteredInSafari_completion___block_invoke;
  v13[3] = &unk_1E2ABD9C8;
  v14 = v7;
  v12 = v7;
  -[PKPaymentService updateCardholderNameFromSafari:forVirtualCard:completion:](v11, "updateCardholderNameFromSafari:forVirtualCard:completion:", v10, self, v13);

}

uint64_t __58__PKVirtualCard_setContactNameEnteredInSafari_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setNameFromSafari:(id)a3
{
  NSString *v4;
  NSString *v5;
  CNContact *v6;
  CNContact *billingAddress;
  NSString *nameFromSafari;

  v4 = (NSString *)a3;
  v5 = v4;
  if (!self->_billingAddress && -[NSString length](v4, "length"))
  {
    v6 = (CNContact *)objc_alloc_init(MEMORY[0x1E0C97360]);
    -[CNContact setFamilyName:](v6, "setFamilyName:", v5);
    billingAddress = self->_billingAddress;
    self->_billingAddress = v6;

  }
  nameFromSafari = self->_nameFromSafari;
  self->_nameFromSafari = v5;

}

- (BOOL)requiresAuthentication
{
  _BOOL4 requiresAuthentication;

  requiresAuthentication = self->_requiresAuthentication;
  if (!self->_requiresAuthentication)
    return self->_encryptedData && self->_ephemeralPublicKey || self->_type == 2;
  return requiresAuthentication;
}

- (PKVirtualCard)initWithKeychainData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSObject *v7;
  PKVirtualCard *v8;
  uint8_t v10[16];

  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, 0);

  if (v5 && !v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with keychain data.", v10, 2u);
    }

    goto LABEL_8;
  }
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v6, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
  v8 = (PKVirtualCard *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishDecoding");
LABEL_9:

  return v8;
}

+ (void)queryKeychainForVirtualCards:(id)a3
{
  void (**v3)(id, _QWORD, id);
  id v4;
  uint64_t v5;
  const __CFDictionary *v6;
  OSStatus v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  PKVirtualCard *v16;
  void *v17;
  NSObject *v18;
  id v19;
  const __CFDictionary *v20;
  void (**v21)(id, _QWORD, id);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CFTypeRef result;
  uint8_t v27[128];
  uint8_t buf[4];
  OSStatus v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, id))a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.passd.virtual.card"), *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.passd"), *MEMORY[0x1E0CD6898]);
  v5 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD6B80]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7010]);
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x1E0CD7018]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  v7 = SecItemCopyMatching(v6, &result);
  if (!v7 && result)
  {
    v20 = v6;
    v21 = v3;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)result;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      v13 = *MEMORY[0x1E0CD70D8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKey:", v13, v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[PKVirtualCard initWithKeychainData:]([PKVirtualCard alloc], "initWithKeychainData:", v15);
          if (-[PKVirtualCard isValidFromKeychain](v16, "isValidFromKeychain"))
          {
            -[PKVirtualCard setRequiresAuthentication:](v16, "setRequiresAuthentication:", 0);
            objc_msgSend(v8, "addObject:", v16);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v11);
    }

    if (result)
      CFRelease(result);
    v3 = v21;
    if (v21)
    {
      v17 = (void *)objc_msgSend(v8, "copy");
      ((void (**)(id, void *, id))v21)[2](v21, v17, 0);

    }
    v6 = v20;
    goto LABEL_21;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v29 = v7;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Error fetching virtual cards from Keychain: %d", buf, 8u);
  }

  if (v3)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
    v3[2](v3, 0, v8);
LABEL_21:

  }
}

+ (void)deleteAllLocalKeychainVirtualCards
{
  objc_msgSend(a1, "queryKeychainForVirtualCards:", &__block_literal_global_111);
}

void __51__PKVirtualCard_deleteAllLocalKeychainVirtualCards__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        PKLogFacilityTypeGetObject(0xEuLL);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v7;
          _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Deleting local keychain virtual card %@", buf, 0xCu);
        }

        objc_msgSend(v7, "deleteLocalKeychainVirtualCard");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

- (void)writeKeychainVirtualCardToKeychain
{
  NSData *encryptedData;
  NSData *ephemeralPublicKey;
  NSString *securityCodeIdentifier;
  NSDate *securityCodeExpiration;
  void *v7;
  id v8;

  -[PKVirtualCardCredentials setCardSecurityCode:](self->_keychainCardCredentials, "setCardSecurityCode:", 0);
  encryptedData = self->_encryptedData;
  self->_encryptedData = 0;

  ephemeralPublicKey = self->_ephemeralPublicKey;
  self->_ephemeralPublicKey = 0;

  self->_requiresAuthentication = 0;
  if (self->_hasDynamicSecurityCode)
  {
    securityCodeIdentifier = self->_securityCodeIdentifier;
    self->_securityCodeIdentifier = 0;

    securityCodeExpiration = self->_securityCodeExpiration;
    self->_securityCodeExpiration = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKVirtualCard _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x1E0CD70D8]);

}

- (id)keychainVirtualCard
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  -[PKVirtualCard _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_identifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CD70D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with keychain data.", v10, 2u);
    }

    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x1E0CB2CD0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");
LABEL_11:

  return v7;
}

- (void)deleteKeychainVirtualCard
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removing virtual card from Keychain", v5, 2u);
  }

  -[PKVirtualCard _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetKeychainItem");

}

- (void)deleteLocalKeychainVirtualCard
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Removing virtual card from Local Keychain", v5, 2u);
  }

  -[PKVirtualCard _wrapperWithType:identifier:](self, "_wrapperWithType:identifier:", 1, self->_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetLocalKeychainItem");

}

- (BOOL)isValidFromKeychain
{
  return self->_identifier && self->_FPANSuffix && self->_keychainCardCredentials != 0;
}

- (id)_wrapperWithType:(unint64_t)a3 identifier:(id)a4
{
  id v5;
  PKKeychainItemWrapper *v6;

  v5 = a4;
  v6 = -[PKKeychainItemWrapper initWithIdentifier:accessGroup:serviceName:type:invisible:]([PKKeychainItemWrapper alloc], "initWithIdentifier:accessGroup:serviceName:type:invisible:", v5, CFSTR("com.apple.passd"), CFSTR("com.apple.passd.virtual.card"), a3, 0);

  -[PKKeychainItemWrapper setLabel:](v6, "setLabel:", CFSTR("com.apple.passd.virtual.card"));
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *cardholderName;
  unint64_t state;
  const __CFString *v8;
  int64_t type;
  const __CFString *v10;
  const __CFString *v11;
  NSString *FPANSuffix;
  NSString *dpanSuffix;
  NSString *expiration;
  NSDate *lastUpdatedDate;
  void *v16;
  void *v17;
  NSString *securityCodeIdentifier;
  NSDate *securityCodeExpiration;
  void *v20;
  void *v21;
  NSString *nameFromSafari;
  PKCurrencyAmount *balance;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  cardholderName = self->_cardholderName;
  if (cardholderName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", cardholderName, CFSTR("cardholderName"));
  state = self->_state;
  if (state > 4)
    v8 = CFSTR("active");
  else
    v8 = off_1E2ACF330[state];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("state"));
  type = self->_type;
  v10 = CFSTR("primary");
  if (!type)
    v10 = CFSTR("unknown");
  if (type == 2)
    v11 = CFSTR("vpan");
  else
    v11 = v10;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("type"));
  FPANSuffix = self->_FPANSuffix;
  if (FPANSuffix)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", FPANSuffix, CFSTR("FPANSuffix"));
  dpanSuffix = self->_dpanSuffix;
  if (dpanSuffix)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dpanSuffix, CFSTR("dpanSuffix"));
  expiration = self->_expiration;
  if (expiration)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", expiration, CFSTR("expiration"));
  lastUpdatedDate = self->_lastUpdatedDate;
  if (lastUpdatedDate)
  {
    -[NSDate description](lastUpdatedDate, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("lastUpdatedDate"));

  }
  if (self->_supportsLocalStorage)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("supportsLocalStorage"));

  }
  securityCodeIdentifier = self->_securityCodeIdentifier;
  if (securityCodeIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", securityCodeIdentifier, CFSTR("securityCodeIdentifier"));
  securityCodeExpiration = self->_securityCodeExpiration;
  if (securityCodeExpiration)
  {
    -[NSDate description](securityCodeExpiration, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("securityCodeExpiration"));

  }
  if (self->_hasDynamicSecurityCode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("hasDynamicSecurityCode"));

  }
  nameFromSafari = self->_nameFromSafari;
  if (nameFromSafari)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", nameFromSafari, CFSTR("nameFromSafari"));
  balance = self->_balance;
  if (balance)
  {
    -[PKCurrencyAmount minimalFormattedStringValue](balance, "minimalFormattedStringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("balance"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_balanceSource);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("balanceSource"));

  v26 = (void *)objc_msgSend(v4, "copy");
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *cardholderName;
  NSString *v8;
  NSString *FPANSuffix;
  NSString *v10;
  NSString *dpanSuffix;
  NSString *v12;
  NSString *expiration;
  NSString *v14;
  NSDate *lastUpdatedDate;
  NSDate *v16;
  NSData *encryptedData;
  NSData *v18;
  NSData *ephemeralPublicKey;
  NSData *v20;
  NSString *displayName;
  NSString *v22;
  NSDate *lastAutoFilledBySafari;
  NSDate *v24;
  NSString *securityCodeIdentifier;
  NSString *v26;
  NSDate *securityCodeExpiration;
  NSDate *v28;
  CNContact *billingAddress;
  CNContact *v30;
  NSString *nameFromSafari;
  NSString *v32;
  PKCurrencyAmount *balance;
  PKCurrencyAmount *v34;
  BOOL v35;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_84;
  identifier = self->_identifier;
  v6 = (NSString *)v4[2];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (identifier != v6)
  {
    goto LABEL_84;
  }
  cardholderName = self->_cardholderName;
  v8 = (NSString *)v4[3];
  if (cardholderName && v8)
  {
    if ((-[NSString isEqual:](cardholderName, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (cardholderName != v8)
  {
    goto LABEL_84;
  }
  FPANSuffix = self->_FPANSuffix;
  v10 = (NSString *)v4[6];
  if (FPANSuffix && v10)
  {
    if ((-[NSString isEqual:](FPANSuffix, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (FPANSuffix != v10)
  {
    goto LABEL_84;
  }
  dpanSuffix = self->_dpanSuffix;
  v12 = (NSString *)v4[7];
  if (dpanSuffix && v12)
  {
    if ((-[NSString isEqual:](dpanSuffix, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (dpanSuffix != v12)
  {
    goto LABEL_84;
  }
  expiration = self->_expiration;
  v14 = (NSString *)v4[8];
  if (expiration && v14)
  {
    if ((-[NSString isEqual:](expiration, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (expiration != v14)
  {
    goto LABEL_84;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  v16 = (NSDate *)v4[9];
  if (lastUpdatedDate && v16)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (lastUpdatedDate != v16)
  {
    goto LABEL_84;
  }
  encryptedData = self->_encryptedData;
  v18 = (NSData *)v4[10];
  if (encryptedData && v18)
  {
    if ((-[NSData isEqual:](encryptedData, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (encryptedData != v18)
  {
    goto LABEL_84;
  }
  ephemeralPublicKey = self->_ephemeralPublicKey;
  v20 = (NSData *)v4[11];
  if (ephemeralPublicKey && v20)
  {
    if ((-[NSData isEqual:](ephemeralPublicKey, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (ephemeralPublicKey != v20)
  {
    goto LABEL_84;
  }
  displayName = self->_displayName;
  v22 = (NSString *)v4[12];
  if (displayName && v22)
  {
    if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (displayName != v22)
  {
    goto LABEL_84;
  }
  lastAutoFilledBySafari = self->_lastAutoFilledBySafari;
  v24 = (NSDate *)v4[13];
  if (lastAutoFilledBySafari && v24)
  {
    if ((-[NSDate isEqual:](lastAutoFilledBySafari, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (lastAutoFilledBySafari != v24)
  {
    goto LABEL_84;
  }
  if (self->_state != v4[4] || self->_type != v4[5] || self->_supportsLocalStorage != *((unsigned __int8 *)v4 + 10))
    goto LABEL_84;
  securityCodeIdentifier = self->_securityCodeIdentifier;
  v26 = (NSString *)v4[14];
  if (securityCodeIdentifier && v26)
  {
    if ((-[NSString isEqual:](securityCodeIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (securityCodeIdentifier != v26)
  {
    goto LABEL_84;
  }
  securityCodeExpiration = self->_securityCodeExpiration;
  v28 = (NSDate *)v4[15];
  if (securityCodeExpiration && v28)
  {
    if ((-[NSDate isEqual:](securityCodeExpiration, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (securityCodeExpiration != v28)
  {
    goto LABEL_84;
  }
  billingAddress = self->_billingAddress;
  v30 = (CNContact *)v4[16];
  if (billingAddress && v30)
  {
    if ((-[CNContact isEqual:](billingAddress, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (billingAddress != v30)
  {
    goto LABEL_84;
  }
  if (self->_credentialType != v4[17])
    goto LABEL_84;
  nameFromSafari = self->_nameFromSafari;
  v32 = (NSString *)v4[20];
  if (nameFromSafari && v32)
  {
    if ((-[NSString isEqual:](nameFromSafari, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (nameFromSafari != v32)
  {
    goto LABEL_84;
  }
  if (self->_refreshType != v4[21])
    goto LABEL_84;
  balance = self->_balance;
  v34 = (PKCurrencyAmount *)v4[18];
  if (!balance || !v34)
  {
    if (balance == v34)
      goto LABEL_82;
LABEL_84:
    v35 = 0;
    goto LABEL_85;
  }
  if (!-[PKCurrencyAmount isEqual:](balance, "isEqual:"))
    goto LABEL_84;
LABEL_82:
  if (self->_balanceSource != v4[19])
    goto LABEL_84;
  v35 = self->_hasDynamicSecurityCode == *((unsigned __int8 *)v4 + 9);
LABEL_85:

  return v35;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_cardholderName);
  objc_msgSend(v3, "safelyAddObject:", self->_FPANSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_expiration);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptedData);
  objc_msgSend(v3, "safelyAddObject:", self->_ephemeralPublicKey);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_lastAutoFilledBySafari);
  objc_msgSend(v3, "safelyAddObject:", self->_keychainCardCredentials);
  objc_msgSend(v3, "safelyAddObject:", self->_securityCodeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_securityCodeExpiration);
  objc_msgSend(v3, "safelyAddObject:", self->_billingAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_nameFromSafari);
  objc_msgSend(v3, "safelyAddObject:", self->_balance);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_type - v5 + 32 * v5;
  v7 = self->_supportsLocalStorage - v6 + 32 * v6;
  v8 = self->_hasDynamicSecurityCode - v7 + 32 * v7;
  v9 = self->_credentialType - v8 + 32 * v8;
  v10 = self->_refreshType - v9 + 32 * v9;
  v11 = self->_balanceSource - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  void *v3;
  unint64_t state;
  const __CFString *v5;
  int64_t type;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  state = self->_state;
  if (state > 4)
    v5 = CFSTR("active");
  else
    v5 = off_1E2ACF330[state];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v5);
  type = self->_type;
  v7 = CFSTR("primary");
  if (!type)
    v7 = CFSTR("unknown");
  if (type == 2)
    v8 = CFSTR("vpan");
  else
    v8 = v7;
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("FPANSuffix: '%@'; "), self->_FPANSuffix);
  objc_msgSend(v3, "appendFormat:", CFSTR("dpanSuffix: '%@'; "), self->_dpanSuffix);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdatedDate);
  if (self->_supportsLocalStorage)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("supportsLocalStorage: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptedData: '%@'; "), self->_encryptedData);
  objc_msgSend(v3, "appendFormat:", CFSTR("ephemeralPublicKey: '%@'; "), self->_ephemeralPublicKey);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayName: '%@'; "), self->_displayName);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastAutoFilledBySafari: '%@'; "), self->_lastAutoFilledBySafari);
  if (-[PKVirtualCard requiresAuthentication](self, "requiresAuthentication"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresAuthentication: '%@'; "), v10);
  if (self->_keychainCardCredentials)
    objc_msgSend(v3, "appendFormat:", CFSTR("keychainCardCredentials: '%@'; "), self->_keychainCardCredentials);
  objc_msgSend(v3, "appendFormat:", CFSTR("securityCodeIdentifier: '%@'; "), self->_securityCodeIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("securityCodeExpiration: '%@'; "), self->_securityCodeExpiration);
  if (self->_hasDynamicSecurityCode)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasDynamicSecurityCode: '%@'; "), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("billingAddress: '%@'; "), self->_billingAddress);
  PKPaymentNetworkNameForPaymentCredentialType(self->_credentialType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cardType: '%@'; "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("nameFromSafari: '%@'; "), self->_nameFromSafari);
  objc_msgSend(v3, "appendFormat:", CFSTR("refreshType: '%lu'; "), self->_refreshType);
  -[PKCurrencyAmount minimalFormattedStringValue](self->_balance, "minimalFormattedStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balance: %@"), v13);

  objc_msgSend(v3, "appendFormat:", CFSTR("balanceSource: '%ld'; "), self->_balanceSource);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKVirtualCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *cardholderName;
  uint64_t v10;
  NSString *FPANSuffix;
  uint64_t v12;
  NSString *dpanSuffix;
  uint64_t v14;
  NSString *expiration;
  uint64_t v16;
  NSDate *lastUpdatedDate;
  uint64_t v18;
  NSData *encryptedData;
  uint64_t v20;
  NSData *ephemeralPublicKey;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  NSDate *lastAutoFilledBySafari;
  PKVirtualCardCredentials *v26;
  PKVirtualCardCredentials *keychainCardCredentials;
  uint64_t v28;
  NSString *securityCodeIdentifier;
  uint64_t v30;
  NSDate *securityCodeExpiration;
  uint64_t v32;
  CNContact *billingAddress;
  uint64_t v34;
  NSString *nameFromSafari;
  PKCurrencyAmount *v36;
  PKCurrencyAmount *balance;

  v5 = -[PKVirtualCard init](+[PKVirtualCard allocWithZone:](PKVirtualCard, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_cardholderName, "copyWithZone:", a3);
  cardholderName = v5->_cardholderName;
  v5->_cardholderName = (NSString *)v8;

  v5->_state = self->_state;
  v5->_type = self->_type;
  v10 = -[NSString copyWithZone:](self->_FPANSuffix, "copyWithZone:", a3);
  FPANSuffix = v5->_FPANSuffix;
  v5->_FPANSuffix = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_dpanSuffix, "copyWithZone:", a3);
  dpanSuffix = v5->_dpanSuffix;
  v5->_dpanSuffix = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_expiration, "copyWithZone:", a3);
  expiration = v5->_expiration;
  v5->_expiration = (NSString *)v14;

  v16 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v16;

  v5->_supportsLocalStorage = self->_supportsLocalStorage;
  v18 = -[NSData copyWithZone:](self->_encryptedData, "copyWithZone:", a3);
  encryptedData = v5->_encryptedData;
  v5->_encryptedData = (NSData *)v18;

  v20 = -[NSData copyWithZone:](self->_ephemeralPublicKey, "copyWithZone:", a3);
  ephemeralPublicKey = v5->_ephemeralPublicKey;
  v5->_ephemeralPublicKey = (NSData *)v20;

  v22 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v22;

  v24 = -[NSDate copyWithZone:](self->_lastAutoFilledBySafari, "copyWithZone:", a3);
  lastAutoFilledBySafari = v5->_lastAutoFilledBySafari;
  v5->_lastAutoFilledBySafari = (NSDate *)v24;

  v26 = -[PKVirtualCardCredentials copyWithZone:](self->_keychainCardCredentials, "copyWithZone:", a3);
  keychainCardCredentials = v5->_keychainCardCredentials;
  v5->_keychainCardCredentials = v26;

  v28 = -[NSString copyWithZone:](self->_securityCodeIdentifier, "copyWithZone:", a3);
  securityCodeIdentifier = v5->_securityCodeIdentifier;
  v5->_securityCodeIdentifier = (NSString *)v28;

  v30 = -[NSDate copyWithZone:](self->_securityCodeExpiration, "copyWithZone:", a3);
  securityCodeExpiration = v5->_securityCodeExpiration;
  v5->_securityCodeExpiration = (NSDate *)v30;

  v5->_hasDynamicSecurityCode = self->_hasDynamicSecurityCode;
  v32 = -[CNContact copyWithZone:](self->_billingAddress, "copyWithZone:", a3);
  billingAddress = v5->_billingAddress;
  v5->_billingAddress = (CNContact *)v32;

  v5->_credentialType = self->_credentialType;
  v34 = -[NSString copyWithZone:](self->_nameFromSafari, "copyWithZone:", a3);
  nameFromSafari = v5->_nameFromSafari;
  v5->_nameFromSafari = (NSString *)v34;

  v5->_refreshType = self->_refreshType;
  v36 = -[PKCurrencyAmount copyWithZone:](self->_balance, "copyWithZone:", a3);
  balance = v5->_balance;
  v5->_balance = v36;

  v5->_balanceSource = self->_balanceSource;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKVirtualCard)initWithCoder:(id)a3
{
  id v4;
  PKVirtualCard *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *cardholderName;
  uint64_t v10;
  NSString *FPANSuffix;
  uint64_t v12;
  NSString *dpanSuffix;
  uint64_t v14;
  NSString *expiration;
  uint64_t v16;
  NSDate *lastUpdatedDate;
  uint64_t v18;
  NSData *encryptedData;
  uint64_t v20;
  NSData *ephemeralPublicKey;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  NSDate *lastAutoFilledBySafari;
  uint64_t v26;
  PKVirtualCardCredentials *keychainCardCredentials;
  uint64_t v28;
  NSString *securityCodeIdentifier;
  uint64_t v30;
  NSDate *securityCodeExpiration;
  uint64_t v32;
  CNContact *billingAddress;
  uint64_t v34;
  NSString *nameFromSafari;
  uint64_t v36;
  PKCurrencyAmount *balance;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKVirtualCard;
  v5 = -[PKVirtualCard init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardholderName"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FPANSuffix"));
    v10 = objc_claimAutoreleasedReturnValue();
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dpanSuffix"));
    v12 = objc_claimAutoreleasedReturnValue();
    dpanSuffix = v5->_dpanSuffix;
    v5->_dpanSuffix = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
    v14 = objc_claimAutoreleasedReturnValue();
    expiration = v5->_expiration;
    v5->_expiration = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v16;

    v5->_supportsLocalStorage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsLocalStorage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedData"));
    v18 = objc_claimAutoreleasedReturnValue();
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v22 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastAutoFilledBySafari"));
    v24 = objc_claimAutoreleasedReturnValue();
    lastAutoFilledBySafari = v5->_lastAutoFilledBySafari;
    v5->_lastAutoFilledBySafari = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keychainCredentials"));
    v26 = objc_claimAutoreleasedReturnValue();
    keychainCardCredentials = v5->_keychainCardCredentials;
    v5->_keychainCardCredentials = (PKVirtualCardCredentials *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityCodeIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    securityCodeIdentifier = v5->_securityCodeIdentifier;
    v5->_securityCodeIdentifier = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("securityCodeExpiration"));
    v30 = objc_claimAutoreleasedReturnValue();
    securityCodeExpiration = v5->_securityCodeExpiration;
    v5->_securityCodeExpiration = (NSDate *)v30;

    v5->_hasDynamicSecurityCode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDynamicSecurityCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("billingAddress"));
    v32 = objc_claimAutoreleasedReturnValue();
    billingAddress = v5->_billingAddress;
    v5->_billingAddress = (CNContact *)v32;

    v5->_credentialType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameFromSafari"));
    v34 = objc_claimAutoreleasedReturnValue();
    nameFromSafari = v5->_nameFromSafari;
    v5->_nameFromSafari = (NSString *)v34;

    v5->_refreshType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("refreshType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v36 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (PKCurrencyAmount *)v36;

    v5->_balanceSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("balanceSource"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_cardholderName, CFSTR("cardholderName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_FPANSuffix, CFSTR("FPANSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanSuffix, CFSTR("dpanSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiration, CFSTR("expiration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsLocalStorage, CFSTR("supportsLocalStorage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedData, CFSTR("encryptedData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastAutoFilledBySafari, CFSTR("lastAutoFilledBySafari"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keychainCardCredentials, CFSTR("keychainCredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_securityCodeIdentifier, CFSTR("securityCodeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_securityCodeExpiration, CFSTR("securityCodeExpiration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasDynamicSecurityCode, CFSTR("hasDynamicSecurityCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_billingAddress, CFSTR("billingAddress"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_credentialType, CFSTR("credentialType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameFromSafari, CFSTR("nameFromSafari"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_refreshType, CFSTR("refreshType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_balanceSource, CFSTR("balanceSource"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)FPANSuffix
{
  return self->_FPANSuffix;
}

- (void)setFPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)dpanSuffix
{
  return self->_dpanSuffix;
}

- (void)setDPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)lastAutoFilledBySafari
{
  return self->_lastAutoFilledBySafari;
}

- (void)setLastAutoFilledBySafari:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (NSString)securityCodeIdentifier
{
  return self->_securityCodeIdentifier;
}

- (void)setSecurityCodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDate)securityCodeExpiration
{
  return self->_securityCodeExpiration;
}

- (void)setSecurityCodeExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)hasDynamicSecurityCode
{
  return self->_hasDynamicSecurityCode;
}

- (void)setHasDynamicSecurityCode:(BOOL)a3
{
  self->_hasDynamicSecurityCode = a3;
}

- (CNContact)billingAddress
{
  return self->_billingAddress;
}

- (void)setBillingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int64_t)a3
{
  self->_credentialType = a3;
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)balanceSource
{
  return self->_balanceSource;
}

- (void)setBalanceSource:(int64_t)a3
{
  self->_balanceSource = a3;
}

- (BOOL)supportsLocalStorage
{
  return self->_supportsLocalStorage;
}

- (void)setSupportsLocalStorage:(BOOL)a3
{
  self->_supportsLocalStorage = a3;
}

- (NSString)nameFromSafari
{
  return self->_nameFromSafari;
}

- (unint64_t)refreshType
{
  return self->_refreshType;
}

- (void)setRefreshType:(unint64_t)a3
{
  self->_refreshType = a3;
}

- (PKVirtualCardCredentials)keychainCardCredentials
{
  return self->_keychainCardCredentials;
}

- (void)setKeychainCardCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainCardCredentials, 0);
  objc_storeStrong((id *)&self->_nameFromSafari, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_billingAddress, 0);
  objc_storeStrong((id *)&self->_securityCodeExpiration, 0);
  objc_storeStrong((id *)&self->_securityCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_lastAutoFilledBySafari, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_dpanSuffix, 0);
  objc_storeStrong((id *)&self->_FPANSuffix, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
