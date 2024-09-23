@implementation PKCreditAccountDetails

- (PKCreditAccountDetails)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSDate *mergeDate;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSString *currencyCode;
  void *v16;
  uint64_t v17;
  NSTimeZone *productTimeZone;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *virtualCards;
  uint64_t v24;
  NSString *termsIdentifier;
  uint64_t v26;
  NSURL *termsURL;
  uint64_t v28;
  NSURL *associatedPassURL;
  uint64_t v30;
  NSURL *v31;
  uint64_t v32;
  NSString *associatedPassTypeIdentifier;
  uint64_t v34;
  NSString *associatedPassSerialNumber;
  PKCreditAccountSummary *v36;
  void *v37;
  uint64_t v38;
  PKCreditAccountSummary *accountSummary;
  PKCreditAccountRates *v40;
  void *v41;
  uint64_t v42;
  PKCreditAccountRates *rates;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSSet *installmentPlans;
  void *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKCreditAccountDetails;
  v5 = -[PKCreditAccountDetails init](&v51, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("mergeDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("productTimeZone"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v17;

    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("virtualCards"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pk_arrayByApplyingBlock:", &__block_literal_global_81);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSSet *)v22;

    v5->_termsAcceptanceRequired = objc_msgSend(v4, "PKBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v24;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("termsURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v26;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("associatedPassURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v28;

    if (!v5->_associatedPassURL)
    {
      objc_msgSend(v4, "PKURLForKey:", CFSTR("associatedPassUrl"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v5->_associatedPassURL;
      v5->_associatedPassURL = (NSURL *)v30;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassTypeIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v32;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassSerialNumber"));
    v34 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v34;

    v5->_cardType = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("cardType"));
    v36 = [PKCreditAccountSummary alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("accountSummary"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[PKCreditAccountSummary initWithDictionary:](v36, "initWithDictionary:", v37);
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKCreditAccountSummary *)v38;

    v40 = [PKCreditAccountRates alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("rates"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PKCreditAccountRates initWithDictionary:](v40, "initWithDictionary:", v41);
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v42;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("installmentPlans"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "count"))
    {
      v45 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v44, "pk_arrayByApplyingBlock:", &__block_literal_global_54);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setWithArray:", v46);
      v47 = objc_claimAutoreleasedReturnValue();
      installmentPlans = v5->_installmentPlans;
      v5->_installmentPlans = (NSSet *)v47;

    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("rewardsDestination"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rewardsDestination = PKAccountRewardRedemptionTypeFromString(v49);

  }
  return v5;
}

PKVirtualCard *__45__PKCreditAccountDetails_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKVirtualCard *v3;

  v2 = a2;
  v3 = -[PKVirtualCard initWithDictionary:]([PKVirtualCard alloc], "initWithDictionary:", v2);

  return v3;
}

PKCreditInstallmentPlan *__45__PKCreditAccountDetails_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKCreditInstallmentPlan *v3;

  v2 = a2;
  v3 = -[PKCreditInstallmentPlan initWithDictionary:]([PKCreditInstallmentPlan alloc], "initWithDictionary:", v2);

  return v3;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *virtualCards;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *installmentPlans;
  id v15;

  v15 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v15, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("virtualCards"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  virtualCards = self->_virtualCards;
  self->_virtualCards = v7;

  objc_msgSend(v15, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("installmentPlans"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v15, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("installmentPlans"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_57);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v12);
    v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    installmentPlans = self->_installmentPlans;
    self->_installmentPlans = v13;

  }
  -[PKCreditAccountSummary ingestExtendedAccountDetails:](self->_accountSummary, "ingestExtendedAccountDetails:", v15);

}

PKVirtualCard *__55__PKCreditAccountDetails_ingestExtendedAccountDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKVirtualCard *v3;

  v2 = a2;
  v3 = -[PKVirtualCard initWithDictionary:]([PKVirtualCard alloc], "initWithDictionary:", v2);

  return v3;
}

PKCreditInstallmentPlan *__55__PKCreditAccountDetails_ingestExtendedAccountDetails___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKCreditInstallmentPlan *v3;

  v2 = a2;
  v3 = -[PKCreditInstallmentPlan initWithDictionary:]([PKCreditInstallmentPlan alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)installmentPlanWithIdentifier:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_installmentPlans;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v13)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

- (void)addOrUpdateVirtualCard:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  void *v19;
  PKCreditAccountDetails *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_virtualCards);
  if (-[NSSet count](self->_virtualCards, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_virtualCards;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v20 = self;
      v21 = v5;
      v9 = 0;
      v10 = *(_QWORD *)v23;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "identifier", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {

            if (v13 != v15)
              continue;
          }
          else
          {
            v17 = objc_msgSend(v13, "isEqual:", v14);

            if ((v17 & 1) == 0)
              continue;
          }
          if (objc_msgSend(v4, "state") == 2)
          {
            objc_msgSend(v21, "removeObject:", v12);
          }
          else
          {
            objc_msgSend(v12, "mergeVirtualCardWith:", v4);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeObject:", v12);
            objc_msgSend(v21, "addObject:", v18);

          }
          v9 = 1;
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (!v8)
        {

          self = v20;
          v5 = v21;
          if ((v9 & 1) != 0)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
    }

  }
LABEL_24:
  objc_msgSend(v5, "addObject:", v4);
LABEL_25:
  v19 = (void *)objc_msgSend(v5, "copy");
  -[PKCreditAccountDetails setVirtualCards:](self, "setVirtualCards:", v19);

}

- (void)removeVirtualCard:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_virtualCards);
  if (-[NSSet count](self->_virtualCards, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_virtualCards;
    v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v17 = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = v4;
          v14 = v13;
          if (v12 == v13)
          {

LABEL_17:
            v5 = v17;
            objc_msgSend(v17, "removeObject:", v11);
            goto LABEL_18;
          }
          if (v4 && v12)
          {
            v15 = objc_msgSend(v12, "isEqualToString:", v13);

            if (v15)
              goto LABEL_17;
          }
          else
          {

          }
        }
        v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v5 = v17;
        if (v8)
          continue;
        break;
      }
    }
LABEL_18:

  }
  v16 = (void *)objc_msgSend(v5, "copy");
  -[PKCreditAccountDetails setVirtualCards:](self, "setVirtualCards:", v16);

}

- (id)virtualCardWithIdentifier:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_virtualCards;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSDate *mergeDate;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSTimeZone *productTimeZone;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSSet *virtualCards;
  uint64_t v23;
  NSURL *termsURL;
  uint64_t v25;
  NSString *termsIdentifier;
  uint64_t v27;
  NSURL *associatedPassURL;
  uint64_t v29;
  NSString *associatedPassTypeIdentifier;
  uint64_t v31;
  NSString *associatedPassSerialNumber;
  uint64_t v33;
  PKCreditAccountSummary *accountSummary;
  uint64_t v35;
  PKCreditAccountRates *rates;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSSet *installmentPlans;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKCreditAccountDetails;
  v5 = -[PKCreditAccountDetails init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productTimeZone"));
    v16 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("virtualCards"));
    v21 = objc_claimAutoreleasedReturnValue();
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSSet *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    v5->_termsAcceptanceRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassTypeIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassSerialNumber"));
    v31 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v31;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountSummary"));
    v33 = objc_claimAutoreleasedReturnValue();
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKCreditAccountSummary *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rates"));
    v35 = objc_claimAutoreleasedReturnValue();
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("installmentPlans"));
    v40 = objc_claimAutoreleasedReturnValue();
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSSet *)v40;

    v5->_rewardsDestination = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rewardsDestination"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastUpdatedDate;
  id v5;

  lastUpdatedDate = self->_lastUpdatedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mergeDate, CFSTR("mergeDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productTimeZone, CFSTR("productTimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_virtualCards, CFSTR("virtualCards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsURL, CFSTR("termsURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_termsAcceptanceRequired, CFSTR("termsAcceptanceRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassURL, CFSTR("associatedPassURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassTypeIdentifier, CFSTR("associatedPassTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassSerialNumber, CFSTR("associatedPassSerialNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountSummary, CFSTR("accountSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rates, CFSTR("rates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentPlans, CFSTR("installmentPlans"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rewardsDestination, CFSTR("rewardsDestination"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *lastUpdatedDate;
  NSDate *v6;
  NSDate *createdDate;
  NSDate *v8;
  NSDate *mergeDate;
  NSDate *v10;
  NSString *countryCode;
  NSString *v12;
  NSString *currencyCode;
  NSString *v14;
  NSTimeZone *productTimeZone;
  NSTimeZone *v16;
  NSURL *termsURL;
  NSURL *v18;
  NSString *termsIdentifier;
  NSString *v20;
  NSURL *associatedPassURL;
  NSURL *v22;
  NSString *associatedPassTypeIdentifier;
  NSString *v24;
  NSString *associatedPassSerialNumber;
  NSString *v26;
  PKCreditAccountSummary *accountSummary;
  PKCreditAccountSummary *v28;
  PKCreditAccountRates *rates;
  PKCreditAccountRates *v30;
  NSSet *virtualCards;
  NSSet *v32;
  NSSet *installmentPlans;
  NSSet *v34;
  char v35;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_78;
  lastUpdatedDate = self->_lastUpdatedDate;
  v6 = (NSDate *)v4[2];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_78;
  }
  createdDate = self->_createdDate;
  v8 = (NSDate *)v4[3];
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (createdDate != v8)
  {
    goto LABEL_78;
  }
  mergeDate = self->_mergeDate;
  v10 = (NSDate *)v4[4];
  if (mergeDate && v10)
  {
    if ((-[NSDate isEqual:](mergeDate, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (mergeDate != v10)
  {
    goto LABEL_78;
  }
  countryCode = self->_countryCode;
  v12 = (NSString *)v4[5];
  if (countryCode && v12)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (countryCode != v12)
  {
    goto LABEL_78;
  }
  currencyCode = self->_currencyCode;
  v14 = (NSString *)v4[6];
  if (currencyCode && v14)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (currencyCode != v14)
  {
    goto LABEL_78;
  }
  productTimeZone = self->_productTimeZone;
  v16 = (NSTimeZone *)v4[7];
  if (productTimeZone && v16)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (productTimeZone != v16)
  {
    goto LABEL_78;
  }
  termsURL = self->_termsURL;
  v18 = (NSURL *)v4[11];
  if (termsURL && v18)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (termsURL != v18)
  {
    goto LABEL_78;
  }
  termsIdentifier = self->_termsIdentifier;
  v20 = (NSString *)v4[10];
  if (termsIdentifier && v20)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (termsIdentifier != v20)
  {
    goto LABEL_78;
  }
  associatedPassURL = self->_associatedPassURL;
  v22 = (NSURL *)v4[12];
  if (associatedPassURL && v22)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (associatedPassURL != v22)
  {
    goto LABEL_78;
  }
  associatedPassTypeIdentifier = self->_associatedPassTypeIdentifier;
  v24 = (NSString *)v4[13];
  if (associatedPassTypeIdentifier && v24)
  {
    if ((-[NSString isEqual:](associatedPassTypeIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (associatedPassTypeIdentifier != v24)
  {
    goto LABEL_78;
  }
  associatedPassSerialNumber = self->_associatedPassSerialNumber;
  v26 = (NSString *)v4[14];
  if (associatedPassSerialNumber && v26)
  {
    if ((-[NSString isEqual:](associatedPassSerialNumber, "isEqual:") & 1) == 0)
      goto LABEL_78;
  }
  else if (associatedPassSerialNumber != v26)
  {
    goto LABEL_78;
  }
  accountSummary = self->_accountSummary;
  v28 = (PKCreditAccountSummary *)v4[16];
  if (accountSummary && v28)
  {
    if (!-[PKCreditAccountSummary isEqual:](accountSummary, "isEqual:"))
      goto LABEL_78;
  }
  else if (accountSummary != v28)
  {
    goto LABEL_78;
  }
  rates = self->_rates;
  v30 = (PKCreditAccountRates *)v4[17];
  if (rates && v30)
  {
    if (!-[PKCreditAccountRates isEqual:](rates, "isEqual:"))
      goto LABEL_78;
  }
  else if (rates != v30)
  {
    goto LABEL_78;
  }
  virtualCards = self->_virtualCards;
  v32 = (NSSet *)v4[9];
  if (!virtualCards || !v32)
  {
    if (virtualCards == v32)
      goto LABEL_72;
LABEL_78:
    v35 = 0;
    goto LABEL_79;
  }
  if ((-[NSSet isEqual:](virtualCards, "isEqual:") & 1) == 0)
    goto LABEL_78;
LABEL_72:
  if (self->_termsAcceptanceRequired != *((unsigned __int8 *)v4 + 8)
    || self->_cardType != v4[15]
    || self->_rewardsDestination != v4[19])
  {
    goto LABEL_78;
  }
  installmentPlans = self->_installmentPlans;
  v34 = (NSSet *)v4[18];
  if (installmentPlans && v34)
    v35 = -[NSSet isEqual:](installmentPlans, "isEqual:");
  else
    v35 = installmentPlans == v34;
LABEL_79:

  return v35;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_mergeDate);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_productTimeZone);
  objc_msgSend(v3, "safelyAddObject:", self->_termsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassURL);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassSerialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_accountSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_rates);
  objc_msgSend(v3, "safelyAddObject:", self->_virtualCards);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentPlans);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardType - v4 + 32 * v4;
  v6 = self->_termsAcceptanceRequired - v5 + 32 * v5;
  v7 = self->_rewardsDestination - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *mergeDate;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_lastUpdatedDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdateDate: '%@'; "), v4);

  -[NSDate description](self->_createdDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), v5);

  mergeDate = self->_mergeDate;
  if (mergeDate)
  {
    -[NSDate description](mergeDate, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("mergeDate: '%@'; "), v7);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSTimeZone name](self->_productTimeZone, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productTimeZone: '%@'; "), v8);

  -[NSSet description](self->_virtualCards, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("virtualCards: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR("termsURL: '%@'; "), self->_termsURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
  if (self->_termsAcceptanceRequired)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("termsAcceptanceRequired: '%@'; "), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("passURL: '%@'; "), self->_associatedPassURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("passSerialNumber: '%@'; "), self->_associatedPassSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("passTypeIdentifier: '%@'; "), self->_associatedPassTypeIdentifier);
  PKPaymentNetworkNameForPaymentCredentialType(self->_cardType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cardType: '%@'; "), v11);

  -[PKCreditAccountSummary description](self->_accountSummary, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("summary: '%@'; "), v12);

  -[PKCreditAccountRates description](self->_rates, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rates: '%@'; "), v13);

  -[NSSet description](self->_installmentPlans, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentPlans: '%@'; "), v14);

  PKAccountRewardRedemptionTypeToString(self->_rewardsDestination);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsDestination: '%@'; "), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSDate *mergeDate;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSTimeZone *productTimeZone;
  id v18;
  NSSet *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *virtualCards;
  uint64_t v27;
  NSURL *termsURL;
  uint64_t v29;
  NSString *termsIdentifier;
  uint64_t v31;
  NSURL *associatedPassURL;
  uint64_t v33;
  NSString *associatedPassSerialNumber;
  uint64_t v35;
  NSString *associatedPassTypeIdentifier;
  PKCreditAccountSummary *v37;
  PKCreditAccountSummary *accountSummary;
  PKCreditAccountRates *v39;
  PKCreditAccountRates *rates;
  id v41;
  NSSet *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSSet *installmentPlans;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = -[PKCreditAccountDetails init](+[PKCreditAccountDetails allocWithZone:](PKCreditAccountDetails, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_createdDate, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v10 = -[NSDate copyWithZone:](self->_mergeDate, "copyWithZone:", a3);
  mergeDate = v5->_mergeDate;
  v5->_mergeDate = (NSDate *)v10;

  v12 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v14;

  v16 = -[NSTimeZone copyWithZone:](self->_productTimeZone, "copyWithZone:", a3);
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v16;

  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = self->_virtualCards;
  v20 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v56;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v56 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v23), "copy");
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v18);
  v25 = objc_claimAutoreleasedReturnValue();
  virtualCards = v5->_virtualCards;
  v5->_virtualCards = (NSSet *)v25;

  v27 = -[NSURL copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v27;

  v29 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v29;

  v5->_termsAcceptanceRequired = self->_termsAcceptanceRequired;
  v31 = -[NSURL copyWithZone:](self->_associatedPassURL, "copyWithZone:", a3);
  associatedPassURL = v5->_associatedPassURL;
  v5->_associatedPassURL = (NSURL *)v31;

  v33 = -[NSString copyWithZone:](self->_associatedPassSerialNumber, "copyWithZone:", a3);
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v33;

  v35 = -[NSString copyWithZone:](self->_associatedPassTypeIdentifier, "copyWithZone:", a3);
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v35;

  v5->_cardType = self->_cardType;
  v37 = -[PKCreditAccountSummary copyWithZone:](self->_accountSummary, "copyWithZone:", a3);
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v37;

  v39 = -[PKCreditAccountRates copyWithZone:](self->_rates, "copyWithZone:", a3);
  rates = v5->_rates;
  v5->_rates = v39;

  v41 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v42 = self->_installmentPlans;
  v43 = -[NSSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v52;
    do
    {
      v46 = 0;
      do
      {
        if (*(_QWORD *)v52 != v45)
          objc_enumerationMutation(v42);
        v47 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v46), "copy", (_QWORD)v51);
        objc_msgSend(v41, "addObject:", v47);

        ++v46;
      }
      while (v44 != v46);
      v44 = -[NSSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v44);
  }

  if (objc_msgSend(v41, "count"))
  {
    v48 = objc_msgSend(v41, "copy");
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSSet *)v48;
  }
  else
  {
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = 0;
  }

  v5->_rewardsDestination = self->_rewardsDestination;
  return v5;
}

- (PKCurrencyAmount)cardBalance
{
  NSDecimalNumber *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;

  if (self->_currencyCode)
  {
    -[PKCreditAccountSummary adjustedBalance](self->_accountSummary, "adjustedBalance");
    v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountSummary balanceSummary](self->_accountSummary, "balanceSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pendingPurchases");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {
      if (v3)
      {
        PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        return (PKCurrencyAmount *)v7;
      }
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSDecimalNumber decimalNumberByAdding:](v3, "decimalNumberByAdding:", v5);
      v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    PKCurrencyAmountCreate(v8, self->_currencyCode, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v7 = 0;
  return (PKCurrencyAmount *)v7;
}

- (PKCurrencyAmount)totalBalance
{
  NSDecimalNumber *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSDecimalNumber *v8;
  NSDecimalNumber *v9;

  if (self->_currencyCode)
  {
    -[PKCreditAccountSummary currentBalance](self->_accountSummary, "currentBalance");
    v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountSummary balanceSummary](self->_accountSummary, "balanceSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pendingPurchases");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (v6)
    {
      if (v3)
      {
        PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

        return (PKCurrencyAmount *)v7;
      }
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSDecimalNumber decimalNumberByAdding:](v3, "decimalNumberByAdding:", v5);
      v8 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    PKCurrencyAmountCreate(v8, self->_currencyCode, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v7 = 0;
  return (PKCurrencyAmount *)v7;
}

- (int64_t)numberOfActiveInstallments
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_installmentPlans;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "state", (_QWORD)v9) == 2)
          ++v5;
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)numberOfActiveStatementedInstallments
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_installmentPlans;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "state", (_QWORD)v15);
        objc_msgSend(v8, "payments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "statementIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == 2 && v12 != 0)
          ++v5;
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isInMonthOfMerge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  if (!self->_mergeDate)
    return 0;
  -[PKCreditAccountSummary balanceSummary](self->_accountSummary, "balanceSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "openingDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "closingDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    v9 = !v8 && PKDateIsBetweenDates(self->_mergeDate, v5, v6, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)mergeDate
{
  return self->_mergeDate;
}

- (void)setMergeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZone, a3);
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (NSSet)virtualCards
{
  return self->_virtualCards;
}

- (void)setVirtualCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)associatedPassURL
{
  return self->_associatedPassURL;
}

- (void)setAssociatedPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)associatedPassTypeIdentifier
{
  return self->_associatedPassTypeIdentifier;
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)associatedPassSerialNumber
{
  return self->_associatedPassSerialNumber;
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (PKCreditAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
  objc_storeStrong((id *)&self->_accountSummary, a3);
}

- (PKCreditAccountRates)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
  objc_storeStrong((id *)&self->_rates, a3);
}

- (NSSet)installmentPlans
{
  return self->_installmentPlans;
}

- (void)setInstallmentPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)rewardsDestination
{
  return self->_rewardsDestination;
}

- (void)setRewardsDestination:(unint64_t)a3
{
  self->_rewardsDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_rates, 0);
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualCards, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_mergeDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end
