@implementation WBSCreditCardData

- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6 securityCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSCreditCardData *v17;
  uint64_t v18;
  NSDate *expirationDate;
  uint64_t v20;
  NSString *cardName;
  uint64_t v22;
  NSString *cardNumber;
  uint64_t v24;
  NSString *cardholderName;
  uint64_t v26;
  NSString *cardSecurityCode;
  WBSCreditCardData *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSCreditCardData;
  v17 = -[WBSCreditCardData init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    expirationDate = v17->_expirationDate;
    v17->_expirationDate = (NSDate *)v18;

    if (v12)
    {
      v20 = objc_msgSend(v12, "copy");
      cardName = v17->_cardName;
      v17->_cardName = (NSString *)v20;
    }
    else
    {
      cardName = v17->_cardName;
      v17->_cardName = (NSString *)&stru_1E4B40D18;
    }

    if (v13)
    {
      v22 = objc_msgSend(v13, "copy");
      cardNumber = v17->_cardNumber;
      v17->_cardNumber = (NSString *)v22;
    }
    else
    {
      cardNumber = v17->_cardNumber;
      v17->_cardNumber = (NSString *)&stru_1E4B40D18;
    }

    if (v14)
    {
      v24 = objc_msgSend(v14, "copy");
      cardholderName = v17->_cardholderName;
      v17->_cardholderName = (NSString *)v24;
    }
    else
    {
      cardholderName = v17->_cardholderName;
      v17->_cardholderName = (NSString *)&stru_1E4B40D18;
    }

    if (v16)
    {
      v26 = objc_msgSend(v16, "copy");
      cardSecurityCode = v17->_cardSecurityCode;
      v17->_cardSecurityCode = (NSString *)v26;
    }
    else
    {
      cardSecurityCode = v17->_cardSecurityCode;
      v17->_cardSecurityCode = (NSString *)&stru_1E4B40D18;
    }

    v17->_promptToSaveSecurityCode = 1;
    v28 = v17;
  }

  return v17;
}

- (WBSCreditCardData)initWithCardName:(id)a3 number:(id)a4 cardholderName:(id)a5 expirationDate:(id)a6
{
  return -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:](self, "initWithCardName:number:cardholderName:expirationDate:securityCode:", a3, a4, a5, a6, 0);
}

- (WBSCreditCardData)initWithVirtualCard:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WBSCreditCardData *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDate *lastUsedDate;
  uint64_t v15;
  PKCurrencyAmount *balance;
  WBSCreditCardData *v17;

  v5 = a3;
  -[WBSCreditCardData _expirationDateFromPKVirtualCard:](self, "_expirationDateFromPKVirtualCard:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayablePANSuffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardholderName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:](self, "initWithCardName:number:cardholderName:expirationDate:", v8, v7, v9, v6);

  if (v10)
  {
    objc_msgSend(v5, "lastAutoFilledBySafari");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v5, "setLastAutoFilledBySafariWithCompletion:", &__block_literal_global_31);
    objc_msgSend(v5, "lastAutoFilledBySafari");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v5, "lastAutoFilledBySafari");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = objc_claimAutoreleasedReturnValue();
    lastUsedDate = v10->_lastUsedDate;
    v10->_lastUsedDate = (NSDate *)v13;

    objc_storeStrong((id *)&v10->_virtualCard, a3);
    objc_msgSend(v5, "balance");
    v15 = objc_claimAutoreleasedReturnValue();
    balance = v10->_balance;
    v10->_balance = (PKCurrencyAmount *)v15;

    v17 = v10;
  }

  return v10;
}

void __41__WBSCreditCardData_initWithVirtualCard___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      __41__WBSCreditCardData_initWithVirtualCard___block_invoke_cold_1(v4, v5, v3);
    }

  }
}

- (WBSCreditCardData)initWithVirtualCardCredentials:(id)a3 virtualCard:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WBSCreditCardData *v22;
  uint64_t v23;
  NSDate *lastUsedDate;
  uint64_t v25;
  PKCurrencyAmount *balance;
  WBSCreditCardData *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 2)
  {
    objc_msgSend(v7, "billingAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0C97218];
      objc_msgSend(v7, "billingAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromContact:style:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C97298]);
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_ios_meContactWithKeysToFetch:error:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v17, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    -[WBSCreditCardData _expirationDateFromPKVirtualCardCredentials:](self, "_expirationDateFromPKVirtualCardCredentials:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "cardholderName");
    v12 = objc_claimAutoreleasedReturnValue();
    -[WBSCreditCardData _expirationDateFromPKVirtualCard:](self, "_expirationDateFromPKVirtualCard:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)v12;
  }
  objc_msgSend(v6, "primaryAccountNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E4B40D18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cardSecurityCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:](self, "initWithCardName:number:cardholderName:expirationDate:securityCode:", v20, v19, v11, v13, v21);

  if (v22)
  {
    objc_msgSend(v7, "lastAutoFilledBySafari");
    v23 = objc_claimAutoreleasedReturnValue();
    lastUsedDate = v22->_lastUsedDate;
    v22->_lastUsedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v22->_virtualCard, a4);
    objc_msgSend(v7, "balance");
    v25 = objc_claimAutoreleasedReturnValue();
    balance = v22->_balance;
    v22->_balance = (PKCurrencyAmount *)v25;

    v27 = v22;
  }

  return v22;
}

- (BOOL)isCardBalanceZeroOrNegative
{
  PKCurrencyAmount *balance;
  void *v3;
  void *v4;
  BOOL v5;

  balance = self->_balance;
  if (!balance)
    return 0;
  -[PKCurrencyAmount amount](balance, "amount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4) != 1;

  return v5;
}

- (BOOL)isVirtualCard
{
  return self->_virtualCard != 0;
}

- (id)_expirationDateFromPKVirtualCardCredentials:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WBSCreditCardData _expirationDateFormatter](self, "_expirationDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_expirationDateFromPKVirtualCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WBSCreditCardData _expirationDateFormatter](self, "_expirationDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_expirationDateFormatter
{
  if (-[WBSCreditCardData _expirationDateFormatter]::onceToken != -1)
    dispatch_once(&-[WBSCreditCardData _expirationDateFormatter]::onceToken, &__block_literal_global_37);
  return (id)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter;
}

uint64_t __45__WBSCreditCardData__expirationDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter;
  -[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter = (uint64_t)v0;

  return objc_msgSend((id)-[WBSCreditCardData _expirationDateFormatter]::expirationDateFormatter, "setDateFormat:", CFSTR("MM/yyyy"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p (card name \"%@\", cardholder name \"%@\", card number %@ expiration date %@ security code %@, last used date %@)>"), objc_opt_class(), self, self->_cardName, self->_cardholderName, self->_cardNumber, self->_expirationDate, self->_cardSecurityCode, self->_lastUsedDate);
}

- (WBSCreditCardData)initWithKeychainRepresentation:(id)a3
{
  id v4;
  void *v5;
  objc_object *v6;
  objc_object *v7;
  objc_object *v8;
  void *v9;
  objc_object *v10;
  void *v11;
  objc_class *v12;
  int v13;
  int v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  WBSCreditCardData *v21;
  objc_object *v23;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardNameUIString"));
      v6 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardholderName"));
      v23 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardNumber"));
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ExpirationDate"));
      v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LastUsedDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardSecurityCode"));
      v10 = (objc_object *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)0x1E0CB3000;
      v12 = (objc_class *)objc_opt_class();
      v13 = isNilOrKindOfClass(v10, v12);
      if (v7
        && (v14 = v13, v15 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v6, v15))
        && (v16 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v7, v16))
        && (v17 = (objc_class *)objc_opt_class(), isNilOrKindOfClass(v23, v17))
        && (v18 = (objc_class *)objc_opt_class(), (isNilOrKindOfClass(v8, v18) & v14 & 1) != 0))
      {
        self = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:](self, "initWithCardName:number:cardholderName:expirationDate:securityCode:", v6, v7, v23, v8, v10);
        objc_msgSend(v5, "objectForKey:", CFSTR("PromptToSaveSecurityCode"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v5, "objectForKey:", CFSTR("PromptToSaveSecurityCode"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "BOOLValue");
        }
        else
        {
          v20 = 1;
        }
        -[WBSCreditCardData setPromptToSaveSecurityCode:](self, "setPromptToSaveSecurityCode:", v20);
        if (v19)

        -[WBSCreditCardData creditCardDataByUpdatingLastUsedDate:](self, "creditCardDataByUpdatingLastUsedDate:", v9);
        v21 = (WBSCreditCardData *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)keychainRepresentationForNewCard
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  -[WBSCreditCardData dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  NSDate *expirationDate;
  NSDate *lastUsedDate;
  NSString *cardSecurityCode;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardName, CFSTR("CardNameUIString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardholderName, CFSTR("CardholderName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_cardNumber, CFSTR("CardNumber"));
  expirationDate = self->_expirationDate;
  if (expirationDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", expirationDate, CFSTR("ExpirationDate"));
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", lastUsedDate, CFSTR("LastUsedDate"));
  cardSecurityCode = self->_cardSecurityCode;
  if (cardSecurityCode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", cardSecurityCode, CFSTR("CardSecurityCode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_promptToSaveSecurityCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PromptToSaveSecurityCode"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (id)keychainRepresentationByMigratingExistingKeychainData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OSStatus v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSDate *expirationDate;
  NSDate *lastUsedDate;
  NSString *cardSecurityCode;
  void *v26;
  const __CFDictionary *v29;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFTypeRef result;
  _BYTE v38[128];
  _QWORD v39[7];
  _QWORD v40[9];

  v40[7] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v3 = *MEMORY[0x1E0CD6B80];
  v39[0] = *MEMORY[0x1E0CD6898];
  v39[1] = v3;
  v40[0] = CFSTR("com.apple.safari.credit-cards");
  v40[1] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v39[2] = *MEMORY[0x1E0CD6C98];
  v39[3] = v5;
  v40[2] = v4;
  v40[3] = CFSTR("SafariCreditCardEntries");
  v6 = *MEMORY[0x1E0CD6F38];
  v7 = *MEMORY[0x1E0CD7020];
  v39[4] = *MEMORY[0x1E0CD6F30];
  v39[5] = v7;
  v40[4] = v6;
  v40[5] = MEMORY[0x1E0C9AAB0];
  v39[6] = *MEMORY[0x1E0CD7018];
  v40[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 7);
  result = 0;
  v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = SecItemCopyMatching(v29, &result);
  v9 = v8;
  if (v8 == -25300)
  {
LABEL_18:
    v21 = 0;
    goto LABEL_27;
  }
  if (v8)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[WBSCreditCardData keychainRepresentationByMigratingExistingKeychainData:].cold.1(v9, v20);
    goto LABEL_18;
  }
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)result;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    v12 = *MEMORY[0x1E0CD70D8];
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v32 = 0;
          objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v32);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v32;
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "safari_stringForKey:", CFSTR("CardNumber"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "cardNumber");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v17, "isEqualToString:", v18);

              if ((v19 & 1) != 0)
              {

                goto LABEL_20;
              }
            }
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_20:

  v22 = (void *)objc_msgSend(v15, "mutableCopy");
  objc_msgSend(v22, "setObject:forKeyedSubscript:", self->_cardName, CFSTR("CardNameUIString"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", self->_cardholderName, CFSTR("CardholderName"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", self->_cardNumber, CFSTR("CardNumber"));
  expirationDate = self->_expirationDate;
  if (expirationDate)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", expirationDate, CFSTR("ExpirationDate"));
  lastUsedDate = self->_lastUsedDate;
  if (lastUsedDate)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", lastUsedDate, CFSTR("LastUsedDate"));
  cardSecurityCode = self->_cardSecurityCode;
  if (cardSecurityCode)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", cardSecurityCode, CFSTR("CardSecurityCode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_promptToSaveSecurityCode);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("PromptToSaveSecurityCode"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v22, 200, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
  return v21;
}

- (id)creditCardDataByMergingOtherAttributesBesidesCardNumberFromCard:(id)a3 mergeSecurityCode:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  NSDate *v8;
  unint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *cardSecurityCode;
  void *v16;
  _BOOL4 v17;
  NSString *cardholderName;
  void *v19;
  NSDate *expirationDate;
  void *v21;
  int v22;
  WBSCreditCardData *v23;
  NSDate *v24;
  uint64_t v25;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  WBSCreditCardData *v29;
  NSString *cardNumber;
  NSString *cardName;
  NSUInteger v32;
  void *v33;

  v4 = a4;
  v6 = a3;
  v7 = gregorianYearFromDate(self->_expirationDate);
  objc_msgSend(v6, "expirationDate");
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v9 = gregorianYearFromDate(v8);

  if (v4)
  {
    if (-[NSString length](self->_cardSecurityCode, "length"))
    {
      v10 = self->_cardSecurityCode;
    }
    else
    {
      objc_msgSend(v6, "cardSecurityCode");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (v9 > v7)
    {
      objc_msgSend(v6, "cardSecurityCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(v6, "cardSecurityCode");
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  cardSecurityCode = self->_cardSecurityCode;
  objc_msgSend(v6, "cardSecurityCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSString isEqualToString:](cardSecurityCode, "isEqualToString:", v16);

  cardholderName = self->_cardholderName;
  objc_msgSend(v6, "cardholderName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](cardholderName, "isEqualToString:", v19))
  {
    expirationDate = self->_expirationDate;
    objc_msgSend(v6, "expirationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NSDate isEqualToDate:](expirationDate, "isEqualToDate:", v21) && v17;

    if (v22 == 1)
    {
      v23 = self;
      goto LABEL_25;
    }
  }
  else
  {

  }
  v24 = self->_expirationDate;
  if (v9 > v7)
  {
    objc_msgSend(v6, "expirationDate");
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (NSDate *)v25;
  }
  objc_msgSend(v6, "lastUsedDate");
  v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26 || self->_lastUsedDate && -[NSDate compare:](v26, "compare:") == NSOrderedAscending)
  {
    v28 = self->_lastUsedDate;

    v27 = v28;
  }
  v29 = [WBSCreditCardData alloc];
  cardNumber = self->_cardNumber;
  cardName = self->_cardName;
  v32 = -[NSString length](self->_cardholderName, "length");
  if (v32)
  {
    v33 = self->_cardholderName;
  }
  else
  {
    objc_msgSend(v6, "cardholderName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:](v29, "initWithCardName:number:cardholderName:expirationDate:securityCode:", cardName, cardNumber, v33, v24, v11);
  if (!v32)

  -[WBSCreditCardData setLastUsedDate:](v23, "setLastUsedDate:", v27);
  -[WBSCreditCardData setPromptToSaveSecurityCode:](v23, "setPromptToSaveSecurityCode:", objc_msgSend(v6, "promptToSaveSecurityCode"));

LABEL_25:
  return v23;
}

- (id)creditCardDataByUpdatingLastUsedDate:(id)a3
{
  id v4;
  WBSCreditCardData *v5;

  v4 = a3;
  v5 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:]([WBSCreditCardData alloc], "initWithCardName:number:cardholderName:expirationDate:securityCode:", self->_cardName, self->_cardNumber, self->_cardholderName, self->_expirationDate, self->_cardSecurityCode);
  -[WBSCreditCardData setLastUsedDate:](v5, "setLastUsedDate:", v4);
  -[WBSCreditCardData setPromptToSaveSecurityCode:](v5, "setPromptToSaveSecurityCode:", self->_promptToSaveSecurityCode);

  return v5;
}

- (BOOL)hasSameCreditCardInformationAs:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "cardNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSString isEqualToString:](self->_cardNumber, "isEqualToString:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)test_setBalance:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall") & 1) != 0)
    objc_storeStrong((id *)&self->_balance, a3);

}

- (void)test_setLastUsedDate:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall") & 1) != 0)
    objc_storeStrong((id *)&self->_lastUsedDate, a3);

}

- (BOOL)isEqual:(id)a3
{
  WBSCreditCardData *v4;
  WBSCreditCardData *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (WBSCreditCardData *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WBSCreditCardData balance](v5, "balance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = WBSIsEqual();

      if ((v7 & 1) != 0)
      {
        -[WBSCreditCardData cardName](v5, "cardName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (WBSIsEqual())
        {
          -[WBSCreditCardData cardholderName](v5, "cardholderName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (WBSIsEqual())
          {
            -[WBSCreditCardData cardNumber](v5, "cardNumber");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (WBSIsEqual())
            {
              -[WBSCreditCardData expirationDate](v5, "expirationDate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (WBSIsEqual())
              {
                -[WBSCreditCardData cardSecurityCode](v5, "cardSecurityCode");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = WBSIsEqual();

              }
              else
              {
                v13 = 0;
              }

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_cardName, "hash");
  v4 = -[NSString hash](self->_cardholderName, "hash") ^ v3;
  v5 = -[NSString hash](self->_cardNumber, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_expirationDate, "hash");
  return v6 ^ -[NSString hash](self->_cardSecurityCode, "hash");
}

- (BOOL)shouldHide
{
  void *v3;
  char v4;
  double v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DebugSkipCreditCardValidation"));

  if ((v4 & 1) != 0)
    return 0;
  -[NSDate timeIntervalSinceNow](self->_expirationDate, "timeIntervalSinceNow");
  return v6 < -31536000.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardName, CFSTR("CardNameUIString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardholderName, CFSTR("CardholderName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardNumber, CFSTR("CardNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastUsedDate, CFSTR("LastUsedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSecurityCode, CFSTR("CardSecurityCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_virtualCard, CFSTR("VirtualCard"));

}

- (WBSCreditCardData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  WBSCreditCardData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v5 = (void *)getPKVirtualCardClass(void)::softClass;
  v19 = getPKVirtualCardClass(void)::softClass;
  if (!getPKVirtualCardClass(void)::softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___ZL21getPKVirtualCardClassv_block_invoke;
    v15[3] = &unk_1E4B38280;
    v15[4] = &v16;
    ___ZL21getPKVirtualCardClassv_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("VirtualCard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[WBSCreditCardData initWithVirtualCard:](self, "initWithVirtualCard:", v7);
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CardNameUIString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CardholderName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CardNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastUsedDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CardSecurityCode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WBSCreditCardData initWithCardName:number:cardholderName:expirationDate:securityCode:](self, "initWithCardName:number:cardholderName:expirationDate:securityCode:", v7, v10, v9, v11, v13);
    -[WBSCreditCardData setLastUsedDate:](v8, "setLastUsedDate:", v12);

  }
  return v8;
}

- (NSString)cardName
{
  return self->_cardName;
}

- (void)setCardName:(id)a3
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

- (NSString)cardNumber
{
  return self->_cardNumber;
}

- (void)setCardNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedDate, a3);
}

- (NSString)cardSecurityCode
{
  return self->_cardSecurityCode;
}

- (BOOL)promptToSaveSecurityCode
{
  return self->_promptToSaveSecurityCode;
}

- (void)setPromptToSaveSecurityCode:(BOOL)a3
{
  self->_promptToSaveSecurityCode = a3;
}

- (PKVirtualCard)virtualCard
{
  return self->_virtualCard;
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_virtualCard, 0);
  objc_storeStrong((id *)&self->_cardSecurityCode, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_cardNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_cardName, 0);
}

void __41__WBSCreditCardData_initWithVirtualCard___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to update last used date on virtual card %{public}@", buf, 0xCu);

}

- (void)keychainRepresentationByMigratingExistingKeychainData:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed fetching credit cards with error %d", (uint8_t *)v2, 8u);
}

@end
