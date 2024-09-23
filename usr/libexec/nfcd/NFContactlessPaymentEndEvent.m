@implementation NFContactlessPaymentEndEvent

+ (BOOL)logsTransactionDetails
{
  id v2;
  unsigned __int8 v3;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LogTransactionDetails"));

  return v3;
}

- (NFContactlessPaymentEndEvent)initWithDictionary:(id)a3
{
  id v4;
  NFContactlessPaymentEndEvent *v5;
  uint64_t v6;
  NSString *appletIdentifier;
  uint64_t v8;
  NSString *keyIdentifier;
  uint64_t v10;
  NSString *readerIdentifier;
  uint64_t v12;
  NSString *transactionIdentifier;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDecimalNumber *amount;
  uint64_t v21;
  NSString *currency;
  uint64_t v23;
  NSData *tlv;
  void *v25;
  uint64_t v26;
  NSDictionary *felicaInfo;
  uint64_t v28;
  NSDictionary *parsedInfo;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *v33;
  NSDictionary *v34;
  NSDictionary *v35;
  uint64_t v36;
  objc_super v38;
  const __CFString *v39;
  void *v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NFContactlessPaymentEndEvent;
  v5 = -[NFContactlessPaymentEndEvent init](&v38, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletIdentifier")));
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endPointIdentifier")));
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readerIdentifier")));
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transactionIdentifier")));
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("didError")));
    v5->_didError = objc_msgSend(v14, "BOOLValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("command")));
    v5->_command = objc_msgSend(v15, "unsignedIntValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
    v5->_status = (unsigned __int16)objc_msgSend(v16, "unsignedIntValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result")));
    v5->_result = (unsigned __int16)objc_msgSend(v17, "unsignedIntValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("informative")));
    v5->_informative = (unsigned __int16)objc_msgSend(v18, "unsignedIntValue");

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("amount")));
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v19;

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currency")));
    currency = v5->_currency;
    v5->_currency = (NSString *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tlv")));
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
    v5->_type = (unsigned __int16)objc_msgSend(v25, "unsignedIntValue");

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("felicaInfo")));
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parsedInfo")));
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BackgroundTransaction")));
    v5->_background = objc_msgSend(v30, "BOOLValue");

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PairingModeBrandCode")));
    if (v31)
    {
      v32 = v5->_parsedInfo;
      if (v32)
      {
        v33 = (NSDictionary *)-[NSDictionary mutableCopy](v32, "mutableCopy");
        -[NSDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v31, CFSTR("PairingModeBrandCode"));
        v34 = (NSDictionary *)-[NSDictionary copy](v33, "copy");
        v35 = v5->_parsedInfo;
        v5->_parsedInfo = v34;

      }
      else
      {
        v39 = CFSTR("PairingModeBrandCode");
        v40 = v31;
        v36 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
        v33 = v5->_parsedInfo;
        v5->_parsedInfo = (NSDictionary *)v36;
      }

    }
  }

  return v5;
}

- (id)description
{
  id v3;
  NSString *readerIdentifier;
  id v5;
  unsigned int type;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  unsigned __int16 informative;
  int v13;
  NSDictionary *parsedInfo;
  NSMutableArray *v15;
  id v16;
  void *v17;
  NSString *transactionIdentifier;
  id v19;
  id v20;
  void *v21;
  _BOOL4 didError;
  uint64_t status;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t command;
  uint64_t v28;
  NSMutableArray *v29;
  void *v30;
  const __CFString *currency;
  const __CFString *v32;
  id v33;
  uint64_t v35;
  __CFString *v36;
  id v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  objc_super v41;

  if (self->_keyIdentifier)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("applet=%@ endpoint=%@ "), self->_appletIdentifier, self->_keyIdentifier);
  }
  else
  {
    readerIdentifier = self->_readerIdentifier;
    v5 = objc_alloc((Class)NSString);
    if (readerIdentifier)
      v3 = objc_msgSend(v5, "initWithFormat:", CFSTR("applet=%@ reader=%@ "), self->_appletIdentifier, self->_readerIdentifier);
    else
      v3 = objc_msgSend(v5, "initWithFormat:", CFSTR("applet=%@ "), self->_appletIdentifier, v35);
  }
  type = self->_type;
  v7 = CFSTR("UNKNOWN");
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        v7 = CFSTR("Felica");
      }
      else if (type == 61441)
      {
        v7 = CFSTR("Parsed by ATL");
      }
    }
    else if (type == 32)
    {
      v7 = CFSTR("RefundPurchase");
    }
    else if (type == 34)
    {
      v7 = CFSTR("VoidPurchase");
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        v7 = CFSTR("Purchase");
        break;
      case 1u:
        v7 = CFSTR("Cashback");
        break;
      case 2u:
        v7 = CFSTR("VoidRefund");
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        v7 = CFSTR("PurchaseWithCashback");
        break;
      default:
        if (type == 23)
          v7 = CFSTR("CashDisbursement");
        break;
    }
  }
  v8 = self->_result;
  v9 = CFSTR("UNKNOWN");
  v39 = v7;
  v40 = v3;
  if (v8 <= 0xFF)
  {
    if (self->_result)
    {
      if (v8 == 64)
      {
        v9 = CFSTR("offline/approved");
      }
      else if (v8 == 128)
      {
        v9 = CFSTR("online/pending");
      }
    }
    else
    {
      v9 = CFSTR("offline/declined");
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        v9 = CFSTR("failed/field tear");
        break;
      case 0xF001u:
        v9 = CFSTR("offline type f");
        break;
      case 0xF002u:
        v9 = CFSTR("online type f");
        break;
      case 0xF003u:
        v9 = CFSTR("express transit");
        break;
      case 0xF004u:
        v9 = CFSTR("incompatible applet");
        break;
      case 0xF005u:
        v9 = CFSTR("key not found");
        break;
      case 0xF006u:
        v9 = CFSTR("reader in pairing mode");
        break;
      case 0xF007u:
        v9 = CFSTR("no matching key");
        break;
      default:
        if (v8 == 256)
          v9 = CFSTR("failed");
        break;
    }
  }
  v10 = objc_opt_new(NSMutableArray);
  v11 = v10;
  informative = self->_informative;
  if ((informative & 1) != 0)
  {
    -[NSMutableArray addObject:](v10, "addObject:", CFSTR("PINRequired"));
    informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_43:
      if ((informative & 4) == 0)
        goto LABEL_44;
      goto LABEL_54;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_43;
  }
  -[NSMutableArray addObject:](v11, "addObject:", CFSTR("WarningPresent"));
  informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_44:
    if ((informative & 8) == 0)
      goto LABEL_45;
    goto LABEL_55;
  }
LABEL_54:
  -[NSMutableArray addObject:](v11, "addObject:", CFSTR("ContactIssuer"));
  informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_45:
    if ((informative & 0x100) == 0)
      goto LABEL_46;
LABEL_56:
    -[NSMutableArray addObject:](v11, "addObject:", CFSTR("EMVTransaction"));
    if ((self->_informative & 0x8000) == 0)
      goto LABEL_47;
    goto LABEL_57;
  }
LABEL_55:
  -[NSMutableArray addObject:](v11, "addObject:", CFSTR("PINAttemptsExceeded"));
  informative = self->_informative;
  if ((informative & 0x100) != 0)
    goto LABEL_56;
LABEL_46:
  if ((informative & 0x8000) == 0)
    goto LABEL_47;
LABEL_57:
  -[NSMutableArray addObject:](v11, "addObject:", CFSTR("ActionNeeded"));
LABEL_47:
  v38 = v9;
  if (!+[NFContactlessPaymentEndEvent logsTransactionDetails](NFContactlessPaymentEndEvent, "logsTransactionDetails"))
  {
LABEL_51:
    v36 = &stru_1002ED8A8;
    goto LABEL_64;
  }
  v13 = self->_type;
  if (v13 == 61441)
  {
    parsedInfo = self->_parsedInfo;
    if (!parsedInfo)
      goto LABEL_51;
LABEL_59:
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](parsedInfo, "description"));
    goto LABEL_64;
  }
  if (v13 == 256)
  {
    parsedInfo = self->_felicaInfo;
    if (!parsedInfo)
      goto LABEL_51;
    goto LABEL_59;
  }
  v15 = v11;
  v16 = objc_alloc((Class)NSString);
  v17 = v16;
  transactionIdentifier = self->_transactionIdentifier;
  if (self->_amount)
  {
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), self->_amount);
    v36 = (__CFString *)objc_msgSend(v17, "initWithFormat:", CFSTR("transID=%@ amount=%@ tlv=%@ "), transactionIdentifier, v19, self->_tlv);

  }
  else
  {
    v36 = (__CFString *)objc_msgSend(v16, "initWithFormat:", CFSTR("transID=%@ amount=%@ tlv=%@ "), transactionIdentifier, CFSTR("NOT_PRESENT"), self->_tlv);
  }
  v11 = v15;
LABEL_64:
  v37 = objc_alloc((Class)NSString);
  v41.receiver = self;
  v41.super_class = (Class)NFContactlessPaymentEndEvent;
  v20 = -[NFContactlessPaymentEndEvent description](&v41, "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  didError = self->_didError;
  status = self->_status;
  v24 = self->_type;
  v25 = self->_result;
  v26 = self->_informative;
  command = self->_command;
  v28 = objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v11, "componentsJoinedByString:", CFSTR(",")));
  v29 = v11;
  v30 = (void *)v28;
  currency = (const __CFString *)self->_currency;
  if (!currency)
    currency = CFSTR("NOT_PRESENT");
  v32 = CFSTR("YES");
  if (!didError)
    v32 = CFSTR("NO");
  v33 = objc_msgSend(v37, "initWithFormat:", CFSTR("%@ { %@ didError=%@ command=0x%04x status=0x%04x type=0x%04x(%@) result=0x%04x(%@) informative=0x%04x(%@) currency=%@ %@}"), v21, v40, v32, command, status, v24, v39, v25, v38, v26, v28, currency, v36);

  return v33;
}

- (id)asDictionary
{
  unsigned int type;
  const __CFString *v4;
  unsigned int v5;
  const __CFString *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  unsigned __int16 informative;
  id v10;
  void *v11;
  NSString *transactionIdentifier;
  id v13;
  NSDictionary *v14;
  NSDictionary *felicaInfo;
  NSDictionary *v16;
  NSDictionary *parsedInfo;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *currency;
  NSDictionary *v25;
  NSDictionary *v26;
  void *v27;
  id v28;
  __CFString *v30;
  void *v31;
  NSMutableArray *v32;
  NSString *readerIdentifier;
  NSString *keyIdentifier;
  NSString *appletIdentifier;
  id v36;
  const __CFString *v37;
  const __CFString *v38;

  type = self->_type;
  v4 = CFSTR("UNKNOWN");
  if (type > 0x1F)
  {
    if (self->_type > 0xFFu)
    {
      if (type == 256)
      {
        v4 = CFSTR("Felica");
      }
      else if (type == 61441)
      {
        v4 = CFSTR("ATL");
      }
    }
    else if (type == 32)
    {
      v4 = CFSTR("RefundPurchase");
    }
    else if (type == 34)
    {
      v4 = CFSTR("VoidPurchase");
    }
  }
  else
  {
    switch(self->_type)
    {
      case 0u:
        v4 = CFSTR("Purchase");
        break;
      case 1u:
        v4 = CFSTR("Cashback");
        break;
      case 2u:
        v4 = CFSTR("VoidRefund");
        break;
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
        break;
      case 9u:
        v4 = CFSTR("PurchaseWithCashback");
        break;
      default:
        if (type == 23)
          v4 = CFSTR("CashDisbursement");
        break;
    }
  }
  v5 = self->_result;
  v6 = CFSTR("UNKNOWN");
  v38 = v4;
  if (v5 <= 0xFF)
  {
    if (self->_result)
    {
      if (v5 == 64)
      {
        v6 = CFSTR("offline/approved");
      }
      else if (v5 == 128)
      {
        v6 = CFSTR("online/pending");
      }
    }
    else
    {
      v6 = CFSTR("offline/declined");
    }
  }
  else
  {
    switch(self->_result)
    {
      case 0xF000u:
        v6 = CFSTR("failed/field tear");
        break;
      case 0xF001u:
        v6 = CFSTR("offline type f");
        break;
      case 0xF002u:
        v6 = CFSTR("online type f");
        break;
      case 0xF003u:
        v6 = CFSTR("express transit");
        break;
      case 0xF004u:
        v6 = CFSTR("incompatible applet");
        break;
      case 0xF005u:
        v6 = CFSTR("key not found");
        break;
      case 0xF006u:
        v6 = CFSTR("reader in pairing mode");
        break;
      case 0xF007u:
        v6 = CFSTR("no matching key");
        break;
      default:
        if (v5 == 256)
          v6 = CFSTR("failed");
        break;
    }
  }
  v37 = v6;
  v7 = objc_opt_new(NSMutableArray);
  v8 = v7;
  informative = self->_informative;
  if ((informative & 1) != 0)
  {
    -[NSMutableArray addObject:](v7, "addObject:", CFSTR("PINRequired"));
    informative = self->_informative;
    if ((informative & 2) == 0)
    {
LABEL_38:
      if ((informative & 4) == 0)
        goto LABEL_39;
      goto LABEL_47;
    }
  }
  else if ((informative & 2) == 0)
  {
    goto LABEL_38;
  }
  -[NSMutableArray addObject:](v8, "addObject:", CFSTR("WarningPresent"));
  informative = self->_informative;
  if ((informative & 4) == 0)
  {
LABEL_39:
    if ((informative & 8) == 0)
      goto LABEL_40;
    goto LABEL_48;
  }
LABEL_47:
  -[NSMutableArray addObject:](v8, "addObject:", CFSTR("ContactIssuer"));
  informative = self->_informative;
  if ((informative & 8) == 0)
  {
LABEL_40:
    if ((informative & 0x100) == 0)
      goto LABEL_41;
LABEL_49:
    -[NSMutableArray addObject:](v8, "addObject:", CFSTR("EMVTransaction"));
    if ((self->_informative & 0x8000) == 0)
      goto LABEL_42;
    goto LABEL_50;
  }
LABEL_48:
  -[NSMutableArray addObject:](v8, "addObject:", CFSTR("PINAttemptsExceeded"));
  informative = self->_informative;
  if ((informative & 0x100) != 0)
    goto LABEL_49;
LABEL_41:
  if ((informative & 0x8000) == 0)
    goto LABEL_42;
LABEL_50:
  -[NSMutableArray addObject:](v8, "addObject:", CFSTR("ActionNeeded"));
LABEL_42:
  if (+[NFContactlessPaymentEndEvent logsTransactionDetails](NFContactlessPaymentEndEvent, "logsTransactionDetails"))
  {
    v10 = objc_alloc((Class)NSString);
    v11 = v10;
    transactionIdentifier = self->_transactionIdentifier;
    if (self->_amount)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), self->_amount);
      v30 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR(", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, "), transactionIdentifier, v13, self->_tlv);

    }
    else
    {
      v30 = (__CFString *)objc_msgSend(v10, "initWithFormat:", CFSTR(", \"transID\" : %@, \"amount\" : %@, \"tlv\" : %@, "), transactionIdentifier, CFSTR("NOT_PRESENT"), self->_tlv);
    }
  }
  else
  {
    v30 = &stru_1002ED8A8;
  }
  if (!self->_felicaInfo)
  {
    v14 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    felicaInfo = self->_felicaInfo;
    self->_felicaInfo = v14;

  }
  if (!self->_parsedInfo)
  {
    v16 = objc_opt_new(NSDictionary);
    parsedInfo = self->_parsedInfo;
    self->_parsedInfo = v16;

  }
  v18 = objc_alloc((Class)NSDictionary);
  appletIdentifier = self->_appletIdentifier;
  v36 = v18;
  readerIdentifier = self->_readerIdentifier;
  keyIdentifier = self->_keyIdentifier;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_command));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_status));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_type));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_result));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", self->_informative));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", CFSTR(",")));
  currency = self->_currency;
  v32 = v8;
  v25 = self->_felicaInfo;
  v26 = self->_parsedInfo;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_background));
  v28 = objc_msgSend(v36, "initWithObjectsAndKeys:", appletIdentifier, CFSTR("applet"), keyIdentifier, CFSTR("endpoint"), readerIdentifier, CFSTR("reader"), v31, CFSTR("command"), v19, CFSTR("status"), v20, CFSTR("type"), v38, CFSTR("typeStr"), v21, CFSTR("result"), v37,
          CFSTR("resultStr"),
          v22,
          CFSTR("informative"),
          v23,
          CFSTR("informativeStr"),
          currency,
          CFSTR("currency"),
          v30,
          CFSTR("details"),
          v25,
          CFSTR("felicaInfo"),
          v26,
          CFSTR("parsedInfo"),
          v27,
          CFSTR("background"),
          0);

  return v28;
}

- (id)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)_setApplet:(id)a3
{
  objc_storeStrong((id *)&self->_applet, a3);
}

- (NFContactlessPaymentEndEvent)initWithCoder:(id)a3
{
  id v4;
  NFContactlessPaymentEndEvent *v5;
  id v6;
  uint64_t v7;
  NSString *appletIdentifier;
  id v9;
  uint64_t v10;
  NSString *keyIdentifier;
  id v12;
  uint64_t v13;
  NSString *readerIdentifier;
  id v15;
  uint64_t v16;
  NSString *transactionIdentifier;
  id v18;
  uint64_t v19;
  NSDecimalNumber *amount;
  id v21;
  uint64_t v22;
  NSString *currency;
  id v24;
  uint64_t v25;
  NSData *tlv;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  NSDictionary *felicaInfo;
  uint64_t v37;
  NSDictionary *parsedInfo;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NFContactlessPaymentEndEvent;
  v5 = -[NFContactlessPaymentEndEvent init](&v40, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("appletIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("endPointIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("readerIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("transactionIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    transactionIdentifier = v5->_transactionIdentifier;
    v5->_transactionIdentifier = (NSString *)v16;

    v5->_didError = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didError"));
    v5->_command = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("command"));
    v5->_status = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("status"));
    v5->_type = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("type"));
    v5->_result = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("result"));
    v5->_informative = (unsigned __int16)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("informative"));
    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDecimalNumber), CFSTR("amount"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("currency"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    currency = v5->_currency;
    v5->_currency = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("tlv"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    tlv = v5->_tlv;
    v5->_tlv = (NSData *)v25;

    v5->_background = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BackgroundTransaction"));
    v27 = objc_alloc((Class)NSSet);
    v28 = objc_opt_class(NSString);
    v29 = objc_opt_class(NSDictionary);
    v30 = objc_opt_class(NSDate);
    v31 = objc_opt_class(NSDateComponents);
    v32 = objc_opt_class(NSData);
    v33 = objc_opt_class(NSNumber);
    v34 = objc_msgSend(v27, "initWithObjects:", v28, v29, v30, v31, v32, v33, objc_opt_class(NSArray), 0);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("felicaInfo")));
    felicaInfo = v5->_felicaInfo;
    v5->_felicaInfo = (NSDictionary *)v35;

    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("parsedInfo")));
    parsedInfo = v5->_parsedInfo;
    v5->_parsedInfo = (NSDictionary *)v37;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appletIdentifier;
  id v5;

  appletIdentifier = self->_appletIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appletIdentifier, CFSTR("appletIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyIdentifier, CFSTR("endPointIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerIdentifier, CFSTR("readerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifier, CFSTR("transactionIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didError, CFSTR("didError"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_command, CFSTR("command"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_result, CFSTR("result"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_informative, CFSTR("informative"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currency, CFSTR("currency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tlv, CFSTR("tlv"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_felicaInfo, CFSTR("felicaInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parsedInfo, CFSTR("parsedInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_background, CFSTR("BackgroundTransaction"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (BOOL)didError
{
  return self->_didError;
}

- (unsigned)command
{
  return self->_command;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)informative
{
  return self->_informative;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
}

- (NSData)tlv
{
  return self->_tlv;
}

- (NSDictionary)felicaInfo
{
  return self->_felicaInfo;
}

- (NSDictionary)parsedInfo
{
  return self->_parsedInfo;
}

- (BOOL)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedInfo, 0);
  objc_storeStrong((id *)&self->_felicaInfo, 0);
  objc_storeStrong((id *)&self->_tlv, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
