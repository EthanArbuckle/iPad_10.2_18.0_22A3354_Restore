@implementation PKAppleBalanceMockUtilities

+ (id)mockAppleBalanceAccount
{
  PKAccount *v2;
  void *v3;
  PKAppleBalanceAccountDetails *v4;
  void *v5;
  void *v6;
  PKAppleBalanceAccountSummary *v7;
  void *v8;
  PKAccountDetails *v9;
  id v10;
  PKAppleBalanceAccountFeatureDescriptor *v11;
  PKAppleBalanceAccountFeatureDescriptor *v12;
  PKAppleBalanceAccountFeatureDescriptor *v13;
  PKAppleBalanceAccountFeatureDescriptor *v14;
  void *v15;

  v2 = objc_alloc_init(PKAccount);
  -[PKAccount setAccountIdentifier:](v2, "setAccountIdentifier:", CFSTR("apple-balance-account-001"));
  -[PKAccount setFeature:](v2, "setFeature:", 4);
  -[PKAccount setType:](v2, "setType:", 3);
  -[PKAccount setState:](v2, "setState:", 1);
  -[PKAccount setAccessLevel:](v2, "setAccessLevel:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccount setLastUpdated:](v2, "setLastUpdated:", v3);

  v4 = objc_alloc_init(PKAppleBalanceAccountDetails);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -7257600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceAccountDetails setCreatedDate:](v4, "setCreatedDate:", v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceAccountDetails setLastUpdatedDate:](v4, "setLastUpdatedDate:", v6);

  -[PKAppleBalanceAccountDetails setCountryCode:](v4, "setCountryCode:", CFSTR("US"));
  -[PKAppleBalanceAccountDetails setCurrencyCode:](v4, "setCurrencyCode:", CFSTR("USD"));
  -[PKAppleBalanceAccountDetails setCardType:](v4, "setCardType:", 135);
  -[PKAppleBalanceAccountDetails setAssociatedPassTypeIdentifier:](v4, "setAssociatedPassTypeIdentifier:", CFSTR("paymentpass.com.apple.wallet.dev"));
  -[PKAppleBalanceAccountDetails setAssociatedPassSerialNumber:](v4, "setAssociatedPassSerialNumber:", CFSTR("00001111122223333444332211113344321"));
  -[PKAppleBalanceAccountDetails setFpanIdentifier:](v4, "setFpanIdentifier:", CFSTR("FAPLLY3814311690852077410603"));
  v7 = objc_alloc_init(PKAppleBalanceAccountSummary);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("500.00"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceAccountSummary setCurrentBalance:](v7, "setCurrentBalance:", v8);

  -[PKAppleBalanceAccountDetails setAccountSummary:](v4, "setAccountSummary:", v7);
  v9 = -[PKAccountDetails initWithAppleBalanceDetails:]([PKAccountDetails alloc], "initWithAppleBalanceDetails:", v4);
  -[PKAccount setDetails:](v2, "setDetails:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(PKAppleBalanceAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v11, "setIdentifier:", CFSTR("directTopUp"));
  objc_msgSend(v10, "addObject:", v11);
  v12 = objc_alloc_init(PKAppleBalanceAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v12, "setIdentifier:", CFSTR("ampRedemptionSupported"));
  objc_msgSend(v10, "addObject:", v12);
  v13 = objc_alloc_init(PKAppleBalanceAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v13, "setIdentifier:", CFSTR("inStoreTopUp"));
  objc_msgSend(v10, "addObject:", v13);
  v14 = objc_alloc_init(PKAppleBalanceAccountFeatureDescriptor);
  -[PKAccountFeatureDescriptor setIdentifier:](v14, "setIdentifier:", CFSTR("inStorePayment"));
  objc_msgSend(v10, "addObject:", v14);
  v15 = (void *)objc_msgSend(v10, "copy");
  -[PKAccount setSupportedFeatures:](v2, "setSupportedFeatures:", v15);

  return v2;
}

+ (id)mockPromotion
{
  PKAppleBalancePromotionConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKAppleBalancePromotionConfiguration *v8;
  _QWORD v10[10];
  _QWORD v11[11];

  v11[10] = *MEMORY[0x1E0C80C00];
  v3 = [PKAppleBalancePromotionConfiguration alloc];
  v10[0] = CFSTR("promotionType");
  v10[1] = CFSTR("programIdentifier");
  v11[0] = CFSTR("Content");
  v11[1] = CFSTR("30154");
  v10[2] = CFSTR("versionIdentifier");
  v10[3] = CFSTR("generationIdentifier");
  v11[2] = CFSTR("v701909");
  v11[3] = &unk_1E2C3ED88;
  v11[4] = &unk_1E2C3EDA0;
  v10[4] = CFSTR("stamp");
  v10[5] = CFSTR("bonusMinAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50.0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v4;
  v10[6] = CFSTR("bonusMaxAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("200.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v5;
  v11[7] = CFSTR("Add $50 or more and get 1 month of Apple Music free.");
  v10[7] = CFSTR("offerText");
  v10[8] = CFSTR("conditionText");
  v11[8] = CFSTR("1 month free, then $14.99/month. Limit 1 per Apple Account. Must claim your free content bonus immediately. Terms apply.");
  v10[9] = CFSTR("lastUpdatedDate");
  objc_msgSend(a1, "_date1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[9] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKAppleBalancePromotionConfiguration initWithDictionary:](v3, "initWithDictionary:", v7);

  return v8;
}

+ (id)mockInStoreTopUpToken
{
  PKAppleBalanceInStoreTopUpToken *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(PKAppleBalanceInStoreTopUpToken);
  objc_msgSend(a1, "_inStoreTokenForType:debugType:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceInStoreTopUpToken setToken:](v3, "setToken:", v4);

  -[PKAppleBalanceInStoreTopUpToken setTokenIdentifier:](v3, "setTokenIdentifier:", CFSTR("12345678912345678912345678912345"));
  -[PKAppleBalanceInStoreTopUpToken setTokenType:](v3, "setTokenType:", 0);
  objc_msgSend(a1, "_date1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceInStoreTopUpToken setExpirationDate:](v3, "setExpirationDate:", v6);

  -[PKAppleBalanceInStoreTopUpToken setState:](v3, "setState:", 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceInStoreTopUpToken setTermsURL:](v3, "setTermsURL:", v7);

  return v3;
}

+ (id)mockAMPPaymentTransactionWithAccountIdentifier:(id)a3
{
  id v3;
  PKMerchant *v4;
  PKPaymentTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(PKMerchant);
  -[PKMerchant setRawName:](v4, "setRawName:", CFSTR("apple.com/bill"));
  -[PKMerchant setName:](v4, "setName:", CFSTR("Apple Services"));
  -[PKMerchant setIndustryCode:](v4, "setIndustryCode:", 5818);
  -[PKMerchant setIndustryCategory:](v4, "setIndustryCategory:", CFSTR("Other"));
  -[PKMerchant setCity:](v4, "setCity:", CFSTR("Cupertino"));
  -[PKMerchant setState:](v4, "setState:", CFSTR("CA"));
  v5 = objc_alloc_init(PKPaymentTransaction);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setServiceIdentifier:](v5, "setServiceIdentifier:", v7);

  -[PKPaymentTransaction setTransactionStatus:](v5, "setTransactionStatus:", 1);
  -[PKPaymentTransaction setTransactionType:](v5, "setTransactionType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("25.00"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setAmount:](v5, "setAmount:", v8);

  -[PKPaymentTransaction setCurrencyCode:](v5, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setTransactionDate:](v5, "setTransactionDate:", v9);
  -[PKPaymentTransaction setTransactionStatusChangedDate:](v5, "setTransactionStatusChangedDate:", v9);
  -[PKPaymentTransaction setCardType:](v5, "setCardType:", 7);
  -[PKPaymentTransaction setAccountIdentifier:](v5, "setAccountIdentifier:", v3);

  -[PKPaymentTransaction setAccountType:](v5, "setAccountType:", 4);
  -[PKPaymentTransaction setMerchant:](v5, "setMerchant:", v4);

  return v5;
}

+ (id)mockAOSPaymentTransactionWithAccountIdentifier:(id)a3
{
  id v3;
  PKMerchant *v4;
  PKPaymentTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(PKMerchant);
  -[PKMerchant setRawName:](v4, "setRawName:", CFSTR("apple.com/us"));
  -[PKMerchant setName:](v4, "setName:", CFSTR("Apple Store"));
  -[PKMerchant setIndustryCode:](v4, "setIndustryCode:", 5732);
  -[PKMerchant setIndustryCategory:](v4, "setIndustryCategory:", CFSTR("Other"));
  -[PKMerchant setCity:](v4, "setCity:", CFSTR("Cupertino"));
  -[PKMerchant setState:](v4, "setState:", CFSTR("CA"));
  v5 = objc_alloc_init(PKPaymentTransaction);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setServiceIdentifier:](v5, "setServiceIdentifier:", v7);

  -[PKPaymentTransaction setTransactionStatus:](v5, "setTransactionStatus:", 1);
  -[PKPaymentTransaction setTransactionType:](v5, "setTransactionType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("258.00"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setAmount:](v5, "setAmount:", v8);

  -[PKPaymentTransaction setCurrencyCode:](v5, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setTransactionDate:](v5, "setTransactionDate:", v9);
  -[PKPaymentTransaction setTransactionStatusChangedDate:](v5, "setTransactionStatusChangedDate:", v9);
  -[PKPaymentTransaction setCardType:](v5, "setCardType:", 7);
  -[PKPaymentTransaction setAccountIdentifier:](v5, "setAccountIdentifier:", v3);

  -[PKPaymentTransaction setAccountType:](v5, "setAccountType:", 4);
  -[PKPaymentTransaction setMerchant:](v5, "setMerchant:", v4);

  return v5;
}

+ (id)mockPOSPaymentTransactionWithAccountIdentifier:(id)a3 paymentApplication:(id)a4 localTransaction:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKMerchant *v16;
  PKPaymentTransaction *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentTransaction paymentTransactionWithSource:](PKPaymentTransaction, "paymentTransactionWithSource:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOriginatedByDevice:", 1);
  objc_msgSend(v13, "setTransactionType:", 0);
  objc_msgSend(v13, "setPaymentHash:", v11);
  objc_msgSend(v13, "addUpdateReasons:", 1);
  objc_msgSend(v8, "dpanIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDPANIdentifier:", v14);

  v15 = objc_msgSend(v8, "paymentNetworkIdentifier");
  objc_msgSend(v13, "setPaymentNetworkIdentifier:", v15);
  objc_msgSend(v13, "setTransactionDate:", v12);
  objc_msgSend(v13, "setTechnologyType:", 2);
  objc_msgSend(v13, "setLocationDate:", v12);
  objc_msgSend(v13, "setLocationLatitude:", 37.3315124);
  objc_msgSend(v13, "setLocationLongitude:", -122.030662);
  objc_msgSend(v13, "setProcessedForLocation:", 1);
  if (a5)
    *a5 = objc_retainAutorelease(v13);
  v16 = objc_alloc_init(PKMerchant);
  -[PKMerchant setRawName:](v16, "setRawName:", CFSTR("apple store #r052"));
  -[PKMerchant setName:](v16, "setName:", CFSTR("Apple Infinite Loop"));
  -[PKMerchant setIndustryCode:](v16, "setIndustryCode:", 5732);
  -[PKMerchant setIndustryCategory:](v16, "setIndustryCategory:", CFSTR("Other"));
  -[PKMerchant setCity:](v16, "setCity:", CFSTR("Cupertino"));
  -[PKMerchant setState:](v16, "setState:", CFSTR("CA"));
  v17 = objc_alloc_init(PKPaymentTransaction);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setServiceIdentifier:](v17, "setServiceIdentifier:", v19);

  -[PKPaymentTransaction setPaymentHash:](v17, "setPaymentHash:", v11);
  -[PKPaymentTransaction setTransactionStatus:](v17, "setTransactionStatus:", 1);
  -[PKPaymentTransaction setTransactionType:](v17, "setTransactionType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("258.00"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setAmount:](v17, "setAmount:", v20);

  -[PKPaymentTransaction setCurrencyCode:](v17, "setCurrencyCode:", CFSTR("USD"));
  -[PKPaymentTransaction setTransactionDate:](v17, "setTransactionDate:", v12);
  -[PKPaymentTransaction setTransactionStatusChangedDate:](v17, "setTransactionStatusChangedDate:", v12);
  -[PKPaymentTransaction setCardType:](v17, "setCardType:", 7);
  -[PKPaymentTransaction setAccountIdentifier:](v17, "setAccountIdentifier:", v9);

  -[PKPaymentTransaction setAccountType:](v17, "setAccountType:", 4);
  -[PKPaymentTransaction setMerchant:](v17, "setMerchant:", v16);

  return v17;
}

+ (id)mockTopUpPaymentTransactionWithAccountIdentifier:(id)a3
{
  id v3;
  PKMerchant *v4;
  PKPaymentTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(PKMerchant);
  -[PKMerchant setRawName:](v4, "setRawName:", CFSTR("apple.com/bill"));
  -[PKMerchant setName:](v4, "setName:", CFSTR("Apple Services"));
  -[PKMerchant setIndustryCode:](v4, "setIndustryCode:", 5818);
  -[PKMerchant setIndustryCategory:](v4, "setIndustryCategory:", CFSTR("Other"));
  -[PKMerchant setCity:](v4, "setCity:", CFSTR("Cupertino"));
  -[PKMerchant setState:](v4, "setState:", CFSTR("CA"));
  v5 = objc_alloc_init(PKPaymentTransaction);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setServiceIdentifier:](v5, "setServiceIdentifier:", v7);

  -[PKPaymentTransaction setTransactionStatus:](v5, "setTransactionStatus:", 1);
  -[PKPaymentTransaction setTransactionType:](v5, "setTransactionType:", 6);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("15.00"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setAmount:](v5, "setAmount:", v8);

  -[PKPaymentTransaction setCurrencyCode:](v5, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setTransactionDate:](v5, "setTransactionDate:", v9);
  -[PKPaymentTransaction setTransactionStatusChangedDate:](v5, "setTransactionStatusChangedDate:", v9);
  -[PKPaymentTransaction setCardType:](v5, "setCardType:", 8);
  -[PKPaymentTransaction setAccountIdentifier:](v5, "setAccountIdentifier:", v3);

  -[PKPaymentTransaction setAccountType:](v5, "setAccountType:", 4);
  -[PKPaymentTransaction setMerchant:](v5, "setMerchant:", v4);

  return v5;
}

+ (id)mockRedemptionPaymentTransactionWithAccountIdentifier:(id)a3
{
  id v3;
  PKMerchant *v4;
  PKPaymentTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(PKMerchant);
  -[PKMerchant setRawName:](v4, "setRawName:", CFSTR("apple.com/bill"));
  -[PKMerchant setName:](v4, "setName:", CFSTR("Apple Services"));
  -[PKMerchant setIndustryCode:](v4, "setIndustryCode:", 5818);
  -[PKMerchant setIndustryCategory:](v4, "setIndustryCategory:", CFSTR("Other"));
  -[PKMerchant setCity:](v4, "setCity:", CFSTR("Cupertino"));
  -[PKMerchant setState:](v4, "setState:", CFSTR("CA"));
  v5 = objc_alloc_init(PKPaymentTransaction);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setServiceIdentifier:](v5, "setServiceIdentifier:", v7);

  -[PKPaymentTransaction setTransactionStatus:](v5, "setTransactionStatus:", 1);
  -[PKPaymentTransaction setTransactionType:](v5, "setTransactionType:", 6);
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50.00"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setAmount:](v5, "setAmount:", v8);

  -[PKPaymentTransaction setCurrencyCode:](v5, "setCurrencyCode:", CFSTR("USD"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction setTransactionDate:](v5, "setTransactionDate:", v9);
  -[PKPaymentTransaction setTransactionStatusChangedDate:](v5, "setTransactionStatusChangedDate:", v9);
  -[PKPaymentTransaction setCardType:](v5, "setCardType:", 7);
  -[PKPaymentTransaction setAccountIdentifier:](v5, "setAccountIdentifier:", v3);

  -[PKPaymentTransaction setAccountType:](v5, "setAccountType:", 4);
  -[PKPaymentTransaction setMerchant:](v5, "setMerchant:", v4);

  return v5;
}

+ (id)appleBalanceAccountDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("accountIdentifier");
  v8[1] = CFSTR("featureIdentifier");
  v9[0] = CFSTR("apple-balance-account-001");
  v9[1] = CFSTR("asp");
  v8[2] = CFSTR("accountType");
  v8[3] = CFSTR("state");
  v9[2] = CFSTR("appleBalance");
  v9[3] = CFSTR("active");
  v9[4] = CFSTR("unknown");
  v8[4] = CFSTR("stateReason");
  v8[5] = CFSTR("accountDetails");
  objc_msgSend(a1, "_appleBalanceAccountDetailsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v3;
  v8[6] = CFSTR("supportedFeatures");
  objc_msgSend(a1, "_appleBalanceSupportedFeaturesArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v4;
  v8[7] = CFSTR("cloudStoreZoneNames");
  objc_msgSend(a1, "_appleBalanceCloudStoreZoneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[8] = CFSTR("accountBaseURL");
  v9[7] = v5;
  v9[8] = CFSTR("https://localhost:3000/appleBalance");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)appleBalanceAccountDictionary2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("accountIdentifier");
  v8[1] = CFSTR("featureIdentifier");
  v9[0] = CFSTR("apple-balance-account-002");
  v9[1] = CFSTR("asp");
  v8[2] = CFSTR("accountType");
  v8[3] = CFSTR("state");
  v9[2] = CFSTR("appleBalance");
  v9[3] = CFSTR("restricted");
  v9[4] = CFSTR("fraudSuspected");
  v8[4] = CFSTR("stateReason");
  v8[5] = CFSTR("accountDetails");
  objc_msgSend(a1, "_appleBalanceAccountDetailsDictionary2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v3;
  v8[6] = CFSTR("supportedFeatures");
  objc_msgSend(a1, "_appleBalanceSupportedFeaturesArray2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v4;
  v8[7] = CFSTR("cloudStoreZoneNames");
  objc_msgSend(a1, "_appleBalanceCloudStoreZoneNames2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_appleBalanceAccountDetailsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("createdDate");
  objc_msgSend(a1, "_date1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("lastUpdatedDate");
  objc_msgSend(a1, "_date2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v12[2] = CFSTR("US");
  v11[2] = CFSTR("countryCode");
  v11[3] = CFSTR("currencyCode");
  v12[3] = CFSTR("USD");
  v12[4] = CFSTR("paymentpass.com.apple.wallet.dev");
  v11[4] = CFSTR("associatedPassTypeIdentifier");
  v11[5] = CFSTR("associatedPassSerialNumber");
  v12[5] = CFSTR("wallettest.lynx.serialnumber");
  v12[6] = CFSTR("FAPLLY3814311690852077410603");
  v11[6] = CFSTR("fpanId");
  v11[7] = CFSTR("cardType");
  v12[7] = CFSTR("AppleBalance");
  v11[8] = CFSTR("accountSummary");
  v10[0] = CFSTR("100.00");
  v9[0] = CFSTR("currentBalance");
  v9[1] = CFSTR("dtuConfiguration");
  objc_msgSend(a1, "_appleBalanceDTUConfigurationDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_appleBalanceAccountDetailsDictionary2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("createdDate");
  objc_msgSend(a1, "_date3");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("lastUpdatedDate");
  objc_msgSend(a1, "_date4");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v12[2] = CFSTR("FR");
  v11[2] = CFSTR("countryCode");
  v11[3] = CFSTR("currencyCode");
  v12[3] = CFSTR("EUR");
  v12[4] = CFSTR("paymentpass.com.apple.wallet.dev");
  v11[4] = CFSTR("associatedPassTypeIdentifier");
  v11[5] = CFSTR("associatedPassSerialNumber");
  v12[5] = CFSTR("wallettest.lynx.serialnumber");
  v12[6] = CFSTR("FAPLLY3814311690852077410604");
  v11[6] = CFSTR("fpanId");
  v11[7] = CFSTR("cardType");
  v12[7] = CFSTR("AppleBalance");
  v11[8] = CFSTR("accountSummary");
  v10[0] = CFSTR("250.00");
  v9[0] = CFSTR("currentBalance");
  v9[1] = CFSTR("dtuConfiguration");
  objc_msgSend(a1, "_appleBalanceDTUConfigurationDictionary2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)appleBalanceAccountNoBalanceDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[8];
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("accountIdentifier");
  v8[1] = CFSTR("featureIdentifier");
  v9[0] = CFSTR("apple-balance-account-001");
  v9[1] = CFSTR("asp");
  v8[2] = CFSTR("accountType");
  v8[3] = CFSTR("state");
  v9[2] = CFSTR("appleBalance");
  v9[3] = CFSTR("active");
  v9[4] = CFSTR("unknown");
  v8[4] = CFSTR("stateReason");
  v8[5] = CFSTR("accountDetails");
  objc_msgSend(a1, "_appleBalanceAccountNoBalanceDetailsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v3;
  v8[6] = CFSTR("supportedFeatures");
  objc_msgSend(a1, "_appleBalanceSupportedFeaturesArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[6] = v4;
  v8[7] = CFSTR("cloudStoreZoneNames");
  objc_msgSend(a1, "_appleBalanceCloudStoreZoneNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_appleBalanceAccountNoBalanceDetailsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[9];
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("createdDate");
  objc_msgSend(a1, "_date1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = CFSTR("lastUpdatedDate");
  objc_msgSend(a1, "_date2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  v8[2] = CFSTR("US");
  v7[2] = CFSTR("countryCode");
  v7[3] = CFSTR("currencyCode");
  v8[3] = CFSTR("USD");
  v8[4] = CFSTR("paymentpass.com.apple.wallet.dev");
  v7[4] = CFSTR("associatedPassTypeIdentifier");
  v7[5] = CFSTR("associatedPassSerialNumber");
  v8[5] = CFSTR("wallettest.lynx.serialnumber");
  v8[6] = CFSTR("FAPLLY3814311690852077410603");
  v7[6] = CFSTR("fpanId");
  v7[7] = CFSTR("cardType");
  v7[8] = CFSTR("accountSummary");
  v8[7] = CFSTR("AppleBalance");
  v8[8] = &unk_1E2C3F9A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_appleBalanceSupportedFeaturesArray
{
  return &unk_1E2C3DF60;
}

+ (id)_appleBalanceSupportedFeaturesArray2
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)_appleBalanceCloudStoreZoneNames
{
  return &unk_1E2C3DF78;
}

+ (id)_appleBalanceCloudStoreZoneNames2
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)_appleBalanceDTUConfigurationDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[5];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("minAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("5.0"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v21[1] = CFSTR("maxAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("500.0"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v21[2] = CFSTR("maxBalance");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2000.0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v2;
  v21[3] = CFSTR("denominations");
  v18[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("10.0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("currencyCode");
  v19[0] = v3;
  v19[1] = CFSTR("USD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v16[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("20.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("currencyCode");
  v17[0] = v5;
  v17[1] = CFSTR("USD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v14[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("30.0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("currencyCode");
  v15[0] = v7;
  v15[1] = CFSTR("USD");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = CFSTR("termsURL");
  v22[3] = v9;
  v22[4] = CFSTR("https://www.apple.com/legal/internet-services/itunes/giftcards/us/terms.html");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_appleBalanceDTUConfigurationDictionary2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[5];
  _QWORD v22[7];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("minAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("1.0"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v21[1] = CFSTR("maxAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("1000.0"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  v21[2] = CFSTR("maxBalance");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("4000.0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v2;
  v21[3] = CFSTR("denominations");
  v18[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("15.0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("currencyCode");
  v19[0] = v3;
  v19[1] = CFSTR("EUR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v16[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("25.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("currencyCode");
  v17[0] = v5;
  v17[1] = CFSTR("EUR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  v14[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("35.0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("currencyCode");
  v15[0] = v7;
  v15[1] = CFSTR("EUR");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = CFSTR("termsURL");
  v22[3] = v9;
  v22[4] = CFSTR("https://www.apple.com/legal/internet-services/itunes/giftcards/eu/terms.html");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)lightweightAppleBalanceAccountDictionary
{
  NSDecimalNumber *v2;
  void *v3;
  void *v4;

  v2 = (NSDecimalNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", CFSTR("100.00"));
  PKCurrencyAmountCreate(v2, CFSTR("USD"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLightweightAppleBalanceAccountDict(CFSTR("apple-balance-lightweight-account-001"), v3, &unk_1E2C3DF90);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)appleBalanceAccountDictionaryUpdated
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "appleBalanceAccountDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("closed"), CFSTR("state"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("fraudSuspected"), CFSTR("stateReason"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)_date1
{
  return CFSTR("2018-07-01T00:00:00+00:00");
}

+ (id)_date2
{
  return CFSTR("2018-08-01T00:00:00+00:00");
}

+ (id)_date3
{
  return CFSTR("2018-09-01T00:00:00+00:00");
}

+ (id)_date4
{
  return CFSTR("2018-10-01T00:00:00+00:00");
}

+ (id)_inStoreTokenForType:(int64_t)a3 debugType:(int64_t)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3)
  {
    v4 = &stru_1E2ADF4C0;
  }
  else
  {
    v5 = CFSTR("12345678912345678912345678912345");
    if (a4 == 3)
      v5 = CFSTR("🥹");
    v4 = v5;
  }
  return v4;
}

+ (id)appleBalanceInStoreTopUpTokenForType:(int64_t)a3 state:(int64_t)a4 debugType:(int64_t)a5
{
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PKAppleBalanceInStoreTopUpToken *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v11 = v10;
  switch(a5)
  {
    case 0:
    case 3:
      v12 = 1;
      goto LABEL_4;
    case 1:
      v12 = -1;
LABEL_4:
      objc_msgSend(v10, "setDay:", v12);
      break;
    case 2:
      objc_msgSend(v10, "setSecond:", 10);
      break;
    default:
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingComponents:toDate:options:", v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(PKAppleBalanceInStoreTopUpToken);
  objc_msgSend(a1, "_inStoreTokenForType:debugType:", a3, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceInStoreTopUpToken setToken:](v15, "setToken:", v16);

  -[PKAppleBalanceInStoreTopUpToken setTokenIdentifier:](v15, "setTokenIdentifier:", CFSTR("123456789"));
  -[PKAppleBalanceInStoreTopUpToken setTokenType:](v15, "setTokenType:", a3);
  -[PKAppleBalanceInStoreTopUpToken setExpirationDate:](v15, "setExpirationDate:", v14);
  -[PKAppleBalanceInStoreTopUpToken setState:](v15, "setState:", a4);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppleBalanceInStoreTopUpToken setTermsURL:](v15, "setTermsURL:", v17);

  return v15;
}

+ (id)appleBalanceAddMoneyConfigurationWithCurrencyCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKAppleBalanceDirectTopUpConfiguration *v13;
  PKAppleBalanceDirectTopUpConfiguration *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[5];
  _QWORD v27[7];

  v27[5] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("minAmount");
  v3 = (void *)MEMORY[0x1E0CB3598];
  v4 = a3;
  objc_msgSend(v3, "decimalNumberWithString:", CFSTR("5.0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  v26[1] = CFSTR("maxAmount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("500.0"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  v26[2] = CFSTR("maxBalance");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("2000.0"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v16;
  v26[3] = CFSTR("denominations");
  v23[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("10.0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("currencyCode");
  v24[0] = v5;
  v24[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v21[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("20.0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = CFSTR("currencyCode");
  v22[0] = v7;
  v22[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v8;
  v19[0] = CFSTR("amount");
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("30.0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("currencyCode");
  v20[0] = v9;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = CFSTR("termsURL");
  v27[3] = v11;
  v27[4] = CFSTR("https://www.apple.com/legal/internet-services/itunes/giftcards/us/terms.html");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PKAppleBalanceDirectTopUpConfiguration alloc];
  v14 = -[PKAppleBalanceDirectTopUpConfiguration initWithDictionary:](v13, "initWithDictionary:", v12);

  return v14;
}

+ (BOOL)verifyAppleBalanceAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v7 = objc_msgSend(v5, "isEqual:", CFSTR("apple-balance-account-001"));

  if (v7)
  {
    if (objc_msgSend(v4, "feature") == 4
      && objc_msgSend(v4, "type") == 3
      && objc_msgSend(v4, "state") == 1
      && !objc_msgSend(v4, "stateReason"))
    {
      objc_msgSend(v4, "cloudStoreZoneNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("apple-account"));

      if (v10)
      {
        objc_msgSend(v4, "details");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appleBalanceDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(a1, "_verifyAppleBalanceAccountDetails:", v12);

        if (v13)
        {
          objc_msgSend(v4, "supportedFeatures");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(a1, "_verifyAppleBalanceSupportedFeatures:", v6);
LABEL_12:

          goto LABEL_13;
        }
      }
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

+ (BOOL)verifyAppleBalanceAccount2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v7 = objc_msgSend(v5, "isEqual:", CFSTR("apple-balance-account-002"));

  if (v7)
  {
    if (objc_msgSend(v4, "feature") == 4
      && objc_msgSend(v4, "type") == 3
      && objc_msgSend(v4, "state") == 2
      && objc_msgSend(v4, "stateReason") == 5)
    {
      objc_msgSend(v4, "cloudStoreZoneNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("transactions"));

      if (v10)
      {
        objc_msgSend(v4, "details");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "appleBalanceDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(a1, "_verifyAppleBalanceAccountDetails2:", v12);

        if (v13)
        {
          objc_msgSend(v4, "supportedFeatures");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(a1, "_verifyAppleBalanceSupportedFeatures2:", v6);
LABEL_12:

          goto LABEL_13;
        }
      }
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

+ (BOOL)_verifyAppleBalanceAccountDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date1");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && v7)
  {
    v9 = objc_msgSend(v5, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  else
  {

    if (v5 != v8)
      goto LABEL_11;
  }
  objc_msgSend(v4, "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10 && v12)
  {
    v14 = objc_msgSend(v10, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  else
  {

    if (v10 != v13)
      goto LABEL_11;
  }
  objc_msgSend(v4, "countryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    goto LABEL_28;
  v15 = objc_msgSend(v17, "isEqual:", CFSTR("US"));

  if (!v15)
    goto LABEL_12;
  objc_msgSend(v4, "currencyCode");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v19 == CFSTR("USD"))
  {
LABEL_18:
    objc_msgSend(v4, "associatedPassTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    if (v21)
    {
      v15 = objc_msgSend(v21, "isEqual:", CFSTR("paymentpass.com.apple.wallet.dev"));

      if (!v15)
        goto LABEL_12;
      objc_msgSend(v4, "associatedPassSerialNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      if (v22)
      {
        v15 = objc_msgSend(v22, "isEqual:", CFSTR("wallettest.lynx.serialnumber"));

        if (!v15)
          goto LABEL_12;
        objc_msgSend(v4, "fpanIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        if (v23)
        {
          v15 = objc_msgSend(v23, "isEqual:", CFSTR("FAPLLY3814311690852077410603"));

          if (!v15)
            goto LABEL_12;
          if (objc_msgSend(v4, "cardType") != 135)
            goto LABEL_11;
          objc_msgSend(v4, "accountSummary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currentBalance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100.00"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v24 && v25)
            LOBYTE(v15) = objc_msgSend(v24, "isEqual:", v25);
          else
            LOBYTE(v15) = v24 == (void *)v25;

LABEL_29:
          goto LABEL_12;
        }
      }
    }
LABEL_28:
    LOBYTE(v15) = 0;
    goto LABEL_29;
  }
  v20 = v19;
  if (v19)
  {
    v15 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("USD"));

    if (!v15)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_11:
  LOBYTE(v15) = 0;
LABEL_12:

  return v15;
}

+ (BOOL)_verifyAppleBalanceAccountDetails2:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "createdDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date3");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 && v7)
  {
    v9 = objc_msgSend(v5, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_11;
  }
  else
  {

    if (v5 != v8)
      goto LABEL_11;
  }
  objc_msgSend(v4, "lastUpdatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date4");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10 && v12)
  {
    v14 = objc_msgSend(v10, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_11;
  }
  else
  {

    if (v10 != v13)
      goto LABEL_11;
  }
  objc_msgSend(v4, "countryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    goto LABEL_28;
  v15 = objc_msgSend(v17, "isEqual:", CFSTR("FR"));

  if (!v15)
    goto LABEL_12;
  objc_msgSend(v4, "currencyCode");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v19 == CFSTR("EUR"))
  {
LABEL_18:
    objc_msgSend(v4, "associatedPassTypeIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    if (v21)
    {
      v15 = objc_msgSend(v21, "isEqual:", CFSTR("paymentpass.com.apple.wallet.dev"));

      if (!v15)
        goto LABEL_12;
      objc_msgSend(v4, "associatedPassSerialNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      if (v22)
      {
        v15 = objc_msgSend(v22, "isEqual:", CFSTR("wallettest.lynx.serialnumber"));

        if (!v15)
          goto LABEL_12;
        objc_msgSend(v4, "fpanIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v23;
        if (v23)
        {
          v15 = objc_msgSend(v23, "isEqual:", CFSTR("FAPLLY3814311690852077410604"));

          if (!v15)
            goto LABEL_12;
          if (objc_msgSend(v4, "cardType") != 135)
            goto LABEL_11;
          objc_msgSend(v4, "accountSummary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "currentBalance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("250.00"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v24 && v25)
            LOBYTE(v15) = objc_msgSend(v24, "isEqual:", v25);
          else
            LOBYTE(v15) = v24 == (void *)v25;

LABEL_29:
          goto LABEL_12;
        }
      }
    }
LABEL_28:
    LOBYTE(v15) = 0;
    goto LABEL_29;
  }
  v20 = v19;
  if (v19)
  {
    v15 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("EUR"));

    if (!v15)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_11:
  LOBYTE(v15) = 0;
LABEL_12:

  return v15;
}

+ (BOOL)_verifyLightweightAppleBalanceAccountDetails:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "accountSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("100.00"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
    v7 = objc_msgSend(v4, "isEqual:", v5);
  else
    v7 = v4 == (void *)v5;

  return v7;
}

+ (BOOL)_verifyAppleBalanceSupportedFeatures:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "count") == 2;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
    goto LABEL_23;
  v7 = v6;
  v8 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "identifier", (_QWORD)v18);
      v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("ampTopUpSupported");
      if (CFSTR("ampTopUpSupported") == v10)
      {
LABEL_17:

        goto LABEL_18;
      }
      if (CFSTR("ampTopUpSupported") && v10)
      {
        v13 = objc_msgSend(CFSTR("ampTopUpSupported"), "isEqualToString:", v10);

        if ((v13 & 1) != 0)
          goto LABEL_18;
      }
      else
      {

      }
      v14 = v11;
      v12 = CFSTR("ampRedemptionSupported");
      if (CFSTR("ampRedemptionSupported") == v14)
        goto LABEL_17;
      v15 = v14;
      if (!CFSTR("ampRedemptionSupported") || !v11)
      {

LABEL_22:
        v4 = 0;
        goto LABEL_23;
      }
      v16 = objc_msgSend(CFSTR("ampRedemptionSupported"), "isEqualToString:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_22;
LABEL_18:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
      continue;
    break;
  }
  v4 = 1;
LABEL_23:

  return v4;
}

+ (BOOL)_verifyAppleBalanceSupportedFeatures2:(id)a3
{
  return objc_msgSend(a3, "count") == 0;
}

+ (BOOL)verifyLightweightAppleBalanceAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "isEqual:", CFSTR("apple-balance-lightweight-account-001"));

  if (v7)
  {
    if (objc_msgSend(v4, "feature") == 4 && objc_msgSend(v4, "type") == 3)
    {
      objc_msgSend(v4, "cloudStoreZoneNames");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("apple-account"));

      if (v10)
      {
        objc_msgSend(v4, "details");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appleBalanceDetails");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(a1, "_verifyLightweightAppleBalanceAccountDetails:", v11);

LABEL_9:
        goto LABEL_10;
      }
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

+ (BOOL)verifyPromotion:(id)a3
{
  id v4;
  char v5;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;

  v4 = a3;
  if (objc_msgSend(v4, "promotionType"))
    goto LABEL_2;
  objc_msgSend(v4, "programIdentifier");
  v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v7 != CFSTR("30154"))
  {
    v8 = v7;
    if (!v7)
      goto LABEL_2;
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("30154"));

    if (!v9)
      goto LABEL_2;
  }
  objc_msgSend(v4, "versionIdentifier");
  v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v10 != CFSTR("v701909"))
  {
    v11 = v10;
    if (!v10)
      goto LABEL_2;
    v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("v701909"));

    if (!v12)
      goto LABEL_2;
  }
  if (objc_msgSend(v4, "generationIdentifier") != 371848754 || objc_msgSend(v4, "stamp") != 0x1863E34D290)
    goto LABEL_2;
  objc_msgSend(v4, "bonusMinAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50.0"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 && v14)
  {
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_2;
  }
  else
  {

    if (v13 != v15)
      goto LABEL_2;
  }
  objc_msgSend(v4, "bonusMaxAmount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("200.0"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v17 || !v18)
  {

    if (v17 == v19)
      goto LABEL_22;
LABEL_2:
    v5 = 0;
    goto LABEL_3;
  }
  v20 = objc_msgSend(v17, "isEqual:", v18);

  if ((v20 & 1) == 0)
    goto LABEL_2;
LABEL_22:
  objc_msgSend(v4, "offerText");
  v21 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v21 != CFSTR("Add $50 or more and get 1 month of Apple Music free."))
  {
    v22 = v21;
    if (!v21)
      goto LABEL_2;
    v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Add $50 or more and get 1 month of Apple Music free."));

    if (!v23)
      goto LABEL_2;
  }
  objc_msgSend(v4, "conditionText");
  v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v24 != CFSTR("1 month free, then $14.99/month. Limit 1 per Apple Account. Must claim your free content bonus immediately. Terms apply."))
  {
    v25 = v24;
    if (!v24)
      goto LABEL_2;
    v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("1 month free, then $14.99/month. Limit 1 per Apple Account. Must claim your free content bonus immediately. Terms apply."));

    if (!v26)
      goto LABEL_2;
  }
  objc_msgSend(v4, "lastUpdatedDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date1");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v28, 0, 0);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v27 && v29)
    v5 = objc_msgSend(v27, "isEqual:", v29);
  else
    v5 = v27 == (void *)v29;

LABEL_3:
  return v5;
}

+ (BOOL)verifyInStoreTopUpToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  char v11;
  void *v12;
  __CFString *v14;
  __CFString *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __CFString *v22;

  v4 = a3;
  objc_msgSend(v4, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_inStoreTokenForType:debugType:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      v11 = 0;
      v12 = v7;
LABEL_10:

      goto LABEL_11;
    }
    v10 = -[__CFString isEqualToString:](v7, "isEqualToString:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_8;
  }
  if (objc_msgSend(v4, "tokenType"))
    goto LABEL_8;
  objc_msgSend(v4, "tokenIdentifier");
  v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v14 != CFSTR("12345678912345678912345678912345"))
  {
    v15 = v14;
    if (!v14)
      goto LABEL_8;
    v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("12345678912345678912345678912345"));

    if (!v16)
      goto LABEL_8;
  }
  objc_msgSend(v4, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_date1");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17 && v19)
  {
    v21 = objc_msgSend(v17, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

    if (v17 != v20)
      goto LABEL_8;
  }
  if (!objc_msgSend(v4, "state"))
  {
    objc_msgSend(v4, "termsURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("https://www.apple.com/");
    if (v22 == CFSTR("https://www.apple.com/"))
    {
      v11 = 1;
      v7 = CFSTR("https://www.apple.com/");
    }
    else
    {
      v7 = v22;
      if (v22)
      {
        v11 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("https://www.apple.com/"));
        v9 = v7;
      }
      else
      {
        v9 = 0;
        v11 = 0;
      }
    }
    goto LABEL_10;
  }
LABEL_8:
  v11 = 0;
LABEL_11:

  return v11;
}

@end
