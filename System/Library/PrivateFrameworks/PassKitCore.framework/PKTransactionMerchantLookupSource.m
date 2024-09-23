@implementation PKTransactionMerchantLookupSource

- (PKTransactionMerchantLookupSource)initWithTransaction:(id)a3 paymentApplication:(id)a4
{
  id v7;
  id v8;
  PKTransactionMerchantLookupSource *v9;
  PKTransactionMerchantLookupSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionMerchantLookupSource;
  v9 = -[PKTransactionMerchantLookupSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_paymentApplication, a4);
  }

  return v10;
}

- (id)mapsMerchantLookupRequest
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  PKPaymentApplication *paymentApplication;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v3 = -[PKPaymentTransaction effectiveTransactionSource](self->_transaction, "effectiveTransactionSource");
  -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  if (v3 - 1 > 7)
    v4 = 0;
  else
    v4 = qword_190455A10[v3 - 1];
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init((Class)getMKWalletMerchantLookupRequestClass[0]());
  objc_msgSend(v6, "setTransactionType:", v4);
  -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionDate:", v7);

  paymentApplication = self->_paymentApplication;
  if (paymentApplication)
  {
    PKPaymentNetworkNameForPaymentCredentialType(-[PKPaymentApplication paymentNetworkIdentifier](paymentApplication, "paymentNetworkIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPaymentNetwork:", v9);

  }
  objc_msgSend(v5, "industryCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndustryCategory:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "industryCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIndustryCode:", v11);

  objc_msgSend(v5, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantCity:", v12);

  objc_msgSend(v5, "rawCity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantRawCity:", v13);

  objc_msgSend(v5, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantState:", v14);

  objc_msgSend(v5, "rawState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantRawState:", v15);

  objc_msgSend(v5, "zip");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantZip:", v16);

  objc_msgSend(v5, "merchantIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantId:", v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "cleanConfidenceLevel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantCleanConfidenceLevel:", v18);

  -[PKPaymentTransaction currencyCode](self->_transaction, "currencyCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionCurrencyCode:", v19);

  objc_msgSend(v5, "rawCANL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantCanl:", v20);

  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTransactionId:", v21);

  objc_msgSend(v5, "rawName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRawMerchantCode:", v22);

  objc_msgSend(v5, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMerchantCode:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaymentTransaction isFuzzyMatched](self->_transaction, "isFuzzyMatched"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFuzzyMatched:", v24);

  -[PKPaymentTransaction clearingNetworkData](self->_transaction, "clearingNetworkData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction clearingNetworkData](self->_transaction, "clearingNetworkData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentTransaction authNetworkData](self->_transaction, "authNetworkData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_16;
    v26 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction authNetworkData](self->_transaction, "authNetworkData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = v27;
  objc_msgSend(v27, "dataUsingEncoding:", 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "JSONObjectWithData:options:error:", v30, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DE041"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTerminalId:", v31);

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DE048"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 0, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v33, 4);
          objc_msgSend(v6, "setMerchantAdditionalData:", v34);

        }
      }
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DE019"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMerchantCountryCode:", v35);

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DE018"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMerchantType:", v36);

    }
  }
LABEL_16:
  switch(v4)
  {
    case 1:
    case 4:
      -[PKPaymentTransaction location](self->_transaction, "location");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PKGEOLocationFromCLLocation(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLocation:", v38);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PKPaymentTransaction isCoarseLocation](self->_transaction, "isCoarseLocation"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCoarseLocationUsed:", v39);
      goto LABEL_21;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "adamIdentifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringValue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAdamId:", v40);
      goto LABEL_20;
    case 3:
      objc_msgSend(v5, "webMerchantIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWarsawMerchantId:", v41);

      objc_msgSend(v5, "webMerchantName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWarsawMerchantName:", v42);

      objc_msgSend(v5, "originURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "absoluteString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWarsawMerchantDomain:", v40);
LABEL_20:

LABEL_21:
      break;
    default:
      break;
  }

  return v6;
}

- (BOOL)isRefund
{
  return -[PKPaymentTransaction transactionStatus](self->_transaction, "transactionStatus") == 3
      || -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 1;
}

- (BOOL)isSettlement
{
  return self->_clearingAttempt;
}

- (BOOL)containsSensitiveData
{
  return 0;
}

- (id)identifier
{
  return -[PKPaymentTransaction identifier](self->_transaction, "identifier");
}

- (int64_t)type
{
  return 0;
}

- (id)mapsURL
{
  return 0;
}

- (BOOL)isClearingAttempt
{
  return self->_clearingAttempt;
}

- (void)setClearingAttempt:(BOOL)a3
{
  self->_clearingAttempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
