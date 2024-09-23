@implementation PKPayLaterFinancingOption

- (PKPayLaterFinancingOption)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKPayLaterFinancingOption *v7;

  v4 = a3;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("productType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKPayLaterAccountProductTypeFromString(v5);

  v7 = -[PKPayLaterFinancingOption initWithDictionary:productType:](self, "initWithDictionary:productType:", v4, v6);
  return v7;
}

- (PKPayLaterFinancingOption)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  id v6;
  PKPayLaterFinancingOption *v7;
  PKPayLaterFinancingOption *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *selectionIdentifier;
  void *v13;
  uint64_t v14;
  NSDecimalNumber *apr;
  void *v16;
  void *v17;
  void *v18;
  NSDecimalNumber *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;
  PKCurrencyAmount *authAmount;
  PKPayLaterFinancingAmount *v24;
  void *v25;
  uint64_t v26;
  PKPayLaterFinancingAmount *totalAmount;
  PKPayLaterFinancingAmount *v28;
  void *v29;
  uint64_t v30;
  PKPayLaterFinancingAmount *totalFees;
  PKPayLaterFinancingAmount *v32;
  void *v33;
  uint64_t v34;
  PKPayLaterFinancingAmount *dueNow;
  PKPayLaterFinancingAmount *v36;
  void *v37;
  uint64_t v38;
  PKPayLaterFinancingAmount *installmentAmount;
  PKPayLaterFinancingAmount *v40;
  void *v41;
  uint64_t v42;
  PKPayLaterFinancingAmount *installmentFees;
  PKPayLaterFinancingAmount *v44;
  void *v45;
  uint64_t v46;
  PKPayLaterFinancingAmount *totalPrincipal;
  PKPayLaterFinancingAmount *v48;
  void *v49;
  uint64_t v50;
  PKPayLaterFinancingAmount *totalInterest;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  PKPayLaterFinancingOptionInstallment *v59;
  uint64_t v60;
  NSArray *installments;
  void *v62;
  PKPayLaterFinancingOptionTermsDetails *v63;
  PKPayLaterFinancingOptionTermsDetails *termsDetails;
  uint64_t v65;
  NSArray *supportedRepaymentNetworks;
  void *v67;
  void *v68;
  uint64_t v69;
  NSSet *supportedRepaymentCountries;
  uint64_t v71;
  NSSet *supportedRepaymentFundingSourceIdentifiers;
  uint64_t v73;
  NSDictionary *financingOptionData;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  objc_super v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v81.receiver = self;
  v81.super_class = (Class)PKPayLaterFinancingOption;
  v7 = -[PKPayLaterFinancingOption init](&v81, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("selectionIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    selectionIdentifier = v8->_selectionIdentifier;
    v8->_selectionIdentifier = (NSString *)v11;

    v8->_installmentCount = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("installmentCount"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("autoPayment"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_autoPayment = PKPayLaterFinancingOptionAutoPaymentFromString(v13);

    v8->_hasAPR = objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasAPR"));
    objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("apr"));
    v14 = objc_claimAutoreleasedReturnValue();
    apr = v8->_apr;
    v8->_apr = (NSDecimalNumber *)v14;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("authAmount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v16, "count") >= 2)
    {
      v17 = (void *)MEMORY[0x1E0CB3598];
      objc_msgSend(v16, "PKStringForKey:", CFSTR("amount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "decimalNumberWithString:", v18);
      v19 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "PKStringForKey:", CFSTR("amountCurrency"));
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 && v20)
      {
        PKCurrencyAmountCreate(v19, v20, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        authAmount = v8->_authAmount;
        v8->_authAmount = (PKCurrencyAmount *)v22;

      }
    }
    v24 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("totalAmount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKPayLaterFinancingAmount initWithDictionary:](v24, "initWithDictionary:", v25);
    totalAmount = v8->_totalAmount;
    v8->_totalAmount = (PKPayLaterFinancingAmount *)v26;

    v28 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("totalFees"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKPayLaterFinancingAmount initWithDictionary:](v28, "initWithDictionary:", v29);
    totalFees = v8->_totalFees;
    v8->_totalFees = (PKPayLaterFinancingAmount *)v30;

    v32 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("dueNow"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PKPayLaterFinancingAmount initWithDictionary:](v32, "initWithDictionary:", v33);
    dueNow = v8->_dueNow;
    v8->_dueNow = (PKPayLaterFinancingAmount *)v34;

    v36 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("installmentAmount"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PKPayLaterFinancingAmount initWithDictionary:](v36, "initWithDictionary:", v37);
    installmentAmount = v8->_installmentAmount;
    v8->_installmentAmount = (PKPayLaterFinancingAmount *)v38;

    v40 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("installmentFees"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PKPayLaterFinancingAmount initWithDictionary:](v40, "initWithDictionary:", v41);
    installmentFees = v8->_installmentFees;
    v8->_installmentFees = (PKPayLaterFinancingAmount *)v42;

    v44 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("totalPrincipal"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[PKPayLaterFinancingAmount initWithDictionary:](v44, "initWithDictionary:", v45);
    totalPrincipal = v8->_totalPrincipal;
    v8->_totalPrincipal = (PKPayLaterFinancingAmount *)v46;

    v48 = [PKPayLaterFinancingAmount alloc];
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("totalInterest"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[PKPayLaterFinancingAmount initWithDictionary:](v48, "initWithDictionary:", v49);
    totalInterest = v8->_totalInterest;
    v8->_totalInterest = (PKPayLaterFinancingAmount *)v50;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("installments"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "count"))
    {
      v76 = v16;
      v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v54 = v52;
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v78 != v57)
              objc_enumerationMutation(v54);
            v59 = -[PKPayLaterFinancingOptionInstallment initWithDictionary:]([PKPayLaterFinancingOptionInstallment alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
            objc_msgSend(v53, "safelyAddObject:", v59);

          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
        }
        while (v56);
      }

      if (objc_msgSend(v53, "count"))
      {
        v60 = objc_msgSend(v53, "copy");
        installments = v8->_installments;
        v8->_installments = (NSArray *)v60;
      }
      else
      {
        installments = v8->_installments;
        v8->_installments = 0;
      }
      v16 = v76;

    }
    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("termsDetails"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "count"))
    {
      v63 = -[PKPayLaterFinancingOptionTermsDetails initWithDictionary:]([PKPayLaterFinancingOptionTermsDetails alloc], "initWithDictionary:", v62);
      termsDetails = v8->_termsDetails;
      v8->_termsDetails = v63;

    }
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentNetworks"));
    v65 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentNetworks = v8->_supportedRepaymentNetworks;
    v8->_supportedRepaymentNetworks = (NSArray *)v65;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("merchantCapabilities"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_merchantCapabilities = PKMerchantCapabilityFromStrings(v67);

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentTypes"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_supportedRepaymentTypes = PKPayLaterFundingSourcePaymentTypeFromStrings(v68);

    objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentCountries"));
    v69 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentCountries = v8->_supportedRepaymentCountries;
    v8->_supportedRepaymentCountries = (NSSet *)v69;

    objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("supportedRepaymentFundingSourceIdentifiers"));
    v71 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentFundingSourceIdentifiers = v8->_supportedRepaymentFundingSourceIdentifiers;
    v8->_supportedRepaymentFundingSourceIdentifiers = (NSSet *)v71;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("financingOptionData"));
    v73 = objc_claimAutoreleasedReturnValue();
    financingOptionData = v8->_financingOptionData;
    v8->_financingOptionData = (NSDictionary *)v73;

  }
  return v8;
}

- (BOOL)isAmountDetailsEqualToFinancingOption:(id)a3
{
  _QWORD *v4;
  NSString *selectionIdentifier;
  NSString *v6;
  BOOL v7;
  NSDecimalNumber *apr;
  NSDecimalNumber *v9;
  PKPayLaterFinancingAmount *totalAmount;
  PKPayLaterFinancingAmount *v11;
  PKPayLaterFinancingAmount *installmentAmount;
  PKPayLaterFinancingAmount *v13;
  PKPayLaterFinancingAmount *installmentFees;
  PKPayLaterFinancingAmount *v15;
  PKPayLaterFinancingAmount *totalInterest;
  PKPayLaterFinancingAmount *v17;
  PKPayLaterFinancingAmount *totalPrincipal;
  PKPayLaterFinancingAmount *v19;
  PKPayLaterFinancingAmount *dueNow;
  PKPayLaterFinancingAmount *v21;
  PKPayLaterFinancingAmount *totalFees;
  PKPayLaterFinancingAmount *v23;
  PKCurrencyAmount *authAmount;
  PKCurrencyAmount *v25;
  BOOL v26;

  v4 = a3;
  if (!v4)
    goto LABEL_57;
  selectionIdentifier = self->_selectionIdentifier;
  v6 = (NSString *)v4[4];
  if (selectionIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (selectionIdentifier != v6)
      goto LABEL_57;
  }
  else if ((-[NSString isEqual:](selectionIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_57;
  }
  apr = self->_apr;
  v9 = (NSDecimalNumber *)v4[15];
  if (apr && v9)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (apr != v9)
  {
    goto LABEL_57;
  }
  totalAmount = self->_totalAmount;
  v11 = (PKPayLaterFinancingAmount *)v4[8];
  if (totalAmount && v11)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalAmount, "isEqual:"))
      goto LABEL_57;
  }
  else if (totalAmount != v11)
  {
    goto LABEL_57;
  }
  installmentAmount = self->_installmentAmount;
  v13 = (PKPayLaterFinancingAmount *)v4[11];
  if (installmentAmount && v13)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:"))
      goto LABEL_57;
  }
  else if (installmentAmount != v13)
  {
    goto LABEL_57;
  }
  installmentFees = self->_installmentFees;
  v15 = (PKPayLaterFinancingAmount *)v4[12];
  if (installmentFees && v15)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentFees, "isEqual:"))
      goto LABEL_57;
  }
  else if (installmentFees != v15)
  {
    goto LABEL_57;
  }
  totalInterest = self->_totalInterest;
  v17 = (PKPayLaterFinancingAmount *)v4[14];
  if (totalInterest && v17)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalInterest, "isEqual:"))
      goto LABEL_57;
  }
  else if (totalInterest != v17)
  {
    goto LABEL_57;
  }
  totalPrincipal = self->_totalPrincipal;
  v19 = (PKPayLaterFinancingAmount *)v4[13];
  if (totalPrincipal && v19)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalPrincipal, "isEqual:"))
      goto LABEL_57;
  }
  else if (totalPrincipal != v19)
  {
    goto LABEL_57;
  }
  dueNow = self->_dueNow;
  v21 = (PKPayLaterFinancingAmount *)v4[10];
  if (dueNow && v21)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](dueNow, "isEqual:"))
      goto LABEL_57;
  }
  else if (dueNow != v21)
  {
    goto LABEL_57;
  }
  totalFees = self->_totalFees;
  v23 = (PKPayLaterFinancingAmount *)v4[9];
  if (totalFees && v23)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalFees, "isEqual:"))
      goto LABEL_57;
  }
  else if (totalFees != v23)
  {
    goto LABEL_57;
  }
  authAmount = self->_authAmount;
  v25 = (PKCurrencyAmount *)v4[7];
  if (!authAmount || !v25)
  {
    if (authAmount == v25)
      goto LABEL_55;
LABEL_57:
    v26 = 0;
    goto LABEL_58;
  }
  if (!-[PKCurrencyAmount isEqual:](authAmount, "isEqual:"))
    goto LABEL_57;
LABEL_55:
  if (self->_installmentCount != v4[5])
    goto LABEL_57;
  v26 = self->_hasAPR == *((unsigned __int8 *)v4 + 8);
LABEL_58:

  return v26;
}

- (id)analyticsValueForAPR
{
  return 0;
}

- (id)analyticsValueForInstallmentCount
{
  return 0;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_selectionIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_apr);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_authAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalFees);
  objc_msgSend(v3, "safelyAddObject:", self->_dueNow);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentFees);
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterest);
  objc_msgSend(v3, "safelyAddObject:", self->_totalPrincipal);
  objc_msgSend(v3, "safelyAddObject:", self->_installments);
  objc_msgSend(v3, "safelyAddObject:", self->_termsDetails);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRepaymentNetworks);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRepaymentCountries);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedRepaymentFundingSourceIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_financingOptionData);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_productType - v4 + 32 * v4;
  v6 = self->_installmentCount - v5 + 32 * v5;
  v7 = self->_autoPayment - v6 + 32 * v6;
  v8 = self->_hasAPR - v7 + 32 * v7;
  v9 = self->_merchantCapabilities - v8 + 32 * v8;
  v10 = self->_supportedRepaymentTypes - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingOption *v4;
  PKPayLaterFinancingOption *v5;
  BOOL v6;

  v4 = (PKPayLaterFinancingOption *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFinancingOption isEqualToFinancingOption:](self, "isEqualToFinancingOption:", v5);

  return v6;
}

- (BOOL)isEqualToFinancingOption:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  char v14;
  NSDecimalNumber *apr;
  NSDecimalNumber *v17;
  PKPayLaterFinancingAmount *totalAmount;
  PKPayLaterFinancingAmount *v19;
  PKCurrencyAmount *authAmount;
  PKCurrencyAmount *v21;
  PKPayLaterFinancingAmount *totalFees;
  PKPayLaterFinancingAmount *v23;
  PKPayLaterFinancingAmount *dueNow;
  PKPayLaterFinancingAmount *v25;
  PKPayLaterFinancingAmount *installmentAmount;
  PKPayLaterFinancingAmount *v27;
  PKPayLaterFinancingAmount *installmentFees;
  PKPayLaterFinancingAmount *v29;
  PKPayLaterFinancingAmount *totalPrincipal;
  PKPayLaterFinancingAmount *v31;
  PKPayLaterFinancingAmount *totalInterest;
  PKPayLaterFinancingAmount *v33;
  NSArray *installments;
  NSArray *v35;
  PKPayLaterFinancingOptionTermsDetails *termsDetails;
  PKPayLaterFinancingOptionTermsDetails *v37;
  NSArray *supportedRepaymentNetworks;
  NSArray *v39;
  NSSet *supportedRepaymentCountries;
  NSSet *v41;
  NSSet *supportedRepaymentFundingSourceIdentifiers;
  NSSet *v43;
  NSDictionary *financingOptionData;
  NSDictionary *v45;

  v4 = a3;
  v5 = v4;
  if (!v4
    || self->_productType != v4[2]
    || self->_installmentCount != v4[5]
    || self->_autoPayment != v4[6]
    || self->_hasAPR != *((unsigned __int8 *)v4 + 8)
    || self->_supportedRepaymentTypes != v4[20]
    || self->_merchantCapabilities != v4[19])
  {
    goto LABEL_20;
  }
  v6 = (void *)v4[3];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_19;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_20;
  }
  v11 = (void *)v5[4];
  v7 = self->_selectionIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_23;
  }
  v9 = v12;
  if (!v7 || !v12)
  {
LABEL_19:

    goto LABEL_20;
  }
  v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_20;
LABEL_23:
  apr = self->_apr;
  v17 = (NSDecimalNumber *)v5[15];
  if (apr && v17)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (apr != v17)
  {
    goto LABEL_20;
  }
  totalAmount = self->_totalAmount;
  v19 = (PKPayLaterFinancingAmount *)v5[8];
  if (totalAmount && v19)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalAmount, "isEqual:"))
      goto LABEL_20;
  }
  else if (totalAmount != v19)
  {
    goto LABEL_20;
  }
  authAmount = self->_authAmount;
  v21 = (PKCurrencyAmount *)v5[7];
  if (authAmount && v21)
  {
    if (!-[PKCurrencyAmount isEqual:](authAmount, "isEqual:"))
      goto LABEL_20;
  }
  else if (authAmount != v21)
  {
    goto LABEL_20;
  }
  totalFees = self->_totalFees;
  v23 = (PKPayLaterFinancingAmount *)v5[9];
  if (totalFees && v23)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalFees, "isEqual:"))
      goto LABEL_20;
  }
  else if (totalFees != v23)
  {
    goto LABEL_20;
  }
  dueNow = self->_dueNow;
  v25 = (PKPayLaterFinancingAmount *)v5[10];
  if (dueNow && v25)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](dueNow, "isEqual:"))
      goto LABEL_20;
  }
  else if (dueNow != v25)
  {
    goto LABEL_20;
  }
  installmentAmount = self->_installmentAmount;
  v27 = (PKPayLaterFinancingAmount *)v5[11];
  if (installmentAmount && v27)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:"))
      goto LABEL_20;
  }
  else if (installmentAmount != v27)
  {
    goto LABEL_20;
  }
  installmentFees = self->_installmentFees;
  v29 = (PKPayLaterFinancingAmount *)v5[12];
  if (installmentFees && v29)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentFees, "isEqual:"))
      goto LABEL_20;
  }
  else if (installmentFees != v29)
  {
    goto LABEL_20;
  }
  totalPrincipal = self->_totalPrincipal;
  v31 = (PKPayLaterFinancingAmount *)v5[13];
  if (totalPrincipal && v31)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalPrincipal, "isEqual:"))
      goto LABEL_20;
  }
  else if (totalPrincipal != v31)
  {
    goto LABEL_20;
  }
  totalInterest = self->_totalInterest;
  v33 = (PKPayLaterFinancingAmount *)v5[14];
  if (totalInterest && v33)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalInterest, "isEqual:"))
      goto LABEL_20;
  }
  else if (totalInterest != v33)
  {
    goto LABEL_20;
  }
  installments = self->_installments;
  v35 = (NSArray *)v5[16];
  if (installments && v35)
  {
    if ((-[NSArray isEqual:](installments, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (installments != v35)
  {
    goto LABEL_20;
  }
  termsDetails = self->_termsDetails;
  v37 = (PKPayLaterFinancingOptionTermsDetails *)v5[17];
  if (termsDetails && v37)
  {
    if (!-[PKPayLaterFinancingOptionTermsDetails isEqual:](termsDetails, "isEqual:"))
      goto LABEL_20;
  }
  else if (termsDetails != v37)
  {
    goto LABEL_20;
  }
  supportedRepaymentNetworks = self->_supportedRepaymentNetworks;
  v39 = (NSArray *)v5[18];
  if (supportedRepaymentNetworks && v39)
  {
    if ((-[NSArray isEqual:](supportedRepaymentNetworks, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (supportedRepaymentNetworks != v39)
  {
    goto LABEL_20;
  }
  supportedRepaymentCountries = self->_supportedRepaymentCountries;
  v41 = (NSSet *)v5[21];
  if (supportedRepaymentCountries && v41)
  {
    if ((-[NSSet isEqual:](supportedRepaymentCountries, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (supportedRepaymentCountries != v41)
  {
    goto LABEL_20;
  }
  supportedRepaymentFundingSourceIdentifiers = self->_supportedRepaymentFundingSourceIdentifiers;
  v43 = (NSSet *)v5[22];
  if (supportedRepaymentFundingSourceIdentifiers && v43)
  {
    if ((-[NSSet isEqual:](supportedRepaymentFundingSourceIdentifiers, "isEqual:") & 1) != 0)
      goto LABEL_93;
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  if (supportedRepaymentFundingSourceIdentifiers != v43)
    goto LABEL_20;
LABEL_93:
  financingOptionData = self->_financingOptionData;
  v45 = (NSDictionary *)v5[23];
  if (financingOptionData && v45)
    v14 = -[NSDictionary isEqual:](financingOptionData, "isEqual:");
  else
    v14 = financingOptionData == v45;
LABEL_21:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOption)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingOption *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *selectionIdentifier;
  uint64_t v10;
  NSDecimalNumber *apr;
  uint64_t v12;
  PKPayLaterFinancingAmount *totalAmount;
  uint64_t v14;
  PKCurrencyAmount *authAmount;
  uint64_t v16;
  PKPayLaterFinancingAmount *totalFees;
  uint64_t v18;
  PKPayLaterFinancingAmount *dueNow;
  uint64_t v20;
  PKPayLaterFinancingAmount *installmentAmount;
  uint64_t v22;
  PKPayLaterFinancingAmount *installmentFees;
  uint64_t v24;
  PKPayLaterFinancingAmount *totalInterest;
  uint64_t v26;
  PKPayLaterFinancingAmount *totalPrincipal;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *installments;
  uint64_t v33;
  PKPayLaterFinancingOptionTermsDetails *termsDetails;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  NSArray *supportedRepaymentNetworks;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSSet *supportedRepaymentCountries;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSet *supportedRepaymentFundingSourceIdentifiers;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  NSDictionary *financingOptionData;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)PKPayLaterFinancingOption;
  v5 = -[PKPayLaterFinancingOption init](&v58, sel_init);
  if (v5)
  {
    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    selectionIdentifier = v5->_selectionIdentifier;
    v5->_selectionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apr"));
    v10 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKPayLaterFinancingAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    authAmount = v5->_authAmount;
    v5->_authAmount = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalFees"));
    v16 = objc_claimAutoreleasedReturnValue();
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKPayLaterFinancingAmount *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueNow"));
    v18 = objc_claimAutoreleasedReturnValue();
    dueNow = v5->_dueNow;
    v5->_dueNow = (PKPayLaterFinancingAmount *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAmount"));
    v20 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKPayLaterFinancingAmount *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentFees"));
    v22 = objc_claimAutoreleasedReturnValue();
    installmentFees = v5->_installmentFees;
    v5->_installmentFees = (PKPayLaterFinancingAmount *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterest"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKPayLaterFinancingAmount *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalPrincipal"));
    v26 = objc_claimAutoreleasedReturnValue();
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKPayLaterFinancingAmount *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("installments"));
    v31 = objc_claimAutoreleasedReturnValue();
    installments = v5->_installments;
    v5->_installments = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDetails"));
    v33 = objc_claimAutoreleasedReturnValue();
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterFinancingOptionTermsDetails *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("supportedRepaymentNetworks"));
    v38 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentNetworks = v5->_supportedRepaymentNetworks;
    v5->_supportedRepaymentNetworks = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("supportedRepaymentCountries"));
    v43 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentCountries = v5->_supportedRepaymentCountries;
    v5->_supportedRepaymentCountries = (NSSet *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("supportedRepaymentFundingSourceIdentifiers"));
    v48 = objc_claimAutoreleasedReturnValue();
    supportedRepaymentFundingSourceIdentifiers = v5->_supportedRepaymentFundingSourceIdentifiers;
    v5->_supportedRepaymentFundingSourceIdentifiers = (NSSet *)v48;

    v50 = (void *)MEMORY[0x1E0C99E60];
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    objc_msgSend(v50, "setWithObjects:", v51, v52, v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("financingOptionData"));
    v55 = objc_claimAutoreleasedReturnValue();
    financingOptionData = v5->_financingOptionData;
    v5->_financingOptionData = (NSDictionary *)v55;

    v5->_installmentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentCount"));
    v5->_autoPayment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autoPayment"));
    v5->_hasAPR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAPR"));
    v5->_supportedRepaymentTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRepaymentTypes"));
    v5->_merchantCapabilities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCapabilities"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectionIdentifier, CFSTR("selectionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apr, CFSTR("apr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authAmount, CFSTR("authAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalFees, CFSTR("totalFees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueNow, CFSTR("dueNow"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentAmount, CFSTR("installmentAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentFees, CFSTR("installmentFees"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalInterest, CFSTR("totalInterest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalPrincipal, CFSTR("totalPrincipal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installments, CFSTR("installments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsDetails, CFSTR("termsDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRepaymentNetworks, CFSTR("supportedRepaymentNetworks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRepaymentCountries, CFSTR("supportedRepaymentCountries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedRepaymentFundingSourceIdentifiers, CFSTR("supportedRepaymentFundingSourceIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_financingOptionData, CFSTR("financingOptionData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentCount, CFSTR("installmentCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_autoPayment, CFSTR("autoPayment"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAPR, CFSTR("hasAPR"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_merchantCapabilities, CFSTR("merchantCapabilities"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedRepaymentTypes, CFSTR("supportedRepaymentTypes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_selectionIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_apr, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v10;

  v12 = -[PKPayLaterFinancingAmount copyWithZone:](self->_totalAmount, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_authAmount, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[PKPayLaterFinancingAmount copyWithZone:](self->_totalFees, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[PKPayLaterFinancingAmount copyWithZone:](self->_dueNow, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  v20 = -[PKPayLaterFinancingAmount copyWithZone:](self->_installmentAmount, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[PKPayLaterFinancingAmount copyWithZone:](self->_installmentFees, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v22;

  v24 = -[PKPayLaterFinancingAmount copyWithZone:](self->_totalInterest, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  v26 = -[PKPayLaterFinancingAmount copyWithZone:](self->_totalPrincipal, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  v28 = -[NSArray copyWithZone:](self->_installments, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v28;

  v30 = -[PKPayLaterFinancingOptionTermsDetails copyWithZone:](self->_termsDetails, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v30;

  v32 = -[NSArray copyWithZone:](self->_supportedRepaymentNetworks, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v32;

  v34 = -[NSSet copyWithZone:](self->_supportedRepaymentCountries, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v34;

  v36 = -[NSSet copyWithZone:](self->_supportedRepaymentFundingSourceIdentifiers, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v36;

  v38 = -[NSDictionary copyWithZone:](self->_financingOptionData, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v38;

  *(_QWORD *)(v5 + 40) = self->_installmentCount;
  *(_QWORD *)(v5 + 48) = self->_autoPayment;
  *(_BYTE *)(v5 + 8) = self->_hasAPR;
  *(_QWORD *)(v5 + 160) = self->_supportedRepaymentTypes;
  *(_QWORD *)(v5 + 152) = self->_merchantCapabilities;
  *(_QWORD *)(v5 + 16) = self->_productType;
  return (id)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("selectionIdentifier: '%@'; "), self->_selectionIdentifier);
  PKPayLaterAccountProductTypeToString(self->_productType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productType: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: %@; "), self->_totalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("authAmount: %@; "), self->_authAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalFees: %@; "), self->_totalFees);
  objc_msgSend(v3, "appendFormat:", CFSTR("dueNow: %@; "), self->_dueNow);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAmount: %@; "), self->_installmentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentFees: %@; "), self->_installmentFees);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterest: %@; "), self->_totalInterest);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalPrincipal: %@; "), self->_totalPrincipal);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentCount: %ld; "), self->_installmentCount);
  if (self->_autoPayment == 1)
    v5 = CFSTR("required");
  else
    v5 = CFSTR("available");
  objc_msgSend(v3, "appendFormat:", CFSTR("autoPayment: %@; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("apr: %@; "), self->_apr);
  if (self->_hasAPR)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasAPR: %@; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentNetworks: %@; "), self->_supportedRepaymentNetworks);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentCountries: %@; "), self->_supportedRepaymentCountries);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentFundingSourceIdentifiers: %@; "),
    self->_supportedRepaymentFundingSourceIdentifiers);
  PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: %@; "), v7);

  PKPayLaterFundingSourcePaymentTypeToStrings(self->_supportedRepaymentTypes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedRepaymentTypes: %@; "), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("termsDetails: %@; "), self->_termsDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("installments: %@; "), self->_installments);
  objc_msgSend(v3, "appendFormat:", CFSTR("financingOptionData: %@; "), self->_financingOptionData);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectionIdentifier
{
  return self->_selectionIdentifier;
}

- (void)setSelectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (unint64_t)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(unint64_t)a3
{
  self->_autoPayment = a3;
}

- (PKCurrencyAmount)authAmount
{
  return self->_authAmount;
}

- (void)setAuthAmount:(id)a3
{
  objc_storeStrong((id *)&self->_authAmount, a3);
}

- (PKPayLaterFinancingAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalAmount, a3);
}

- (PKPayLaterFinancingAmount)totalFees
{
  return self->_totalFees;
}

- (void)setTotalFees:(id)a3
{
  objc_storeStrong((id *)&self->_totalFees, a3);
}

- (PKPayLaterFinancingAmount)dueNow
{
  return self->_dueNow;
}

- (void)setDueNow:(id)a3
{
  objc_storeStrong((id *)&self->_dueNow, a3);
}

- (PKPayLaterFinancingAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
  objc_storeStrong((id *)&self->_installmentAmount, a3);
}

- (PKPayLaterFinancingAmount)installmentFees
{
  return self->_installmentFees;
}

- (void)setInstallmentFees:(id)a3
{
  objc_storeStrong((id *)&self->_installmentFees, a3);
}

- (PKPayLaterFinancingAmount)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_totalPrincipal, a3);
}

- (PKPayLaterFinancingAmount)totalInterest
{
  return self->_totalInterest;
}

- (void)setTotalInterest:(id)a3
{
  objc_storeStrong((id *)&self->_totalInterest, a3);
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)installments
{
  return self->_installments;
}

- (void)setInstallments:(id)a3
{
  objc_storeStrong((id *)&self->_installments, a3);
}

- (PKPayLaterFinancingOptionTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
{
  objc_storeStrong((id *)&self->_termsDetails, a3);
}

- (NSArray)supportedRepaymentNetworks
{
  return self->_supportedRepaymentNetworks;
}

- (void)setSupportedRepaymentNetworks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)supportedRepaymentFundingSourceIdentifiers
{
  return self->_supportedRepaymentFundingSourceIdentifiers;
}

- (void)setSupportedRepaymentFundingSourceIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)financingOptionData
{
  return self->_financingOptionData;
}

- (void)setFinancingOptionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingOptionData, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentFundingSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentCountries, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentNetworks, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_installments, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_installmentFees, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_dueNow, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_authAmount, 0);
  objc_storeStrong((id *)&self->_selectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
