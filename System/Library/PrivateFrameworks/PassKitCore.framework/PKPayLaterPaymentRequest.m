@implementation PKPayLaterPaymentRequest

- (PKPayLaterPaymentRequest)initWithIntentDetails:(id)a3 payLaterAccount:(id)a4 financingPlan:(id)a5 intent:(unint64_t)a6 acceptedFundingSources:(id)a7 currencyAmount:(id)a8 hasAdequateAppleCashBalance:(BOOL)a9 countryCode:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  PKPayLaterPaymentRequest *v21;
  uint64_t v22;
  NSURL *accountBaseURL;
  uint64_t v24;
  NSString *accountIdentifier;
  uint64_t v26;
  NSString *payLaterPassUniqueID;
  uint64_t v28;
  _BOOL4 v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *defaultPassUniqueID;
  uint64_t v51;
  PKBankAccountInformation *defaultBankAccount;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v17 = a3;
  v18 = a4;
  v55 = a5;
  v56 = a7;
  v19 = a8;
  v20 = a10;
  v57.receiver = self;
  v57.super_class = (Class)PKPayLaterPaymentRequest;
  v21 = -[PKPaymentRequest init](&v57, sel_init);
  if (v21)
  {
    objc_msgSend(v18, "accountBaseURL");
    v22 = objc_claimAutoreleasedReturnValue();
    accountBaseURL = v21->_accountBaseURL;
    v21->_accountBaseURL = (NSURL *)v22;

    v21->_payLaterPaymentIntentType = a6;
    objc_msgSend(v18, "accountIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v21->_financingPlan, a5);
    objc_storeStrong((id *)&v21->_intentDetails, a3);
    objc_storeStrong((id *)&v21->_currencyAmount, a8);
    objc_msgSend(v18, "associatedPassUniqueID");
    v26 = objc_claimAutoreleasedReturnValue();
    payLaterPassUniqueID = v21->_payLaterPassUniqueID;
    v21->_payLaterPassUniqueID = (NSString *)v26;

    v28 = objc_msgSend(v17, "supportedRepaymentTypes");
    v29 = a9;
    if ((v28 & 4) == 0)
      v29 = 1;
    if (v29)
      v30 = v28;
    else
      v30 = v28 & 0xFFFFFFFFFFFFFFFBLL;
    v21->_supportedRepaymentTypes = v30;
    -[PKPaymentRequest setRequestType:](v21, "setRequestType:", 11);
    -[PKPaymentRequest setCountryCode:](v21, "setCountryCode:", v20);
    objc_msgSend(v19, "currency");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v18;
    if (v31)
    {
      -[PKPaymentRequest setCurrencyCode:](v21, "setCurrencyCode:", v31);
    }
    else
    {
      objc_msgSend(v18, "payLaterDetails");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "currencyCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentRequest setCurrencyCode:](v21, "setCurrencyCode:", v33);

    }
    -[PKPaymentRequest setMerchantCapabilities:](v21, "setMerchantCapabilities:", objc_msgSend(v17, "merchantCapabilities"));
    objc_msgSend(v17, "merchantIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setMerchantIdentifier:](v21, "setMerchantIdentifier:", v34);

    objc_msgSend(v17, "supportedRepaymentNetworks");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setSupportedNetworks:](v21, "setSupportedNetworks:", v35);

    v36 = v17;
    objc_msgSend(v17, "supportedRepaymentCountries");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentRequest setSupportedCountries:](v21, "setSupportedCountries:", v37);

    -[PKPaymentRequest setClientCallbackTimeout:](v21, "setClientCallbackTimeout:", 65.0);
    -[PKPaymentRequest setConfirmationStyle:](v21, "setConfirmationStyle:", 0);
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a6 == 1)
    {
      PKLocalizedCocoonString(CFSTR("PAY_APPLE"), 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "amount");
      v40 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a6 != 2)
        goto LABEL_15;
      PKLocalizedCocoonString(CFSTR("AUTHORIZE_FOR_AUTO_PAY"), 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v40 = objc_claimAutoreleasedReturnValue();
    }
    v41 = (void *)v40;
    +[PKPaymentSummaryItem summaryItemWithLabel:amount:](PKPaymentSummaryItem, "summaryItemWithLabel:amount:", v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v42);

LABEL_15:
    v43 = (void *)objc_msgSend(v38, "copy");
    -[PKPaymentRequest setPaymentSummaryItems:](v21, "setPaymentSummaryItems:", v43);

    -[PKPayLaterPaymentRequest _acceptedBankAccountsForAcceptedFundingSources:](v21, "_acceptedBankAccountsForAcceptedFundingSources:", v56);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "count"))
      v45 = v44;
    else
      v45 = 0;
    -[PKPaymentRequest setBankAccounts:](v21, "setBankAccounts:", v45);
    if (objc_msgSend(v56, "count"))
    {
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
    }
    v47 = objc_msgSend(v46, "type");
    if (v47 == 2)
    {
      objc_msgSend(v46, "accountPaymentFundingSource");
      defaultPassUniqueID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(defaultPassUniqueID, "bankAccountRepresentation");
      v51 = objc_claimAutoreleasedReturnValue();
      defaultBankAccount = v21->_defaultBankAccount;
      v21->_defaultBankAccount = (PKBankAccountInformation *)v51;

    }
    else
    {
      if (v47 != 1)
      {
LABEL_26:

        v18 = v54;
        v17 = v36;
        goto LABEL_27;
      }
      objc_msgSend(v46, "paymentPass");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "uniqueID");
      v49 = objc_claimAutoreleasedReturnValue();

      defaultPassUniqueID = v21->_defaultPassUniqueID;
      v21->_defaultPassUniqueID = (NSString *)v49;
    }

    goto LABEL_26;
  }
LABEL_27:

  return v21;
}

- (id)acceptedPassesWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPayLaterAvailableFundingSourcesFilter *v9;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  PKCurrencyAmount *currencyAmount;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKPaymentService *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v24 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService defaultPaymentPassUniqueIdentifier](v24, "defaultPaymentPassUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  v9 = -[PKPayLaterAvailableFundingSourcesFilter initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:]([PKPayLaterAvailableFundingSourcesFilter alloc], "initWithPassLibrary:peerPaymentAccount:defaultPassUniqueIdentifier:", v6, v7, v8);
  intentDetails = self->_intentDetails;
  currencyAmount = self->_currencyAmount;
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan paymentSource](self->_financingPlan, "paymentSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterAvailableFundingSourcesFilter availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:](v9, "availableFundingSourcesForPaymentIntentDetails:currencyAmount:planIdentifier:primaryPaymentSource:", intentDetails, currencyAmount, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v14, "count"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "type") == 1)
      {
        objc_msgSend(v17, "paymentPass");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "passWithUniqueID:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "paymentPass");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "safelyAddObject:", v21);

      }
      ++v16;
    }
    while (v16 < objc_msgSend(v14, "count"));
  }
  v22 = (void *)objc_msgSend(v15, "copy");

  return v22;
}

- (BOOL)showPeerPaymentBalance
{
  return (LOBYTE(self->_supportedRepaymentTypes) >> 2) & 1;
}

- (BOOL)hasAvailableFundingSource
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PKPayLaterPaymentRequest defaultBankAccount](self, "defaultBankAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PKPayLaterPaymentRequest defaultPassUniqueID](self, "defaultPassUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)accountPaymentFundingSourceForBankIdentifier:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_bankIdentifierToFundingSource, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_acceptedBankAccountsForAcceptedFundingSources:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *bankIdentifierToFundingSource;
  _QWORD v12[4];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PKPayLaterPaymentRequest__acceptedBankAccountsForAcceptedFundingSources___block_invoke;
  v12[3] = &unk_1E2AC6268;
  v13 = v6;
  v7 = v6;
  objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (NSDictionary *)objc_msgSend(v7, "copy");
  bankIdentifierToFundingSource = self->_bankIdentifierToFundingSource;
  self->_bankIdentifierToFundingSource = v9;

  return v8;
}

id __75__PKPayLaterPaymentRequest__acceptedBankAccountsForAcceptedFundingSources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(v3, "accountPaymentFundingSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bankAccountRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v4, v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterPaymentRequest *v4;
  PKPayLaterPaymentRequest *v5;
  BOOL v6;

  v4 = (PKPayLaterPaymentRequest *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterPaymentRequest isEqualToPayLaterPaymentRequest:](self, "isEqualToPayLaterPaymentRequest:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterPaymentRequest:(id)a3
{
  _QWORD *v4;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *v6;
  BOOL v7;
  NSString *payLaterPassUniqueID;
  NSString *v10;
  BOOL v11;
  char v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  BOOL v17;
  _BOOL4 v18;
  PKBankAccountInformation *defaultBankAccount;
  PKBankAccountInformation *v20;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v22;
  NSURL *accountBaseURL;
  NSURL *v24;
  BOOL v25;
  void *v27;
  NSString *v28;
  _BOOL4 v29;
  NSDictionary *bankIdentifierToFundingSource;
  NSDictionary *v31;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v33;
  objc_super v34;

  v4 = a3;
  if (!v4)
    goto LABEL_43;
  v34.receiver = self;
  v34.super_class = (Class)PKPayLaterPaymentRequest;
  if (!-[PKPaymentRequest isEqual:](&v34, sel_isEqual_, v4))
    goto LABEL_43;
  intentDetails = self->_intentDetails;
  v6 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)v4[69];
  if (intentDetails)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (intentDetails != v6)
      goto LABEL_43;
  }
  else if (!-[PKAccountWebServiceFinancingPlanPaymentIntentResponse isEqual:](intentDetails, "isEqual:"))
  {
    goto LABEL_43;
  }
  payLaterPassUniqueID = self->_payLaterPassUniqueID;
  v10 = (NSString *)v4[73];
  if (payLaterPassUniqueID)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    if (payLaterPassUniqueID != v10)
      goto LABEL_43;
  }
  else
  {
    v12 = -[NSString isEqual:](payLaterPassUniqueID, "isEqual:");
    if ((v12 & 1) == 0)
      goto LABEL_43;
  }
  v13 = (void *)v4[74];
  v14 = self->_defaultPassUniqueID;
  v15 = v13;
  if (v14 == v15)
  {

  }
  else
  {
    v16 = v15;
    if (v14)
      v17 = v15 == 0;
    else
      v17 = 1;
    if (v17)
      goto LABEL_25;
    v18 = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

    if (!v18)
      goto LABEL_43;
  }
  defaultBankAccount = self->_defaultBankAccount;
  v20 = (PKBankAccountInformation *)v4[75];
  if (defaultBankAccount && v20)
  {
    if ((-[PKBankAccountInformation isEqual:](defaultBankAccount, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (defaultBankAccount != v20)
  {
    goto LABEL_43;
  }
  financingPlan = self->_financingPlan;
  v22 = (PKPayLaterFinancingPlan *)v4[71];
  if (financingPlan && v22)
  {
    if (!-[PKPayLaterFinancingPlan isEqual:](financingPlan, "isEqual:"))
      goto LABEL_43;
  }
  else if (financingPlan != v22)
  {
    goto LABEL_43;
  }
  accountBaseURL = self->_accountBaseURL;
  v24 = (NSURL *)v4[78];
  if (accountBaseURL && v24)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (accountBaseURL != v24)
  {
    goto LABEL_43;
  }
  v27 = (void *)v4[72];
  v14 = self->_accountIdentifier;
  v28 = v27;
  if (v14 != v28)
  {
    v16 = v28;
    if (v14 && v28)
    {
      v29 = -[NSString isEqualToString:](v14, "isEqualToString:", v28);

      if (!v29)
        goto LABEL_43;
      goto LABEL_51;
    }
LABEL_25:

    goto LABEL_43;
  }

LABEL_51:
  bankIdentifierToFundingSource = self->_bankIdentifierToFundingSource;
  v31 = (NSDictionary *)v4[68];
  if (bankIdentifierToFundingSource && v31)
  {
    if ((-[NSDictionary isEqual:](bankIdentifierToFundingSource, "isEqual:") & 1) == 0)
      goto LABEL_43;
  }
  else if (bankIdentifierToFundingSource != v31)
  {
    goto LABEL_43;
  }
  currencyAmount = self->_currencyAmount;
  v33 = (PKCurrencyAmount *)v4[70];
  if (currencyAmount && v33)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_43;
  }
  else if (currencyAmount != v33)
  {
    goto LABEL_43;
  }
  if (self->_payLaterPaymentIntentType == v4[77])
  {
    v25 = self->_supportedRepaymentTypes == v4[76];
    goto LABEL_44;
  }
LABEL_43:
  v25 = 0;
LABEL_44:

  return v25;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_intentDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_payLaterPassUniqueID);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultPassUniqueID);
  objc_msgSend(v3, "safelyAddObject:", self->_defaultBankAccount);
  objc_msgSend(v3, "safelyAddObject:", self->_financingPlan);
  objc_msgSend(v3, "safelyAddObject:", self->_accountBaseURL);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_bankIdentifierToFundingSource);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterPaymentRequest;
  v4 = -[PKPayLaterPaymentRequest hash](&v9, sel_hash);
  v5 = PKCombinedHash((uint64_t)v4, v3);
  v6 = self->_payLaterPaymentIntentType - v5 + 32 * v5;
  v7 = self->_supportedRepaymentTypes - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPaymentRequest *v5;
  uint64_t v6;
  PKAccountWebServiceFinancingPlanPaymentIntentResponse *intentDetails;
  uint64_t v8;
  NSString *payLaterPassUniqueID;
  uint64_t v10;
  NSString *defaultPassUniqueID;
  uint64_t v12;
  PKBankAccountInformation *defaultBankAccount;
  uint64_t v14;
  PKPayLaterFinancingPlan *financingPlan;
  uint64_t v16;
  NSURL *accountBaseURL;
  uint64_t v18;
  NSString *accountIdentifier;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *bankIdentifierToFundingSource;
  uint64_t v26;
  PKCurrencyAmount *currencyAmount;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterPaymentRequest;
  v5 = -[PKPaymentRequest initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDetails"));
    v6 = objc_claimAutoreleasedReturnValue();
    intentDetails = v5->_intentDetails;
    v5->_intentDetails = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payLaterPassUniqueID"));
    v8 = objc_claimAutoreleasedReturnValue();
    payLaterPassUniqueID = v5->_payLaterPassUniqueID;
    v5->_payLaterPassUniqueID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultPassUniqueID"));
    v10 = objc_claimAutoreleasedReturnValue();
    defaultPassUniqueID = v5->_defaultPassUniqueID;
    v5->_defaultPassUniqueID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultBankAccount"));
    v12 = objc_claimAutoreleasedReturnValue();
    defaultBankAccount = v5->_defaultBankAccount;
    v5->_defaultBankAccount = (PKBankAccountInformation *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("financingPlan"));
    v14 = objc_claimAutoreleasedReturnValue();
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v14;

    v5->_payLaterPaymentIntentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payLaterPaymentIntentType"));
    v5->_supportedRepaymentTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRepaymentTypes"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountBaseURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("bankIdentifierToFundingSource"));
    v24 = objc_claimAutoreleasedReturnValue();
    bankIdentifierToFundingSource = v5->_bankIdentifierToFundingSource;
    v5->_bankIdentifierToFundingSource = (NSDictionary *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v26 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentRequest;
  v4 = a3;
  -[PKPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentDetails, CFSTR("intentDetails"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultPassUniqueID, CFSTR("defaultPassUniqueID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_payLaterPassUniqueID, CFSTR("payLaterPassUniqueID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultBankAccount, CFSTR("defaultBankAccount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, CFSTR("financingPlan"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_payLaterPaymentIntentType, CFSTR("payLaterPaymentIntentType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_supportedRepaymentTypes, CFSTR("supportedRepaymentTypes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountBaseURL, CFSTR("accountBaseURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bankIdentifierToFundingSource, CFSTR("bankIdentifierToFundingSource"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));

}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)payLaterPassUniqueID
{
  return self->_payLaterPassUniqueID;
}

- (NSString)defaultPassUniqueID
{
  return self->_defaultPassUniqueID;
}

- (PKBankAccountInformation)defaultBankAccount
{
  return self->_defaultBankAccount;
}

- (unint64_t)supportedRepaymentTypes
{
  return self->_supportedRepaymentTypes;
}

- (unint64_t)payLaterPaymentIntentType
{
  return self->_payLaterPaymentIntentType;
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_defaultBankAccount, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueID, 0);
  objc_storeStrong((id *)&self->_payLaterPassUniqueID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_bankIdentifierToFundingSource, 0);
}

@end
