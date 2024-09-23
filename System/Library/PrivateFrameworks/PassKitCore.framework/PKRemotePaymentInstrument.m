@implementation PKRemotePaymentInstrument

+ (id)sortDescriptorForDefaultPaymentInstrument:(id)a3 paymentSupportedQuery:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3928];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __126__PKRemotePaymentInstrument_PKPaymentAuthorizationDataModel__sortDescriptorForDefaultPaymentInstrument_paymentSupportedQuery___block_invoke;
  v12[3] = &unk_1E2AC5FA0;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "sortDescriptorWithKey:ascending:comparator:", CFSTR("paymentApplications"), 1, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __126__PKRemotePaymentInstrument_PKPaymentAuthorizationDataModel__sortDescriptorForDefaultPaymentInstrument_paymentSupportedQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  int v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "primaryPaymentApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    LOBYTE(v12) = 0;
    v13 = *(_QWORD *)v38;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((v12 & 1) != 0)
        {
          v12 = 1;
          if ((v11 & 1) == 0)
            goto LABEL_8;
        }
        else
        {
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "canProcessPayment:", *(_QWORD *)(a1 + 40));
          if ((v11 & 1) == 0)
          {
LABEL_8:
            objc_msgSend(v15, "applicationIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v8);

            goto LABEL_11;
          }
        }
        v17 = 0;
LABEL_11:
        v11 |= v17;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (!v10)
      {
        v18 = v11 ^ 1;
        goto LABEL_15;
      }
    }
  }
  v12 = 0;
  v18 = 1;
LABEL_15:
  v30 = v18;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = v6;
  v19 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v19)
  {
    v20 = v19;
    LOBYTE(v21) = 0;
    v22 = 0;
    v23 = *(_QWORD *)v34;
    while (1)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v31);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if ((v21 & 1) != 0)
        {
          v21 = 1;
          if ((v22 & 1) == 0)
            goto LABEL_22;
        }
        else
        {
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "canProcessPayment:", *(_QWORD *)(a1 + 40));
          if ((v22 & 1) == 0)
          {
LABEL_22:
            objc_msgSend(v25, "applicationIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v8);

            goto LABEL_25;
          }
        }
        v27 = 0;
LABEL_25:
        v22 |= v27;
      }
      v20 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (!v20)
        goto LABEL_29;
    }
  }
  v21 = 0;
  v22 = 0;
LABEL_29:

  if (((v12 ^ 1) & 1) != 0 || v21)
  {
    if ((v12 | v21 ^ 1) != 1)
    {
      v28 = 1;
      goto LABEL_38;
    }
    if (((v12 ^ 1 | v21 ^ 1) & 1) != 0)
    {
      v28 = 0;
      goto LABEL_38;
    }
    if (((v30 | v22) & 1) != 0)
    {
      v28 = v30 & v22 & 1;
      goto LABEL_38;
    }
  }
  v28 = -1;
LABEL_38:

  return v28;
}

+ (PKRemotePaymentInstrument)remotePaymentInstrumentWithProtobuf:(id)a3
{
  id v3;
  PKRemotePaymentInstrument *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDecimalNumber *v17;
  NSString *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(PKRemotePaymentInstrument);
  objc_msgSend(v3, "passID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setPassIdentifier:](v4, "setPassIdentifier:", v5);

  objc_msgSend(v3, "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setOrganizationName:](v4, "setOrganizationName:", v6);

  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setDisplayName:](v4, "setDisplayName:", v7);

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "ingestedDate");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setIngestedDate:](v4, "setIngestedDate:", v9);

  objc_msgSend(v3, "primaryAccountNumberSuffix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setPrimaryAccountNumberSuffix:](v4, "setPrimaryAccountNumberSuffix:", v10);

  objc_msgSend(v3, "manifestHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setManifestHash:](v4, "setManifestHash:", v11);

  objc_msgSend(v3, "primaryAccountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setPrimaryAccountIdentifier:](v4, "setPrimaryAccountIdentifier:", v12);

  objc_msgSend(v3, "associatedWebDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setAssociatedWebDomains:](v4, "setAssociatedWebDomains:", v13);

  -[PKRemotePaymentInstrument setSupportsAutomaticSelection:](v4, "setSupportsAutomaticSelection:", objc_msgSend(v3, "supportsAutomaticSelection"));
  objc_msgSend(v3, "issuerCountryCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setIssuerCountryCode:](v4, "setIssuerCountryCode:", v14);

  -[PKRemotePaymentInstrument setHasAssociatedPeerPaymentAccount:](v4, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v3, "hasAssociatedPeerPaymentAccount"));
  -[PKRemotePaymentInstrument setPeerPaymentAccountState:](v4, "setPeerPaymentAccountState:", objc_msgSend(v3, "peerPaymentAccountState"));
  if (objc_msgSend(v3, "hasPeerPaymentAccountBalance")
    && objc_msgSend(v3, "hasPeerPaymentAccountCurrency"))
  {
    if (objc_msgSend(v3, "hasDecimalAccountBalance"))
    {
      objc_msgSend(v3, "decimalAccountBalance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKProtoSupportDecimalNumberFromProtobuf(v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v3, "hasCustomPrecisionPeerPaymentAccountBalance"))
      {
        PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v3, "peerPaymentAccountBalance"), 0);
        v17 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_msgSend(v3, "customPrecisionPeerPaymentAccountBalance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v15, "amount"), 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (NSDecimalNumber *)v16;

LABEL_9:
    objc_msgSend(v3, "peerPaymentAccountCurrency");
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemotePaymentInstrument setPeerPaymentAccountBalance:](v4, "setPeerPaymentAccountBalance:", v19);

  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "paymentApplications", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        +[PKPaymentApplication applicationWithProtobuf:](PKPaymentApplication, "applicationWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);
        if ((objc_msgSend(v26, "isAuxiliary") & 1) == 0)
          -[PKRemotePaymentInstrument setPrimaryPaymentApplication:](v4, "setPrimaryPaymentApplication:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v23);
  }

  -[PKRemotePaymentInstrument setPaymentApplications:](v4, "setPaymentApplications:", v20);
  if (objc_msgSend(v3, "hasAssociatedAccountFeatureIdentifier"))
    v27 = objc_msgSend(v3, "associatedAccountFeatureIdentifier");
  else
    v27 = 0;
  -[PKRemotePaymentInstrument setAssociatedAccountFeatureIdentifier:](v4, "setAssociatedAccountFeatureIdentifier:", v27);
  if (objc_msgSend(v3, "hasCobranded"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "cobranded"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRemotePaymentInstrument setCobranded:](v4, "setCobranded:", v28);

  }
  objc_msgSend(v3, "cobrandName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemotePaymentInstrument setCobrandName:](v4, "setCobrandName:", v29);

  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentInstrument *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKProtobufPaymentInstrument);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PKRemotePaymentInstrument paymentApplications](self, "paymentApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v8), "protobuf");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentInstrument addPaymentApplications:](v3, "addPaymentApplications:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

  -[PKRemotePaymentInstrument displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setDisplayName:](v3, "setDisplayName:", v10);

  -[PKRemotePaymentInstrument passIdentifier](self, "passIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setPassID:](v3, "setPassID:", v11);

  -[PKRemotePaymentInstrument organizationName](self, "organizationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setOrganizationName:](v3, "setOrganizationName:", v12);

  -[PKRemotePaymentInstrument ingestedDate](self, "ingestedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  -[PKProtobufPaymentInstrument setIngestedDate:](v3, "setIngestedDate:");

  -[PKRemotePaymentInstrument primaryAccountNumberSuffix](self, "primaryAccountNumberSuffix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setPrimaryAccountNumberSuffix:](v3, "setPrimaryAccountNumberSuffix:", v14);

  -[PKRemotePaymentInstrument manifestHash](self, "manifestHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setManifestHash:](v3, "setManifestHash:", v15);

  -[PKRemotePaymentInstrument primaryAccountIdentifier](self, "primaryAccountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setPrimaryAccountIdentifier:](v3, "setPrimaryAccountIdentifier:", v16);

  -[PKRemotePaymentInstrument associatedWebDomains](self, "associatedWebDomains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  -[PKProtobufPaymentInstrument setAssociatedWebDomains:](v3, "setAssociatedWebDomains:", v18);

  -[PKProtobufPaymentInstrument setSupportsAutomaticSelection:](v3, "setSupportsAutomaticSelection:", -[PKRemotePaymentInstrument supportsAutomaticSelection](self, "supportsAutomaticSelection"));
  -[PKRemotePaymentInstrument issuerCountryCode](self, "issuerCountryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setIssuerCountryCode:](v3, "setIssuerCountryCode:", v19);

  -[PKProtobufPaymentInstrument setHasAssociatedPeerPaymentAccount:](v3, "setHasAssociatedPeerPaymentAccount:", -[PKRemotePaymentInstrument hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"));
  -[PKProtobufPaymentInstrument setPeerPaymentAccountState:](v3, "setPeerPaymentAccountState:", -[PKRemotePaymentInstrument peerPaymentAccountState](self, "peerPaymentAccountState"));
  -[PKRemotePaymentInstrument peerPaymentAccountBalance](self, "peerPaymentAccountBalance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PKRemotePaymentInstrument peerPaymentAccountBalance](self, "peerPaymentAccountBalance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currency");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrument setPeerPaymentAccountCurrency:](v3, "setPeerPaymentAccountCurrency:", v22);

    -[PKRemotePaymentInstrument peerPaymentAccountBalance](self, "peerPaymentAccountBalance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "amount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKProtobufPaymentInstrument setPeerPaymentAccountBalance:](v3, "setPeerPaymentAccountBalance:", PKCurrencyDecimalToLegacyStorageInteger(v24, 0));
    DecimalToCustomPrecisionProtobuf(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrument setCustomPrecisionPeerPaymentAccountBalance:](v3, "setCustomPrecisionPeerPaymentAccountBalance:", v25);

    PKProtoSupportProtoDecimalNumberFromDecimalNumber(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrument setDecimalAccountBalance:](v3, "setDecimalAccountBalance:", v26);

  }
  -[PKProtobufPaymentInstrument setAssociatedAccountFeatureIdentifier:](v3, "setAssociatedAccountFeatureIdentifier:", -[PKRemotePaymentInstrument associatedAccountFeatureIdentifier](self, "associatedAccountFeatureIdentifier"));
  -[PKRemotePaymentInstrument isCobranded](self, "isCobranded");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PKRemotePaymentInstrument isCobranded](self, "isCobranded");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentInstrument setCobranded:](v3, "setCobranded:", objc_msgSend(v28, "BOOLValue"));

  }
  -[PKRemotePaymentInstrument cobrandName](self, "cobrandName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentInstrument setCobrandName:](v3, "setCobrandName:", v29);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemotePaymentInstrument)initWithPaymentPass:(id)a3
{
  id v4;
  PKRemotePaymentInstrument *v5;
  void *v6;
  uint64_t v7;
  NSArray *paymentApplications;
  uint64_t v9;
  PKPaymentApplication *primaryPaymentApplication;
  uint64_t v11;
  NSString *passIdentifier;
  uint64_t v13;
  NSString *organizationName;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSDate *ingestedDate;
  uint64_t v19;
  NSString *primaryAccountNumberSuffix;
  uint64_t v21;
  NSData *manifestHash;
  uint64_t v23;
  NSString *primaryAccountIdentifier;
  void *v25;
  uint64_t v26;
  NSArray *associatedWebDomains;
  uint64_t v28;
  NSString *issuerCountryCode;
  uint64_t v30;
  NSNumber *cobranded;
  uint64_t v32;
  NSString *cobrandName;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKRemotePaymentInstrument;
  v5 = -[PKRemotePaymentInstrument init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "devicePaymentApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSArray *)v7;

    objc_msgSend(v4, "devicePrimaryPaymentApplication");
    v9 = objc_claimAutoreleasedReturnValue();
    primaryPaymentApplication = v5->_primaryPaymentApplication;
    v5->_primaryPaymentApplication = (PKPaymentApplication *)v9;

    objc_msgSend(v4, "uniqueID");
    v11 = objc_claimAutoreleasedReturnValue();
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v11;

    objc_msgSend(v4, "organizationName");
    v13 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v13;

    objc_msgSend(v4, "localizedDescription");
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(v4, "ingestedDate");
    v17 = objc_claimAutoreleasedReturnValue();
    ingestedDate = v5->_ingestedDate;
    v5->_ingestedDate = (NSDate *)v17;

    objc_msgSend(v4, "primaryAccountNumberSuffix");
    v19 = objc_claimAutoreleasedReturnValue();
    primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
    v5->_primaryAccountNumberSuffix = (NSString *)v19;

    objc_msgSend(v4, "manifestHash");
    v21 = objc_claimAutoreleasedReturnValue();
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v21;

    objc_msgSend(v4, "primaryAccountIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v23;

    objc_msgSend(v4, "associatedWebDomains");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v26 = objc_claimAutoreleasedReturnValue();
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSArray *)v26;

    v5->_supportsAutomaticSelection = (objc_msgSend(v4, "settings") & 0x10) != 0;
    objc_msgSend(v4, "issuerCountryCode");
    v28 = objc_claimAutoreleasedReturnValue();
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v28;

    v5->_hasAssociatedPeerPaymentAccount = objc_msgSend(v4, "hasAssociatedPeerPaymentAccount");
    v5->_associatedAccountFeatureIdentifier = objc_msgSend(v4, "associatedAccountFeatureIdentifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isCobranded"));
    v30 = objc_claimAutoreleasedReturnValue();
    cobranded = v5->_cobranded;
    v5->_cobranded = (NSNumber *)v30;

    objc_msgSend(v4, "cobrandName");
    v32 = objc_claimAutoreleasedReturnValue();
    cobrandName = v5->_cobrandName;
    v5->_cobrandName = (NSString *)v32;

  }
  return v5;
}

- (PKRemotePaymentInstrument)initWithCoder:(id)a3
{
  id v4;
  PKRemotePaymentInstrument *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *paymentApplications;
  uint64_t v11;
  NSString *passIdentifier;
  uint64_t v13;
  NSString *organizationName;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSDate *ingestedDate;
  uint64_t v19;
  NSString *primaryAccountNumberSuffix;
  uint64_t v21;
  PKPaymentApplication *primaryPaymentApplication;
  uint64_t v23;
  NSData *manifestHash;
  uint64_t v25;
  NSString *primaryAccountIdentifier;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *associatedWebDomains;
  uint64_t v32;
  NSString *issuerCountryCode;
  uint64_t v34;
  PKCurrencyAmount *peerPaymentAccountBalance;
  uint64_t v36;
  NSNumber *cobranded;
  uint64_t v38;
  NSString *cobrandName;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKRemotePaymentInstrument;
  v5 = -[PKRemotePaymentInstrument init](&v41, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("paymentApplications"));
    v9 = objc_claimAutoreleasedReturnValue();
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passID"));
    v11 = objc_claimAutoreleasedReturnValue();
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v13 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ingestedDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    ingestedDate = v5->_ingestedDate;
    v5->_ingestedDate = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountNumberSuffix"));
    v19 = objc_claimAutoreleasedReturnValue();
    primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
    v5->_primaryAccountNumberSuffix = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryPaymentApplication"));
    v21 = objc_claimAutoreleasedReturnValue();
    primaryPaymentApplication = v5->_primaryPaymentApplication;
    v5->_primaryPaymentApplication = (PKPaymentApplication *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v23 = objc_claimAutoreleasedReturnValue();
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("associatedWebDomains"));
    v30 = objc_claimAutoreleasedReturnValue();
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSArray *)v30;

    v5->_supportsAutomaticSelection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAutomaticSelection"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerCountryCode"));
    v32 = objc_claimAutoreleasedReturnValue();
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v32;

    v5->_hasAssociatedPeerPaymentAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAssociatedPeerPaymentAccount"));
    v5->_peerPaymentAccountState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("peerPaymentAccountState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentAccountBalance"));
    v34 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccountBalance = v5->_peerPaymentAccountBalance;
    v5->_peerPaymentAccountBalance = (PKCurrencyAmount *)v34;

    v5->_associatedAccountFeatureIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedAccountFeatureIdentifier"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobranded"));
    v36 = objc_claimAutoreleasedReturnValue();
    cobranded = v5->_cobranded;
    v5->_cobranded = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobrandName"));
    v38 = objc_claimAutoreleasedReturnValue();
    cobrandName = v5->_cobrandName;
    v5->_cobrandName = (NSString *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *paymentApplications;
  id v5;

  paymentApplications = self->_paymentApplications;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentApplications, CFSTR("paymentApplications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passIdentifier, CFSTR("passID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ingestedDate, CFSTR("ingestedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryAccountNumberSuffix, CFSTR("primaryAccountNumberSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryPaymentApplication, CFSTR("primaryPaymentApplication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifestHash, CFSTR("manifestHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedWebDomains, CFSTR("associatedWebDomains"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsAutomaticSelection, CFSTR("supportsAutomaticSelection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuerCountryCode, CFSTR("issuerCountryCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAssociatedPeerPaymentAccount, CFSTR("hasAssociatedPeerPaymentAccount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_peerPaymentAccountState, CFSTR("peerPaymentAccountState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerPaymentAccountBalance, CFSTR("peerPaymentAccountBalance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_associatedAccountFeatureIdentifier, CFSTR("associatedAccountFeatureIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cobranded, CFSTR("cobranded"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cobrandName, CFSTR("cobrandName"));

}

- (id)description
{
  id v3;
  NSString *passIdentifier;
  NSString *organizationName;
  NSDate *ingestedDate;
  NSString *displayName;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  passIdentifier = self->_passIdentifier;
  organizationName = self->_organizationName;
  ingestedDate = self->_ingestedDate;
  displayName = self->_displayName;
  -[NSData hexEncoding](self->_manifestHash, "hexEncoding");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Display Name: %@\nPass ID: %@\nPass organizationName: %@\nIngested: %@\nManifest: %@\n"), displayName, passIdentifier, organizationName, ingestedDate, v8);

  objc_msgSend(v3, "appendString:", CFSTR("Applications: \n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_paymentApplications;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "applicationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
  return v3;
}

- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4
{
  return PKSortedPaymentApplicationsByAID(a3, self->_primaryPaymentApplication, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKRemotePaymentInstrument *v5;
  uint64_t v6;
  NSString *passIdentifier;
  uint64_t v8;
  NSString *organizationName;
  uint64_t v10;
  NSData *manifestHash;
  uint64_t v12;
  NSString *displayName;
  uint64_t v14;
  NSString *primaryAccountNumberSuffix;
  uint64_t v16;
  NSString *primaryAccountIdentifier;
  uint64_t v18;
  NSArray *paymentApplications;
  PKPaymentApplication *v20;
  PKPaymentApplication *primaryPaymentApplication;
  uint64_t v22;
  NSDate *ingestedDate;
  uint64_t v24;
  NSArray *associatedWebDomains;
  uint64_t v26;
  NSString *issuerCountryCode;
  PKCurrencyAmount *v28;
  PKCurrencyAmount *peerPaymentAccountBalance;
  uint64_t v30;
  NSNumber *cobranded;
  uint64_t v32;
  NSString *cobrandName;

  v5 = -[PKRemotePaymentInstrument init](+[PKRemotePaymentInstrument allocWithZone:](PKRemotePaymentInstrument, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_passIdentifier, "copyWithZone:", a3);
  passIdentifier = v5->_passIdentifier;
  v5->_passIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_organizationName, "copyWithZone:", a3);
  organizationName = v5->_organizationName;
  v5->_organizationName = (NSString *)v8;

  v10 = -[NSData copyWithZone:](self->_manifestHash, "copyWithZone:", a3);
  manifestHash = v5->_manifestHash;
  v5->_manifestHash = (NSData *)v10;

  v12 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_primaryAccountNumberSuffix, "copyWithZone:", a3);
  primaryAccountNumberSuffix = v5->_primaryAccountNumberSuffix;
  v5->_primaryAccountNumberSuffix = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_primaryAccountIdentifier, "copyWithZone:", a3);
  primaryAccountIdentifier = v5->_primaryAccountIdentifier;
  v5->_primaryAccountIdentifier = (NSString *)v16;

  v18 = -[NSArray copyWithZone:](self->_paymentApplications, "copyWithZone:", a3);
  paymentApplications = v5->_paymentApplications;
  v5->_paymentApplications = (NSArray *)v18;

  v20 = -[PKPaymentApplication copyWithZone:](self->_primaryPaymentApplication, "copyWithZone:", a3);
  primaryPaymentApplication = v5->_primaryPaymentApplication;
  v5->_primaryPaymentApplication = v20;

  v22 = -[NSDate copyWithZone:](self->_ingestedDate, "copyWithZone:", a3);
  ingestedDate = v5->_ingestedDate;
  v5->_ingestedDate = (NSDate *)v22;

  v24 = -[NSArray copyWithZone:](self->_associatedWebDomains, "copyWithZone:", a3);
  associatedWebDomains = v5->_associatedWebDomains;
  v5->_associatedWebDomains = (NSArray *)v24;

  v5->_supportsAutomaticSelection = self->_supportsAutomaticSelection;
  v26 = -[NSString copyWithZone:](self->_issuerCountryCode, "copyWithZone:", a3);
  issuerCountryCode = v5->_issuerCountryCode;
  v5->_issuerCountryCode = (NSString *)v26;

  v5->_hasAssociatedPeerPaymentAccount = self->_hasAssociatedPeerPaymentAccount;
  v5->_peerPaymentAccountState = self->_peerPaymentAccountState;
  v28 = -[PKCurrencyAmount copyWithZone:](self->_peerPaymentAccountBalance, "copyWithZone:", a3);
  peerPaymentAccountBalance = v5->_peerPaymentAccountBalance;
  v5->_peerPaymentAccountBalance = v28;

  v5->_associatedAccountFeatureIdentifier = self->_associatedAccountFeatureIdentifier;
  v30 = -[NSNumber copyWithZone:](self->_cobranded, "copyWithZone:", a3);
  cobranded = v5->_cobranded;
  v5->_cobranded = (NSNumber *)v30;

  v32 = -[NSString copyWithZone:](self->_cobrandName, "copyWithZone:", a3);
  cobrandName = v5->_cobrandName;
  v5->_cobrandName = (NSString *)v32;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_passIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_organizationName);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_ingestedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAccountNumberSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryPaymentApplication);
  objc_msgSend(v3, "safelyAddObject:", self->_manifestHash);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAccountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedWebDomains);
  objc_msgSend(v3, "safelyAddObject:", self->_issuerCountryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_cobranded);
  objc_msgSend(v3, "safelyAddObject:", self->_cobrandName);
  v4 = PKCombinedHash(17, self->_paymentApplications);
  v5 = PKCombinedHash(v4, v3);
  v6 = self->_associatedAccountFeatureIdentifier - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKRemotePaymentInstrument *v4;
  PKRemotePaymentInstrument *v5;
  BOOL v6;

  v4 = (PKRemotePaymentInstrument *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemotePaymentInstrument isEqualToRemotePaymentInstrument:](self, "isEqualToRemotePaymentInstrument:", v5);

  return v6;
}

- (BOOL)isEqualToRemotePaymentInstrument:(id)a3
{
  _QWORD *v4;
  NSArray *paymentApplications;
  NSArray *v6;
  BOOL v7;
  char v8;
  PKPaymentApplication *primaryPaymentApplication;
  PKPaymentApplication *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  void *v16;
  NSString *v17;
  _BOOL4 v18;
  void *v19;
  NSString *v20;
  _BOOL4 v21;
  NSDate *ingestedDate;
  NSDate *v23;
  NSData *manifestHash;
  NSData *v25;
  void *v26;
  NSString *v27;
  _BOOL4 v28;
  void *v29;
  NSString *v30;
  _BOOL4 v31;
  char v32;
  NSArray *associatedWebDomains;
  NSArray *v35;
  NSString *issuerCountryCode;
  NSString *v37;
  PKCurrencyAmount *peerPaymentAccountBalance;
  PKCurrencyAmount *v39;
  NSNumber *cobranded;
  NSNumber *v41;
  NSString *cobrandName;
  NSString *v43;

  v4 = a3;
  paymentApplications = self->_paymentApplications;
  v6 = (NSArray *)v4[12];
  if (paymentApplications)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (paymentApplications != v6)
      goto LABEL_54;
  }
  else
  {
    v8 = -[NSArray isEqual:](paymentApplications, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_54;
  }
  primaryPaymentApplication = self->_primaryPaymentApplication;
  v10 = (PKPaymentApplication *)v4[13];
  if (primaryPaymentApplication && v10)
  {
    if (!-[PKPaymentApplication isEqual:](primaryPaymentApplication, "isEqual:"))
      goto LABEL_54;
  }
  else if (primaryPaymentApplication != v10)
  {
    goto LABEL_54;
  }
  v11 = (void *)v4[2];
  v12 = self->_passIdentifier;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
      goto LABEL_53;
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_54;
  }
  v16 = (void *)v4[3];
  v12 = self->_organizationName;
  v17 = v16;
  if (v12 == v17)
  {

  }
  else
  {
    v14 = v17;
    if (!v12 || !v17)
      goto LABEL_53;
    v18 = -[NSString isEqualToString:](v12, "isEqualToString:", v17);

    if (!v18)
      goto LABEL_54;
  }
  v19 = (void *)v4[5];
  v12 = self->_displayName;
  v20 = v19;
  if (v12 == v20)
  {

  }
  else
  {
    v14 = v20;
    if (!v12 || !v20)
      goto LABEL_53;
    v21 = -[NSString isEqualToString:](v12, "isEqualToString:", v20);

    if (!v21)
      goto LABEL_54;
  }
  ingestedDate = self->_ingestedDate;
  v23 = (NSDate *)v4[14];
  if (ingestedDate && v23)
  {
    if ((-[NSDate isEqual:](ingestedDate, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (ingestedDate != v23)
  {
    goto LABEL_54;
  }
  manifestHash = self->_manifestHash;
  v25 = (NSData *)v4[4];
  if (manifestHash && v25)
  {
    if ((-[NSData isEqual:](manifestHash, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (manifestHash != v25)
  {
    goto LABEL_54;
  }
  v26 = (void *)v4[6];
  v12 = self->_primaryAccountNumberSuffix;
  v27 = v26;
  if (v12 == v27)
  {

  }
  else
  {
    v14 = v27;
    if (!v12 || !v27)
      goto LABEL_53;
    v28 = -[NSString isEqualToString:](v12, "isEqualToString:", v27);

    if (!v28)
      goto LABEL_54;
  }
  v29 = (void *)v4[7];
  v12 = self->_primaryAccountIdentifier;
  v30 = v29;
  if (v12 == v30)
  {

    goto LABEL_57;
  }
  v14 = v30;
  if (!v12 || !v30)
  {
LABEL_53:

    goto LABEL_54;
  }
  v31 = -[NSString isEqualToString:](v12, "isEqualToString:", v30);

  if (!v31)
    goto LABEL_54;
LABEL_57:
  associatedWebDomains = self->_associatedWebDomains;
  v35 = (NSArray *)v4[17];
  if (associatedWebDomains && v35)
  {
    if ((-[NSArray isEqual:](associatedWebDomains, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (associatedWebDomains != v35)
  {
    goto LABEL_54;
  }
  issuerCountryCode = self->_issuerCountryCode;
  v37 = (NSString *)v4[8];
  if (issuerCountryCode && v37)
  {
    if ((-[NSString isEqual:](issuerCountryCode, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (issuerCountryCode != v37)
  {
    goto LABEL_54;
  }
  if (self->_peerPaymentAccountState != v4[16]
    || self->_hasAssociatedPeerPaymentAccount != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_54;
  }
  peerPaymentAccountBalance = self->_peerPaymentAccountBalance;
  v39 = (PKCurrencyAmount *)v4[15];
  if (peerPaymentAccountBalance && v39)
  {
    if (!-[PKCurrencyAmount isEqual:](peerPaymentAccountBalance, "isEqual:"))
      goto LABEL_54;
  }
  else if (peerPaymentAccountBalance != v39)
  {
    goto LABEL_54;
  }
  if (self->_associatedAccountFeatureIdentifier != v4[9])
    goto LABEL_54;
  cobranded = self->_cobranded;
  v41 = (NSNumber *)v4[10];
  if (cobranded && v41)
  {
    if ((-[NSNumber isEqual:](cobranded, "isEqual:") & 1) != 0)
      goto LABEL_80;
LABEL_54:
    v32 = 0;
    goto LABEL_55;
  }
  if (cobranded != v41)
    goto LABEL_54;
LABEL_80:
  cobrandName = self->_cobrandName;
  v43 = (NSString *)v4[11];
  if (cobrandName && v43)
    v32 = -[NSString isEqual:](cobrandName, "isEqual:");
  else
    v32 = cobrandName == v43;
LABEL_55:

  return v32;
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (void)setPassIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3
{
  self->_associatedAccountFeatureIdentifier = a3;
}

- (NSNumber)isCobranded
{
  return self->_cobranded;
}

- (void)setCobranded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)cobrandName
{
  return self->_cobrandName;
}

- (void)setCobrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplications, a3);
}

- (PKPaymentApplication)primaryPaymentApplication
{
  return self->_primaryPaymentApplication;
}

- (void)setPrimaryPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPaymentApplication, a3);
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
  objc_storeStrong((id *)&self->_ingestedDate, a3);
}

- (BOOL)supportsAutomaticSelection
{
  return self->_supportsAutomaticSelection;
}

- (void)setSupportsAutomaticSelection:(BOOL)a3
{
  self->_supportsAutomaticSelection = a3;
}

- (PKCurrencyAmount)peerPaymentAccountBalance
{
  return self->_peerPaymentAccountBalance;
}

- (void)setPeerPaymentAccountBalance:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccountBalance, a3);
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (unint64_t)peerPaymentAccountState
{
  return self->_peerPaymentAccountState;
}

- (void)setPeerPaymentAccountState:(unint64_t)a3
{
  self->_peerPaymentAccountState = a3;
}

- (NSArray)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
  objc_storeStrong((id *)&self->_associatedWebDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountBalance, 0);
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_cobranded, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
}

+ (id)thumbnailCachePathForManifestHash:(id)a3 size:(CGSize)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@#%ld-%ld"), a3, llround(a4.width), llround(a4.height));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKRemoteInstrumentThumbnailsCachePath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
