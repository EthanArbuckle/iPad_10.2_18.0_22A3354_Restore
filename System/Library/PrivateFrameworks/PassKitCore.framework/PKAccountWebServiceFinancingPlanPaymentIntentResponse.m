@implementation PKAccountWebServiceFinancingPlanPaymentIntentResponse

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithData:(id)a3
{
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v3;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  PKAccountPaymentFundingSource *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v24;
  uint64_t v25;
  NSArray *supportedRepaymentNetworks;
  void *v27;
  void *v28;
  uint64_t v29;
  NSSet *supportedRepaymentCountries;
  uint64_t v31;
  NSString *merchantIdentifier;
  uint64_t v33;
  PKCurrencyAmount *totalSavedInterest;
  uint64_t v35;
  PKCurrencyAmount *payoffAmount;
  uint64_t v37;
  PKCurrencyAmount *minimumAmount;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  id v47;
  PKPayLaterLastUsedFundingSource *v48;
  uint64_t v49;
  void *v50;
  void *v52;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)PKAccountWebServiceFinancingPlanPaymentIntentResponse;
  v3 = -[PKPaginatedWebServiceResponse initWithData:](&v64, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_39:
    v24 = v4;
    goto LABEL_40;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "objectForKey:", CFSTR("acceptedFundingSources"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = (void *)v7;
    v55 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v4;
      v9 = v54;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v61 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              v16 = -[PKAccountPaymentFundingSource initWithDictionary:]([PKAccountPaymentFundingSource alloc], "initWithDictionary:", v15);

              objc_msgSend(v6, "safelyAddObject:", v16);
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v11);
      }

      v4 = v8;
      v5 = v55;
    }
    v17 = objc_msgSend(v6, "count");
    if (v17)
      v18 = (void *)objc_msgSend(v6, "copy");
    else
      v18 = 0;
    objc_storeStrong((id *)&v4->_acceptedFundingSources, v18);
    if (v17)

    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentNetworks"));
    v25 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentNetworks = v4->_supportedRepaymentNetworks;
    v4->_supportedRepaymentNetworks = (NSArray *)v25;

    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_merchantCapabilities = PKMerchantCapabilityFromStrings(v27);

    objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentTypes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_supportedRepaymentTypes = PKPayLaterFundingSourcePaymentTypeFromStrings(v28);

    objc_msgSend(v5, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentCountries"));
    v29 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentCountries = v4->_supportedRepaymentCountries;
    v4->_supportedRepaymentCountries = (NSSet *)v29;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("merchantIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v4->_merchantIdentifier;
    v4->_merchantIdentifier = (NSString *)v31;

    objc_msgSend(v5, "PKCurrencyAmountForKey:", CFSTR("totalSavedInterest"));
    v33 = objc_claimAutoreleasedReturnValue();
    totalSavedInterest = v4->_totalSavedInterest;
    v4->_totalSavedInterest = (PKCurrencyAmount *)v33;

    objc_msgSend(v5, "PKCurrencyAmountForKey:", CFSTR("payoffAmount"));
    v35 = objc_claimAutoreleasedReturnValue();
    payoffAmount = v4->_payoffAmount;
    v4->_payoffAmount = (PKCurrencyAmount *)v35;

    objc_msgSend(v5, "PKCurrencyAmountForKey:", CFSTR("minimumAmount"));
    v37 = objc_claimAutoreleasedReturnValue();
    minimumAmount = v4->_minimumAmount;
    v4->_minimumAmount = (PKCurrencyAmount *)v37;

    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "objectForKey:", CFSTR("lastUsedFundingSources"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v40;
      v53 = v4;
      v41 = v40;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v43; ++j)
          {
            if (*(_QWORD *)v57 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v47 = v46;
              v48 = -[PKPayLaterLastUsedFundingSource initWithDictionary:]([PKPayLaterLastUsedFundingSource alloc], "initWithDictionary:", v47);

              objc_msgSend(v39, "safelyAddObject:", v48);
            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v43);
      }

      v40 = v52;
      v4 = v53;
    }
    v49 = objc_msgSend(v39, "count", v52, v53);
    if (v49)
      v50 = (void *)objc_msgSend(v39, "copy");
    else
      v50 = 0;
    objc_storeStrong((id *)&v4->_lastUsedFundingSources, v50);
    if (v49)

    goto LABEL_39;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v21;
    v69 = 2114;
    v70 = v23;
    _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v24 = 0;
LABEL_40:

  return v24;
}

- (id)bankAcceptedFundingSources
{
  NSDictionary *bankAcceptedFundingSources;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PKPayLaterBankPaymentSource *v12;
  PKPayLaterBankPaymentSource *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  bankAcceptedFundingSources = self->_bankAcceptedFundingSources;
  if (bankAcceptedFundingSources)
  {
    -[NSDictionary allValues](bankAcceptedFundingSources, "allValues");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_acceptedFundingSources;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "type", (_QWORD)v18) == 1)
          {
            v12 = -[PKPayLaterBankPaymentSource initWithAccountPaymentFundingSource:]([PKPayLaterBankPaymentSource alloc], "initWithAccountPaymentFundingSource:", v11);
            v13 = v12;
            if (v12)
            {
              -[PKPayLaterBankPaymentSource identifier](v12, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v13, v14);

            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v15 = (NSDictionary *)objc_msgSend(v5, "copy");
    v16 = self->_bankAcceptedFundingSources;
    self->_bankAcceptedFundingSources = v15;

    -[NSDictionary allValues](self->_bankAcceptedFundingSources, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    return v17;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("acceptedFundingSources: '%@'; "), self->_acceptedFundingSources);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: '%@'; "), self->_merchantIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentNetworks: %@; "), self->_supportedRepaymentNetworks);
  PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: %@; "), v4);

  PKPayLaterFundingSourcePaymentTypeToStrings(self->_supportedRepaymentTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentTypes: %@; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentCountries: '%@'; "), self->_supportedRepaymentCountries);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalSavedInterest: '%@'; "), self->_totalSavedInterest);
  objc_msgSend(v3, "appendFormat:", CFSTR("payoffAmount: '%@'; "), self->_payoffAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUsedFundingSources: '%@'; "), self->_lastUsedFundingSources);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v4;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v5;
  BOOL v6;

  v4 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountWebServiceFinancingPlanPaymentIntentResponse isEqualToFinancingPlanPaymentIntentResponse:](self, "isEqualToFinancingPlanPaymentIntentResponse:", v5);

  return v6;
}

- (BOOL)isEqualToFinancingPlanPaymentIntentResponse:(id)a3
{
  _QWORD *v4;
  NSArray *acceptedFundingSources;
  NSArray *v6;
  BOOL v7;
  NSArray *supportedRepaymentNetworks;
  NSArray *v9;
  BOOL v10;
  NSSet *supportedRepaymentCountries;
  NSSet *v12;
  BOOL v13;
  NSString *merchantIdentifier;
  NSString *v15;
  BOOL v16;
  PKCurrencyAmount *totalSavedInterest;
  PKCurrencyAmount *v18;
  PKCurrencyAmount *payoffAmount;
  PKCurrencyAmount *v20;
  PKCurrencyAmount *minimumAmount;
  PKCurrencyAmount *v22;
  NSArray *lastUsedFundingSources;
  NSArray *v24;
  BOOL v25;

  v4 = a3;
  if (!v4)
    goto LABEL_56;
  acceptedFundingSources = self->_acceptedFundingSources;
  v6 = (NSArray *)v4[8];
  if (acceptedFundingSources)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (acceptedFundingSources != v6)
      goto LABEL_56;
  }
  else if ((-[NSArray isEqual:](acceptedFundingSources, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  supportedRepaymentNetworks = self->_supportedRepaymentNetworks;
  v9 = (NSArray *)v4[9];
  if (supportedRepaymentNetworks)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (supportedRepaymentNetworks != v9)
      goto LABEL_56;
  }
  else if ((-[NSArray isEqual:](supportedRepaymentNetworks, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  supportedRepaymentCountries = self->_supportedRepaymentCountries;
  v12 = (NSSet *)v4[12];
  if (supportedRepaymentCountries)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    if (supportedRepaymentCountries != v12)
      goto LABEL_56;
  }
  else if ((-[NSSet isEqual:](supportedRepaymentCountries, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v15 = (NSString *)v4[13];
  if (merchantIdentifier)
    v16 = v15 == 0;
  else
    v16 = 1;
  if (v16)
  {
    if (merchantIdentifier != v15)
      goto LABEL_56;
  }
  else if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  totalSavedInterest = self->_totalSavedInterest;
  v18 = (PKCurrencyAmount *)v4[14];
  if (totalSavedInterest && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](totalSavedInterest, "isEqual:"))
      goto LABEL_56;
  }
  else if (totalSavedInterest != v18)
  {
    goto LABEL_56;
  }
  payoffAmount = self->_payoffAmount;
  v20 = (PKCurrencyAmount *)v4[15];
  if (payoffAmount && v20)
  {
    if (!-[PKCurrencyAmount isEqual:](payoffAmount, "isEqual:"))
      goto LABEL_56;
  }
  else if (payoffAmount != v20)
  {
    goto LABEL_56;
  }
  minimumAmount = self->_minimumAmount;
  v22 = (PKCurrencyAmount *)v4[16];
  if (minimumAmount && v22)
  {
    if (!-[PKCurrencyAmount isEqual:](minimumAmount, "isEqual:"))
      goto LABEL_56;
  }
  else if (minimumAmount != v22)
  {
    goto LABEL_56;
  }
  lastUsedFundingSources = self->_lastUsedFundingSources;
  v24 = (NSArray *)v4[17];
  if (!lastUsedFundingSources || !v24)
  {
    if (lastUsedFundingSources == v24)
      goto LABEL_54;
LABEL_56:
    v25 = 0;
    goto LABEL_57;
  }
  if ((-[NSArray isEqual:](lastUsedFundingSources, "isEqual:") & 1) == 0)
    goto LABEL_56;
LABEL_54:
  if (self->_merchantCapabilities != v4[10])
    goto LABEL_56;
  v25 = self->_supportedRepaymentTypes == v4[11];
LABEL_57:

  return v25;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_acceptedFundingSources);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRepaymentNetworks);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRepaymentCountries);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_totalSavedInterest);
  objc_msgSend(v3, "safelyAddObject:", self->_payoffAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUsedFundingSources);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_merchantCapabilities - v4 + 32 * v4;
  v6 = self->_supportedRepaymentTypes - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithCoder:(id)a3
{
  id v4;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *acceptedFundingSources;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *supportedRepaymentNetworks;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *supportedRepaymentCountries;
  uint64_t v21;
  NSString *merchantIdentifier;
  uint64_t v23;
  PKCurrencyAmount *totalSavedInterest;
  uint64_t v25;
  PKCurrencyAmount *payoffAmount;
  uint64_t v27;
  PKCurrencyAmount *minimumAmount;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *lastUsedFundingSources;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKAccountWebServiceFinancingPlanPaymentIntentResponse;
  v5 = -[PKAccountWebServiceFinancingPlanPaymentIntentResponse init](&v35, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("acceptedFundingSources"));
    v9 = objc_claimAutoreleasedReturnValue();
    acceptedFundingSources = v5->_acceptedFundingSources;
    v5->_acceptedFundingSources = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("supportedRepaymentNetworks"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentNetworks = v5->_supportedRepaymentNetworks;
    v5->_supportedRepaymentNetworks = (NSArray *)v14;

    v5->_merchantCapabilities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCapabilities"));
    v5->_supportedRepaymentTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRepaymentTypes"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("supportedRepaymentCountries"));
    v19 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentCountries = v5->_supportedRepaymentCountries;
    v5->_supportedRepaymentCountries = (NSSet *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalSavedInterest"));
    v23 = objc_claimAutoreleasedReturnValue();
    totalSavedInterest = v5->_totalSavedInterest;
    v5->_totalSavedInterest = (PKCurrencyAmount *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payoffAmount"));
    v25 = objc_claimAutoreleasedReturnValue();
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumAmount"));
    v27 = objc_claimAutoreleasedReturnValue();
    minimumAmount = v5->_minimumAmount;
    v5->_minimumAmount = (PKCurrencyAmount *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("lastUsedFundingSources"));
    v32 = objc_claimAutoreleasedReturnValue();
    lastUsedFundingSources = v5->_lastUsedFundingSources;
    v5->_lastUsedFundingSources = (NSArray *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *acceptedFundingSources;
  id v5;

  acceptedFundingSources = self->_acceptedFundingSources;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", acceptedFundingSources, CFSTR("acceptedFundingSources"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRepaymentNetworks, CFSTR("supportedRepaymentNetworks"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCapabilities, CFSTR("merchantCapabilities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedRepaymentTypes, CFSTR("supportedRepaymentTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRepaymentCountries, CFSTR("supportedRepaymentCountries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalSavedInterest, CFSTR("totalSavedInterest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payoffAmount, CFSTR("payoffAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumAmount, CFSTR("minimumAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUsedFundingSources, CFSTR("lastUsedFundingSources"));

}

- (NSArray)acceptedFundingSources
{
  return self->_acceptedFundingSources;
}

- (void)setAcceptedFundingSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)supportedRepaymentNetworks
{
  return self->_supportedRepaymentNetworks;
}

- (void)setSupportedRepaymentNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unint64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (unint64_t)supportedRepaymentTypes
{
  return self->_supportedRepaymentTypes;
}

- (void)setSupportedRepaymentTypes:(unint64_t)a3
{
  self->_supportedRepaymentTypes = a3;
}

- (NSSet)supportedRepaymentCountries
{
  return self->_supportedRepaymentCountries;
}

- (void)setSupportedRepaymentCountries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKCurrencyAmount)totalSavedInterest
{
  return self->_totalSavedInterest;
}

- (void)setTotalSavedInterest:(id)a3
{
  objc_storeStrong((id *)&self->_totalSavedInterest, a3);
}

- (PKCurrencyAmount)payoffAmount
{
  return self->_payoffAmount;
}

- (void)setPayoffAmount:(id)a3
{
  objc_storeStrong((id *)&self->_payoffAmount, a3);
}

- (PKCurrencyAmount)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
  objc_storeStrong((id *)&self->_minimumAmount, a3);
}

- (NSArray)lastUsedFundingSources
{
  return self->_lastUsedFundingSources;
}

- (void)setLastUsedFundingSources:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedFundingSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_payoffAmount, 0);
  objc_storeStrong((id *)&self->_totalSavedInterest, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentCountries, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentNetworks, 0);
  objc_storeStrong((id *)&self->_acceptedFundingSources, 0);
  objc_storeStrong((id *)&self->_bankAcceptedFundingSources, 0);
}

@end
