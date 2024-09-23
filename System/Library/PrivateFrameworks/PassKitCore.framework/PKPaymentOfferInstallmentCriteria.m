@implementation PKPaymentOfferInstallmentCriteria

- (PKPaymentOfferInstallmentCriteria)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentCriteria *v5;
  uint64_t v6;
  NSSet *supportedCurrencyCodes;
  uint64_t v8;
  NSSet *supportedMerchantCountryCodes;
  uint64_t v10;
  NSSet *supportedDeviceRegionCountryCodes;
  uint64_t v12;
  NSArray *supportedLanguages;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *programName;
  void *v18;
  void *v19;
  PKPaymentOfferDynamicContentIcon *v20;
  void *v21;
  uint64_t v22;
  PKPaymentOfferDynamicContentIcon *icon;
  void *v24;
  uint64_t v25;
  NSArray *minimumAmounts;
  void *v27;
  uint64_t v28;
  NSArray *maximumAmounts;
  uint64_t v30;
  NSSet *associatedStoreIdentifiers;
  uint64_t v32;
  NSSet *associatedApplicationIdentifiers;
  void *v34;
  uint64_t v35;
  NSSet *associatedWebDomains;
  uint64_t v37;
  NSURL *appLaunchURL;
  uint64_t v39;
  NSString *localizedPayInFullTitleOverride;
  uint64_t v41;
  NSString *localizedTitleOverride;
  uint64_t v43;
  NSString *localizedSubtitleOverride;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v5 = -[PKPaymentOfferCriteria initWithDictionary:](&v46, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedCurrencyCodes"));
    v6 = objc_claimAutoreleasedReturnValue();
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v6;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedMerchantCountryCodes"));
    v8 = objc_claimAutoreleasedReturnValue();
    supportedMerchantCountryCodes = v5->_supportedMerchantCountryCodes;
    v5->_supportedMerchantCountryCodes = (NSSet *)v8;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedDeviceRegionCountryCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    supportedDeviceRegionCountryCodes = v5->_supportedDeviceRegionCountryCodes;
    v5->_supportedDeviceRegionCountryCodes = (NSSet *)v10;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedLanguages"));
    v12 = objc_claimAutoreleasedReturnValue();
    supportedLanguages = v5->_supportedLanguages;
    v5->_supportedLanguages = (NSArray *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentNetworkIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentNetworkIdentifier = PKPaymentCredentialTypeForPaymentNetworkName(v14);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentMethodType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_paymentMethodType = PKPaymentMethodTypeForString(v15);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("programName"));
    v16 = objc_claimAutoreleasedReturnValue();
    programName = v5->_programName;
    v5->_programName = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("issuerName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("productName"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_issuerName, v19);
    if (!v18)

    v20 = [PKPaymentOfferDynamicContentIcon alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("iconURL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PKPaymentOfferDynamicContentIcon initWithDictionary:](v20, "initWithDictionary:", v21);
    icon = v5->_icon;
    v5->_icon = (PKPaymentOfferDynamicContentIcon *)v22;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("minimumAmounts"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_132);
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v25;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("maximumAmounts"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_53_0);
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v28;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("associatedStoreIdentifiers"));
    v30 = objc_claimAutoreleasedReturnValue();
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSSet *)v30;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("associatedApplicationIdentifiers"));
    v32 = objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v32;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("associatedWebDomains"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "pk_setBySafelyApplyingBlock:", &__block_literal_global_56_0);
    v35 = objc_claimAutoreleasedReturnValue();
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSSet *)v35;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("appLaunchURL"));
    v37 = objc_claimAutoreleasedReturnValue();
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v37;

    v5->_requiresChallenge = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresChallenge"));
    v5->_suppressPayInFull = objc_msgSend(v4, "PKBoolForKey:", CFSTR("suppressPayInFull"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedPayInFullTitleOverride"));
    v39 = objc_claimAutoreleasedReturnValue();
    localizedPayInFullTitleOverride = v5->_localizedPayInFullTitleOverride;
    v5->_localizedPayInFullTitleOverride = (NSString *)v39;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitleOverride"));
    v41 = objc_claimAutoreleasedReturnValue();
    localizedTitleOverride = v5->_localizedTitleOverride;
    v5->_localizedTitleOverride = (NSString *)v41;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedSubtitleOverride"));
    v43 = objc_claimAutoreleasedReturnValue();
    localizedSubtitleOverride = v5->_localizedSubtitleOverride;
    v5->_localizedSubtitleOverride = (NSString *)v43;

  }
  return v5;
}

PKCurrencyAmount *__56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCurrencyAmount *v3;

  v2 = a2;
  v3 = -[PKCurrencyAmount initWithDictionary:]([PKCurrencyAmount alloc], "initWithDictionary:", v2);

  return v3;
}

PKCurrencyAmount *__56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKCurrencyAmount *v3;

  v2 = a2;
  v3 = -[PKCurrencyAmount initWithDictionary:]([PKCurrencyAmount alloc], "initWithDictionary:", v2);

  return v3;
}

id __56__PKPaymentOfferInstallmentCriteria_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C99E98];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithString:", v3);

  return v4;
}

- (BOOL)suppressPayInFull
{
  return (PKPaymentOffersForceSuppressPayInFull() & 1) != 0 || self->_suppressPayInFull;
}

- (BOOL)eligibleWithConfiguration:(id)a3 ineligibleReason:(unint64_t *)a4
{
  id v6;
  id v7;
  NSDecimalNumber *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  unint64_t v16;
  NSArray *maximumAmounts;
  NSString *v18;
  void *v19;
  NSArray *minimumAmounts;
  void *v21;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  NSString *v29;
  _QWORD v30[4];
  NSString *v31;
  objc_super v32;

  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  if (-[PKPaymentOfferCriteria eligibleWithConfiguration:ineligibleReason:](&v32, sel_eligibleWithConfiguration_ineligibleReason_, v6, a4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      v15 = 1;
      if (!a4)
        goto LABEL_38;
      goto LABEL_37;
    }
    v7 = v6;
    objc_msgSend(v7, "amount");
    v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currencyCode");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "merchantCountryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceRegion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "supportedNetworks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "merchantCapabilities");
    PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "payLaterSuppressionMode");
    v13 = objc_msgSend(v7, "options");
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          if (v27)
          {
            v14 = v13;
            if (-[NSSet count](self->_supportedCurrencyCodes, "count")
              && !-[NSSet containsObject:](self->_supportedCurrencyCodes, "containsObject:", v9))
            {
              v15 = 0;
              v16 = 7;
            }
            else if (-[NSSet count](self->_supportedMerchantCountryCodes, "count")
                   && !-[NSSet containsObject:](self->_supportedMerchantCountryCodes, "containsObject:", v10))
            {
              v15 = 0;
              v16 = 8;
            }
            else if (-[NSSet count](self->_supportedDeviceRegionCountryCodes, "count")
                   && !-[NSSet containsObject:](self->_supportedDeviceRegionCountryCodes, "containsObject:", v27))
            {
              v15 = 0;
              v16 = 9;
            }
            else if (v26 && v25 && !objc_msgSend(v26, "containsObject:", v25))
            {
              v15 = 0;
              v16 = 10;
            }
            else if (v12)
            {
              v15 = 0;
              v16 = 11;
            }
            else if (+[PKPaymentApplication paymentApplicationSupportsMerchantCapabilties:paymentType:](PKPaymentApplication, "paymentApplicationSupportsMerchantCapabilties:paymentType:", v11, self->_paymentMethodType))
            {
              if ((v14 & 1) != 0)
              {
                v15 = 0;
                v16 = 15;
              }
              else if ((v14 & 2) != 0)
              {
                v15 = 0;
                v16 = 16;
              }
              else if ((v14 & 4) != 0)
              {
                v15 = 0;
                v16 = 17;
              }
              else
              {
                PKCurrencyAmountCreate(v8, v9, 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                maximumAmounts = self->_maximumAmounts;
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke;
                v30[3] = &unk_1E2AD1F60;
                v18 = v9;
                v31 = v18;
                -[NSArray pk_firstObjectPassingTest:](maximumAmounts, "pk_firstObjectPassingTest:", v30);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                minimumAmounts = self->_minimumAmounts;
                v28[0] = MEMORY[0x1E0C809B0];
                v28[1] = 3221225472;
                v28[2] = __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2;
                v28[3] = &unk_1E2AD1F60;
                v29 = v18;
                -[NSArray pk_firstObjectPassingTest:](minimumAmounts, "pk_firstObjectPassingTest:", v28);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21 && (objc_msgSend(v24, "currencyAmountLessThanCurrencyAmount:", v21) & 1) != 0)
                {
                  v15 = 0;
                  v16 = 13;
                }
                else if (v19)
                {
                  v23 = objc_msgSend(v24, "currencyAmountGreaterThanCurrencyAmount:", v19);
                  if (v23)
                    v16 = 14;
                  else
                    v16 = 0;
                  v15 = v23 ^ 1;
                }
                else
                {
                  v16 = 0;
                  v15 = 1;
                }

              }
            }
            else
            {
              v15 = 0;
              v16 = 12;
            }
          }
          else
          {
            v15 = 0;
            v16 = 6;
          }
        }
        else
        {
          v15 = 0;
          v16 = 5;
        }
      }
      else
      {
        v15 = 0;
        v16 = 4;
      }
    }
    else
    {
      v15 = 0;
      v16 = 3;
    }

    if (a4)
LABEL_37:
      *a4 = v16;
  }
  else
  {
    v15 = 0;
  }
LABEL_38:

  return v15;
}

uint64_t __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5)
    v6 = objc_msgSend(v3, "isEqual:");
  else
    v6 = v3 == v5;

  return v6;
}

uint64_t __80__PKPaymentOfferInstallmentCriteria_eligibleWithConfiguration_ineligibleReason___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "currency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3 && v5)
    v6 = objc_msgSend(v3, "isEqual:");
  else
    v6 = v3 == v5;

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  -[PKPaymentOfferCriteria dictionaryRepresentation](&v22, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSSet allObjects](self->_supportedCurrencyCodes, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("supportedCurrencyCodes"));

  -[NSSet allObjects](self->_supportedMerchantCountryCodes, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("supportedMerchantCountryCodes"));

  -[NSSet allObjects](self->_supportedDeviceRegionCountryCodes, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("supportedDeviceRegionCountryCodes"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_supportedLanguages, CFSTR("supportedLanguages"));
  PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("paymentNetworkIdentifier"));

  PKPaymentMethodTypeToString(self->_paymentMethodType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("paymentMethodType"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_programName, CFSTR("programName"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_issuerName, CFSTR("issuerName"));
  -[PKPaymentOfferDynamicContentIcon dictionaryRepresentation](self->_icon, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("iconURL"));

  v11 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_minimumAmounts, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_66);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("minimumAmounts"));

  v12 = -[NSArray pk_createArrayBySafelyApplyingBlock:](self->_maximumAmounts, "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_67);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("maximumAmounts"));

  -[NSSet allObjects](self->_associatedStoreIdentifiers, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("associatedStoreIdentifiers"));

  -[NSURL absoluteString](self->_appLaunchURL, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("appLaunchURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresChallenge);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("requiresChallenge"));

  -[NSSet pk_setByApplyingBlock:](self->_associatedWebDomains, "pk_setByApplyingBlock:", &__block_literal_global_69);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("associatedWebDomains"));

  -[NSSet allObjects](self->_associatedApplicationIdentifiers, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("associatedApplicationIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suppressPayInFull);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("suppressPayInFull"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_localizedPayInFullTitleOverride, CFSTR("localizedPayInFullTitleOverride"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_localizedTitleOverride, CFSTR("localizedTitleOverride"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_localizedSubtitleOverride, CFSTR("localizedSubtitleOverride"));
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __61__PKPaymentOfferInstallmentCriteria_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "absoluteString");
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentCriteria *v4;
  PKPaymentOfferInstallmentCriteria *v5;
  PKPaymentOfferInstallmentCriteria *v6;
  NSSet *supportedCurrencyCodes;
  NSSet *v8;
  BOOL v9;
  BOOL v10;
  char v11;
  NSSet *supportedMerchantCountryCodes;
  NSSet *v13;
  NSSet *supportedDeviceRegionCountryCodes;
  NSSet *v15;
  NSArray *supportedLanguages;
  NSArray *v17;
  NSString *programName;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  _BOOL4 v23;
  NSString *issuerName;
  NSString *v25;
  NSString *v26;
  _BOOL4 v27;
  PKPaymentOfferDynamicContentIcon *icon;
  PKPaymentOfferDynamicContentIcon *v29;
  NSArray *minimumAmounts;
  NSArray *v31;
  NSArray *maximumAmounts;
  NSArray *v33;
  NSSet *associatedStoreIdentifiers;
  NSSet *v35;
  NSURL *appLaunchURL;
  NSURL *v37;
  NSSet *associatedWebDomains;
  NSSet *v39;
  NSSet *associatedApplicationIdentifiers;
  NSSet *v41;
  NSString *localizedPayInFullTitleOverride;
  NSString *v43;
  NSString *v44;
  _BOOL4 v45;
  NSString *localizedTitleOverride;
  NSString *v47;
  NSString *v48;
  _BOOL4 v49;
  NSString *localizedSubtitleOverride;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  BOOL v55;
  objc_super v56;

  v4 = (PKPaymentOfferInstallmentCriteria *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v56.receiver = self;
        v56.super_class = (Class)PKPaymentOfferInstallmentCriteria;
        if (-[PKPaymentOfferCriteria isEqual:](&v56, sel_isEqual_, v6))
        {
          supportedCurrencyCodes = self->_supportedCurrencyCodes;
          v8 = v6->_supportedCurrencyCodes;
          if (supportedCurrencyCodes)
            v9 = v8 == 0;
          else
            v9 = 1;
          if (v9)
          {
            if (supportedCurrencyCodes != v8)
              goto LABEL_91;
          }
          else
          {
            v11 = -[NSSet isEqual:](supportedCurrencyCodes, "isEqual:");
            if ((v11 & 1) == 0)
              goto LABEL_91;
          }
          supportedMerchantCountryCodes = self->_supportedMerchantCountryCodes;
          v13 = v6->_supportedMerchantCountryCodes;
          if (supportedMerchantCountryCodes && v13)
          {
            if ((-[NSSet isEqual:](supportedMerchantCountryCodes, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (supportedMerchantCountryCodes != v13)
          {
            goto LABEL_91;
          }
          supportedDeviceRegionCountryCodes = self->_supportedDeviceRegionCountryCodes;
          v15 = v6->_supportedDeviceRegionCountryCodes;
          if (supportedDeviceRegionCountryCodes && v15)
          {
            if ((-[NSSet isEqual:](supportedDeviceRegionCountryCodes, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (supportedDeviceRegionCountryCodes != v15)
          {
            goto LABEL_91;
          }
          supportedLanguages = self->_supportedLanguages;
          v17 = v6->_supportedLanguages;
          if (supportedLanguages && v17)
          {
            if ((-[NSArray isEqual:](supportedLanguages, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (supportedLanguages != v17)
          {
            goto LABEL_91;
          }
          if (self->_paymentNetworkIdentifier != v6->_paymentNetworkIdentifier
            || self->_paymentMethodType != v6->_paymentMethodType
            || self->_requiresChallenge != v6->_requiresChallenge)
          {
            goto LABEL_91;
          }
          programName = v6->_programName;
          v19 = self->_programName;
          v20 = programName;
          if (v19 == v20)
          {

          }
          else
          {
            v21 = v20;
            v10 = 0;
            if (!v19 || !v20)
              goto LABEL_100;
            v22 = v20;
            v23 = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

            if (!v23)
              goto LABEL_91;
          }
          issuerName = v6->_issuerName;
          v19 = self->_issuerName;
          v25 = issuerName;
          if (v19 == v25)
          {

          }
          else
          {
            v21 = v25;
            v10 = 0;
            if (!v19 || !v25)
              goto LABEL_100;
            v26 = v25;
            v27 = -[NSString isEqualToString:](v19, "isEqualToString:", v25);

            if (!v27)
              goto LABEL_91;
          }
          icon = self->_icon;
          v29 = v6->_icon;
          if (icon && v29)
          {
            if (!-[PKPaymentOfferDynamicContentIcon isEqual:](icon, "isEqual:"))
              goto LABEL_91;
          }
          else if (icon != v29)
          {
            goto LABEL_91;
          }
          minimumAmounts = self->_minimumAmounts;
          v31 = v6->_minimumAmounts;
          if (minimumAmounts && v31)
          {
            if ((-[NSArray isEqual:](minimumAmounts, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (minimumAmounts != v31)
          {
            goto LABEL_91;
          }
          maximumAmounts = self->_maximumAmounts;
          v33 = v6->_maximumAmounts;
          if (maximumAmounts && v33)
          {
            if ((-[NSArray isEqual:](maximumAmounts, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (maximumAmounts != v33)
          {
            goto LABEL_91;
          }
          associatedStoreIdentifiers = self->_associatedStoreIdentifiers;
          v35 = v6->_associatedStoreIdentifiers;
          if (associatedStoreIdentifiers && v35)
          {
            if ((-[NSSet isEqual:](associatedStoreIdentifiers, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (associatedStoreIdentifiers != v35)
          {
            goto LABEL_91;
          }
          appLaunchURL = self->_appLaunchURL;
          v37 = v6->_appLaunchURL;
          if (appLaunchURL && v37)
          {
            if ((-[NSURL isEqual:](appLaunchURL, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (appLaunchURL != v37)
          {
            goto LABEL_91;
          }
          associatedWebDomains = self->_associatedWebDomains;
          v39 = v6->_associatedWebDomains;
          if (associatedWebDomains && v39)
          {
            if ((-[NSSet isEqual:](associatedWebDomains, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (associatedWebDomains != v39)
          {
            goto LABEL_91;
          }
          associatedApplicationIdentifiers = self->_associatedApplicationIdentifiers;
          v41 = v6->_associatedApplicationIdentifiers;
          if (associatedApplicationIdentifiers && v41)
          {
            if ((-[NSSet isEqual:](associatedApplicationIdentifiers, "isEqual:") & 1) == 0)
              goto LABEL_91;
          }
          else if (associatedApplicationIdentifiers != v41)
          {
            goto LABEL_91;
          }
          if (self->_suppressPayInFull == v6->_suppressPayInFull)
          {
            localizedPayInFullTitleOverride = v6->_localizedPayInFullTitleOverride;
            v19 = self->_localizedPayInFullTitleOverride;
            v43 = localizedPayInFullTitleOverride;
            if (v19 == v43)
            {

            }
            else
            {
              v21 = v43;
              v10 = 0;
              if (!v19 || !v43)
                goto LABEL_100;
              v44 = v43;
              v45 = -[NSString isEqualToString:](v19, "isEqualToString:", v43);

              if (!v45)
                goto LABEL_91;
            }
            localizedTitleOverride = v6->_localizedTitleOverride;
            v19 = self->_localizedTitleOverride;
            v47 = localizedTitleOverride;
            if (v19 == v47)
            {

LABEL_95:
              localizedSubtitleOverride = self->_localizedSubtitleOverride;
              v52 = v6->_localizedSubtitleOverride;
              v19 = localizedSubtitleOverride;
              v53 = v52;
              if (v19 == v53)
              {
                v10 = 1;
                v21 = v19;
              }
              else
              {
                v21 = v53;
                v10 = 0;
                if (v19 && v53)
                {
                  v54 = v53;
                  v55 = -[NSString isEqualToString:](v19, "isEqualToString:", v53);
                  v21 = v54;
                  v10 = v55;
                }
              }
              goto LABEL_100;
            }
            v21 = v47;
            v10 = 0;
            if (v19 && v47)
            {
              v48 = v47;
              v49 = -[NSString isEqualToString:](v19, "isEqualToString:", v47);

              if (!v49)
                goto LABEL_91;
              goto LABEL_95;
            }
LABEL_100:

            goto LABEL_92;
          }
        }
LABEL_91:
        v10 = 0;
LABEL_92:

        goto LABEL_93;
      }
    }
    v10 = 0;
  }
LABEL_93:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedCurrencyCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedMerchantCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedDeviceRegionCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedLanguages);
  objc_msgSend(v3, "safelyAddObject:", self->_programName);
  objc_msgSend(v3, "safelyAddObject:", self->_issuerName);
  objc_msgSend(v3, "safelyAddObject:", self->_icon);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumAmounts);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumAmounts);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedStoreIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_appLaunchURL);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedWebDomains);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedApplicationIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedPayInFullTitleOverride);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedTitleOverride);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedSubtitleOverride);
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v4 = -[PKPaymentOfferCriteria hash](&v11, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_paymentNetworkIdentifier - v5 + 32 * v5;
  v7 = self->_paymentMethodType - v6 + 32 * v6;
  v8 = self->_requiresChallenge - v7 + 32 * v7;
  v9 = self->_suppressPayInFull - v8 + 32 * v8;

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  -[PKPaymentOfferCriteria identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  PKPaymentOfferCriteriaTypeToString(-[PKPaymentOfferCriteria type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  PKPaymentOfferCriteriaEligibilityToString(-[PKPaymentOfferCriteria eligibility](self, "eligibility"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("eligibility: '%@'; "), v6);

  -[PKPaymentOfferCriteria passSerialNumber](self, "passSerialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), v7);

  -[PKPaymentOfferCriteria passTypeIdentifier](self, "passTypeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), v8);

  -[PKPaymentOfferCriteria fpanIdentifier](self, "fpanIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("supportedCurrencyCodes: '%@'; "), self->_supportedCurrencyCodes);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedMerchantCountryCodes: '%@'; "),
    self->_supportedMerchantCountryCodes);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedDeviceRegionCountryCodes: '%@'; "),
    self->_supportedDeviceRegionCountryCodes);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedLanguages: '%@'; "), self->_supportedLanguages);
  objc_msgSend(v3, "appendFormat:", CFSTR("productName: '%@'; "), self->_programName);
  objc_msgSend(v3, "appendFormat:", CFSTR("issuerName: '%@'; "), self->_issuerName);
  objc_msgSend(v3, "appendFormat:", CFSTR("icon: '%@'; "), self->_icon);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumAmounts: '%@'; "), self->_minimumAmounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumAmounts: '%@'; "), self->_maximumAmounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedStoreIdentifiers: '%@'; "), self->_associatedStoreIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("appLaunchURL: '%@'; "), self->_appLaunchURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedWebDomains: '%@'; "), self->_associatedWebDomains);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedApplicationIdentifiers: '%@'; "),
    self->_associatedApplicationIdentifiers);
  PKPaymentNetworkNameForPaymentCredentialType(self->_paymentNetworkIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentNetworkIdentifier: '%@'; "), v10);

  PKPaymentMethodTypeToString(self->_paymentMethodType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentMethodType: '%@'; "), v11);

  if (self->_requiresChallenge)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresChallenge: '%@'; "), v12);
  if (self->_suppressPayInFull)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("suppressPayInFull: '%@'; "), v13);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedPayInFullTitleOverride: '%@'; "),
    self->_localizedPayInFullTitleOverride);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedTitleOverride: '%@'; "), self->_localizedTitleOverride);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedSubtitleOverride: '%@'; "), self->_localizedSubtitleOverride);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentCriteria)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentCriteria *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSSet *supportedCurrencyCodes;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSSet *supportedMerchantCountryCodes;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *supportedDeviceRegionCountryCodes;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *supportedLanguages;
  uint64_t v26;
  NSString *programName;
  uint64_t v28;
  NSString *issuerName;
  uint64_t v30;
  PKPaymentOfferDynamicContentIcon *icon;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *minimumAmounts;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *maximumAmounts;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSSet *associatedStoreIdentifiers;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSSet *associatedApplicationIdentifiers;
  uint64_t v52;
  NSURL *appLaunchURL;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSSet *associatedWebDomains;
  uint64_t v59;
  NSString *localizedPayInFullTitleOverride;
  uint64_t v61;
  NSString *localizedTitleOverride;
  uint64_t v63;
  NSString *localizedSubtitleOverride;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v5 = -[PKPaymentOfferCriteria initWithCoder:](&v66, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedCurrencyCodes"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedCurrencyCodes = v5->_supportedCurrencyCodes;
    v5->_supportedCurrencyCodes = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("supportedMerchantCountryCodes"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedMerchantCountryCodes = v5->_supportedMerchantCountryCodes;
    v5->_supportedMerchantCountryCodes = (NSSet *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("supportedDeviceRegionCountryCodes"));
    v19 = objc_claimAutoreleasedReturnValue();
    supportedDeviceRegionCountryCodes = v5->_supportedDeviceRegionCountryCodes;
    v5->_supportedDeviceRegionCountryCodes = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("supportedLanguages"));
    v24 = objc_claimAutoreleasedReturnValue();
    supportedLanguages = v5->_supportedLanguages;
    v5->_supportedLanguages = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programName"));
    v26 = objc_claimAutoreleasedReturnValue();
    programName = v5->_programName;
    v5->_programName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerName"));
    v28 = objc_claimAutoreleasedReturnValue();
    issuerName = v5->_issuerName;
    v5->_issuerName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (PKPaymentOfferDynamicContentIcon *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("minimumAmounts"));
    v35 = objc_claimAutoreleasedReturnValue();
    minimumAmounts = v5->_minimumAmounts;
    v5->_minimumAmounts = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("maximumAmounts"));
    v40 = objc_claimAutoreleasedReturnValue();
    maximumAmounts = v5->_maximumAmounts;
    v5->_maximumAmounts = (NSArray *)v40;

    v42 = objc_alloc(MEMORY[0x1E0C99E60]);
    v43 = objc_opt_class();
    v44 = (void *)objc_msgSend(v42, "initWithObjects:", v43, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("associatedStoreIdentifiers"));
    v45 = objc_claimAutoreleasedReturnValue();
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSSet *)v45;

    v47 = objc_alloc(MEMORY[0x1E0C99E60]);
    v48 = objc_opt_class();
    v49 = (void *)objc_msgSend(v47, "initWithObjects:", v48, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("associatedApplicationIdentifiers"));
    v50 = objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchURL"));
    v52 = objc_claimAutoreleasedReturnValue();
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v52;

    v54 = objc_alloc(MEMORY[0x1E0C99E60]);
    v55 = objc_opt_class();
    v56 = (void *)objc_msgSend(v54, "initWithObjects:", v55, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("associatedWebDomains"));
    v57 = objc_claimAutoreleasedReturnValue();
    associatedWebDomains = v5->_associatedWebDomains;
    v5->_associatedWebDomains = (NSSet *)v57;

    v5->_paymentNetworkIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentNetworkIdentifier"));
    v5->_paymentMethodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentMethodType"));
    v5->_requiresChallenge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresChallenge"));
    v5->_suppressPayInFull = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressPayInFull"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedPayInFullTitleOverride"));
    v59 = objc_claimAutoreleasedReturnValue();
    localizedPayInFullTitleOverride = v5->_localizedPayInFullTitleOverride;
    v5->_localizedPayInFullTitleOverride = (NSString *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitleOverride"));
    v61 = objc_claimAutoreleasedReturnValue();
    localizedTitleOverride = v5->_localizedTitleOverride;
    v5->_localizedTitleOverride = (NSString *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitleOverride"));
    v63 = objc_claimAutoreleasedReturnValue();
    localizedSubtitleOverride = v5->_localizedSubtitleOverride;
    v5->_localizedSubtitleOverride = (NSString *)v63;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v4 = a3;
  -[PKPaymentOfferCriteria encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedCurrencyCodes, CFSTR("supportedCurrencyCodes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedMerchantCountryCodes, CFSTR("supportedMerchantCountryCodes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedDeviceRegionCountryCodes, CFSTR("supportedDeviceRegionCountryCodes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedLanguages, CFSTR("supportedLanguages"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_programName, CFSTR("programName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerName, CFSTR("issuerName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_icon, CFSTR("iconURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumAmounts, CFSTR("minimumAmounts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maximumAmounts, CFSTR("maximumAmounts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedStoreIdentifiers, CFSTR("associatedStoreIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appLaunchURL, CFSTR("appLaunchURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedWebDomains, CFSTR("associatedWebDomains"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentNetworkIdentifier, CFSTR("paymentNetworkIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentMethodType, CFSTR("paymentMethodType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresChallenge, CFSTR("requiresChallenge"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_suppressPayInFull, CFSTR("suppressPayInFull"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedPayInFullTitleOverride, CFSTR("localizedPayInFullTitleOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedTitleOverride, CFSTR("localizedTitleOverride"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedSubtitleOverride, CFSTR("localizedSubtitleOverride"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PKPaymentOfferInstallmentCriteria;
  v5 = -[PKPaymentOfferCriteria copyWithZone:](&v39, sel_copyWithZone_);
  v6 = -[NSSet copyWithZone:](self->_supportedCurrencyCodes, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = -[NSSet copyWithZone:](self->_supportedMerchantCountryCodes, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  v10 = -[NSSet copyWithZone:](self->_supportedDeviceRegionCountryCodes, "copyWithZone:", a3);
  v11 = (void *)v5[10];
  v5[10] = v10;

  v12 = -[NSArray copyWithZone:](self->_supportedLanguages, "copyWithZone:", a3);
  v13 = (void *)v5[11];
  v5[11] = v12;

  v14 = -[NSString copyWithZone:](self->_programName, "copyWithZone:", a3);
  v15 = (void *)v5[17];
  v5[17] = v14;

  v16 = -[NSString copyWithZone:](self->_issuerName, "copyWithZone:", a3);
  v17 = (void *)v5[18];
  v5[18] = v16;

  v18 = -[PKPaymentOfferDynamicContentIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v19 = (void *)v5[19];
  v5[19] = v18;

  v20 = -[NSArray copyWithZone:](self->_minimumAmounts, "copyWithZone:", a3);
  v21 = (void *)v5[20];
  v5[20] = v20;

  v22 = -[NSArray copyWithZone:](self->_maximumAmounts, "copyWithZone:", a3);
  v23 = (void *)v5[21];
  v5[21] = v22;

  v24 = -[NSSet copyWithZone:](self->_associatedStoreIdentifiers, "copyWithZone:", a3);
  v25 = (void *)v5[22];
  v5[22] = v24;

  v26 = -[NSSet copyWithZone:](self->_associatedApplicationIdentifiers, "copyWithZone:", a3);
  v27 = (void *)v5[23];
  v5[23] = v26;

  v28 = -[NSURL copyWithZone:](self->_appLaunchURL, "copyWithZone:", a3);
  v29 = (void *)v5[25];
  v5[25] = v28;

  v30 = -[NSSet copyWithZone:](self->_associatedWebDomains, "copyWithZone:", a3);
  v31 = (void *)v5[24];
  v5[24] = v30;

  v5[12] = self->_paymentNetworkIdentifier;
  v5[13] = self->_paymentMethodType;
  *((_BYTE *)v5 + 56) = self->_requiresChallenge;
  *((_BYTE *)v5 + 57) = self->_suppressPayInFull;
  v32 = -[NSString copyWithZone:](self->_localizedPayInFullTitleOverride, "copyWithZone:", a3);
  v33 = (void *)v5[14];
  v5[14] = v32;

  v34 = -[NSString copyWithZone:](self->_localizedTitleOverride, "copyWithZone:", a3);
  v35 = (void *)v5[15];
  v5[15] = v34;

  v36 = -[NSString copyWithZone:](self->_localizedSubtitleOverride, "copyWithZone:", a3);
  v37 = (void *)v5[16];
  v5[16] = v36;

  return v5;
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (void)setSupportedCurrencyCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)supportedMerchantCountryCodes
{
  return self->_supportedMerchantCountryCodes;
}

- (void)setSupportedMerchantCountryCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)supportedDeviceRegionCountryCodes
{
  return self->_supportedDeviceRegionCountryCodes;
}

- (void)setSupportedDeviceRegionCountryCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (void)setPaymentNetworkIdentifier:(int64_t)a3
{
  self->_paymentNetworkIdentifier = a3;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_paymentMethodType = a3;
}

- (BOOL)requiresChallenge
{
  return self->_requiresChallenge;
}

- (void)setRequiresChallenge:(BOOL)a3
{
  self->_requiresChallenge = a3;
}

- (void)setSuppressPayInFull:(BOOL)a3
{
  self->_suppressPayInFull = a3;
}

- (NSString)localizedPayInFullTitleOverride
{
  return self->_localizedPayInFullTitleOverride;
}

- (void)setLocalizedPayInFullTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)localizedTitleOverride
{
  return self->_localizedTitleOverride;
}

- (void)setLocalizedTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)localizedSubtitleOverride
{
  return self->_localizedSubtitleOverride;
}

- (void)setLocalizedSubtitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (PKPaymentOfferDynamicContentIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSArray)minimumAmounts
{
  return self->_minimumAmounts;
}

- (void)setMinimumAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)maximumAmounts
{
  return self->_maximumAmounts;
}

- (void)setMaximumAmounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSSet)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (void)setAssociatedWebDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (void)setAppLaunchURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_maximumAmounts, 0);
  objc_storeStrong((id *)&self->_minimumAmounts, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_issuerName, 0);
  objc_storeStrong((id *)&self->_programName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleOverride, 0);
  objc_storeStrong((id *)&self->_localizedTitleOverride, 0);
  objc_storeStrong((id *)&self->_localizedPayInFullTitleOverride, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_supportedDeviceRegionCountryCodes, 0);
  objc_storeStrong((id *)&self->_supportedMerchantCountryCodes, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
}

@end
