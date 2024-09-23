@implementation PKPayLaterMerchantLookupSource

- (PKPayLaterMerchantLookupSource)initWithFinancingPlan:(id)a3
{
  id v5;
  PKPayLaterMerchantLookupSource *v6;
  PKPayLaterMerchantLookupSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterMerchantLookupSource;
  v6 = -[PKPayLaterMerchantLookupSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_financingPlan, a3);

  return v7;
}

- (id)mapsMerchantLookupRequest
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v3 = -[PKPayLaterFinancingPlan planChannel](self->_financingPlan, "planChannel");
  if (v3 > 3)
    v4 = 0;
  else
    v4 = qword_190455AC0[v3];
  -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fundingSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentPassDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init((Class)getMKWalletMerchantLookupRequestClass_0[0]());
  objc_msgSend(v12, "setTransactionType:", v4);
  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transactionDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTransactionDate:", v14);

  if (v11)
  {
    PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v11, "cardNetwork"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPaymentNetwork:", v15);

  }
  objc_msgSend(v5, "industryCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIndustryCategory:", v16);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "industryCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIndustryCode:", v17);

  objc_msgSend(v5, "city");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantCity:", v18);

  objc_msgSend(v5, "rawCity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantRawCity:", v19);

  objc_msgSend(v5, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantState:", v20);

  objc_msgSend(v5, "rawState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantRawState:", v21);

  objc_msgSend(v5, "zipcode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantZip:", v22);

  objc_msgSend(v5, "merchantIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantId:", v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "cleanConfidence"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantCleanConfidenceLevel:", v24);

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "totalAmount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currency");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTransactionCurrencyCode:", v27);

  objc_msgSend(v5, "rawCANL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantCanl:", v28);

  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTransactionId:", v29);

  objc_msgSend(v5, "rawName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRawMerchantCode:", v30);

  objc_msgSend(v5, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchantCode:", v31);

  objc_msgSend(v5, "clearingNetworkData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v5, "clearingNetworkData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "authNetworkData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      goto LABEL_16;
    v33 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v5, "authNetworkData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v34;
  objc_msgSend(v34, "dataUsingEncoding:", 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "JSONObjectWithData:options:error:", v37, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DE041"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTerminalId:", v38);

      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DE048"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v39, 0, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v40, 4);
          objc_msgSend(v12, "setMerchantAdditionalData:", v41);

        }
      }
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DE019"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMerchantCountryCode:", v42);

      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DE018"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMerchantType:", v43);

    }
  }
LABEL_16:
  if (v4 == 3)
  {
    objc_msgSend(v5, "webMerchantIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWarsawMerchantId:", v46);

    objc_msgSend(v5, "webMerchantName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWarsawMerchantName:", v47);

    objc_msgSend(v5, "originURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "absoluteString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWarsawMerchantDomain:", v45);
    goto LABEL_20;
  }
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "adamIdentifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdamId:", v45);
LABEL_20:

  }
  return v12;
}

- (BOOL)isRefund
{
  return 0;
}

- (BOOL)isSettlement
{
  return 0;
}

- (BOOL)containsSensitiveData
{
  return 0;
}

- (id)identifier
{
  return -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
}

- (int64_t)type
{
  return 1;
}

- (id)mapsURL
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
