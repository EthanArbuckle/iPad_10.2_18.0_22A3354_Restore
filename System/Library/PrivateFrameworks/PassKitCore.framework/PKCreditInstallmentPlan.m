@implementation PKCreditInstallmentPlan

- (PKCreditInstallmentPlan)initWithDictionary:(id)a3
{
  id v4;
  PKCreditInstallmentPlan *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDate *lastUpdated;
  uint64_t v11;
  NSDecimalNumber *apr;
  uint64_t v13;
  NSString *currencyCode;
  uint64_t v15;
  NSDecimalNumber *totalAmount;
  uint64_t v17;
  NSDecimalNumber *totalProductAmount;
  uint64_t v19;
  NSDecimalNumber *totalInterestAmount;
  __CFString *v21;
  __CFString *v22;
  int v23;
  _BOOL8 v24;
  uint64_t v25;
  NSString *transactionReferenceIdentifier;
  uint64_t v27;
  NSString *accountUserAltDSID;
  void *v29;
  PKInstallmentPlanSummary *v30;
  PKInstallmentPlanSummary *summary;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *lineItems;
  void *v36;
  PKCreditInstallmentPlanProduct *v37;
  PKCreditInstallmentPlanProduct *product;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *payments;
  void *v43;
  PKInstallmentPlanMerchant *v44;
  PKInstallmentPlanMerchant *merchant;
  void *v46;
  void *v47;
  void *v48;
  PKPaymentTransactionRewards *v49;
  PKPaymentTransactionRewards *rewards;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PKCreditInstallmentPlan;
  v5 = -[PKCreditInstallmentPlan init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = PKInstallmentPlanStateFromString(v8);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdated"));
    v9 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v9;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("apr"));
    v11 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v11;

    v5->_duration = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("duration"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v13 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v13;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalAmount"));
    v15 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v15;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalProduct"));
    v17 = objc_claimAutoreleasedReturnValue();
    totalProductAmount = v5->_totalProductAmount;
    v5->_totalProductAmount = (NSDecimalNumber *)v17;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalInterest"));
    v19 = objc_claimAutoreleasedReturnValue();
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (NSDecimalNumber *)v19;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("periodType"));
    v21 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v24 = 1;
    if (v21 != CFSTR("monthly"))
    {
      if (!v21
        || (v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("monthly")), v22, !v23))
      {
        v24 = 0;
      }
    }

    v5->_periodType = v24;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("transactionReferenceIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    transactionReferenceIdentifier = v5->_transactionReferenceIdentifier;
    v5->_transactionReferenceIdentifier = (NSString *)v25;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserAltDSID"));
    v27 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v27;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("summary"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = -[PKInstallmentPlanSummary initWithDictionary:]([PKInstallmentPlanSummary alloc], "initWithDictionary:", v29);
      summary = v5->_summary;
      v5->_summary = v30;

    }
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("lineItems"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      objc_msgSend(v32, "pk_arrayByApplyingBlock:", &__block_literal_global_177);
      v34 = objc_claimAutoreleasedReturnValue();
      lineItems = v5->_lineItems;
      v5->_lineItems = (NSArray *)v34;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("product"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = -[PKCreditInstallmentPlanProduct initWithDictionary:]([PKCreditInstallmentPlanProduct alloc], "initWithDictionary:", v36);
      product = v5->_product;
      v5->_product = v37;

    }
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("payments"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "pk_arrayByApplyingBlock:", &__block_literal_global_58_1);
      v41 = objc_claimAutoreleasedReturnValue();
      payments = v5->_payments;
      v5->_payments = (NSArray *)v41;

    }
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("merchant"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v44 = -[PKInstallmentPlanMerchant initWithDictionary:]([PKInstallmentPlanMerchant alloc], "initWithDictionary:", v43);
      merchant = v5->_merchant;
      v5->_merchant = v44;

    }
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("rewards"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      objc_msgSend(v46, "pk_arrayByApplyingBlock:", &__block_literal_global_62_1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[PKPaymentTransactionRewards initWithRewardsItems:]([PKPaymentTransactionRewards alloc], "initWithRewardsItems:", v48);
      rewards = v5->_rewards;
      v5->_rewards = v49;

    }
    v5->_userViewedIntroduction = objc_msgSend(v4, "PKBoolForKey:", CFSTR("userViewedIntroduction"));

  }
  return v5;
}

PKCreditInstallmentPlanLineItem *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCreditInstallmentPlanLineItem *v3;

  v2 = a2;
  v3 = -[PKCreditInstallmentPlanLineItem initWithDictionary:]([PKCreditInstallmentPlanLineItem alloc], "initWithDictionary:", v2);

  return v3;
}

PKCreditInstallmentPlanPayment *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKCreditInstallmentPlanPayment *v3;

  v2 = a2;
  v3 = -[PKCreditInstallmentPlanPayment initWithDictionary:]([PKCreditInstallmentPlanPayment alloc], "initWithDictionary:", v2);

  return v3;
}

PKPaymentTransactionRewardsItem *__46__PKCreditInstallmentPlan_initWithDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  PKPaymentTransactionRewardsItem *v3;

  v2 = a2;
  v3 = -[PKPaymentTransactionRewardsItem initWithDictionary:]([PKPaymentTransactionRewardsItem alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSDecimalNumber)remainingAmount
{
  NSDecimalNumber *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;

  v3 = self->_totalAmount;
  -[PKInstallmentPlanSummary paymentsToDateAmount](self->_summary, "paymentsToDateAmount");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    -[NSDecimalNumber decimalNumberBySubtracting:](v3, "decimalNumberBySubtracting:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (NSDecimalNumber *)v7;
  }

  return v3;
}

- (NSDecimalNumber)totalBilled
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_payments;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "originalAmountDue", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 || (objc_msgSend(v9, "amountDue"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v9, "statementIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v3, "decimalNumberByAdding:", v10);
            v12 = objc_claimAutoreleasedReturnValue();

            v3 = (void *)v12;
          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDecimalNumber *)v3;
}

- (PKCreditInstallmentPlanPayment)nextPaymentDue
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSArray reverseObjectEnumerator](self->_payments, "reverseObjectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(v9, "statementIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v5 = v8;
          goto LABEL_12;
        }
        v5 = v9;

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_12:

  return (PKCreditInstallmentPlanPayment *)v5;
}

- (BOOL)isComplete
{
  unint64_t state;
  BOOL v3;
  unint64_t v4;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;

  state = self->_state;
  v3 = state >= 3;
  v4 = state - 3;
  if (v3)
    return v4 < 2;
  -[PKInstallmentPlanSummary paymentsToDateAmount](self->_summary, "paymentsToDateAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  v9 = -[NSDecimalNumber compare:](self->_totalAmount, "compare:", v10) != NSOrderedDescending;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditInstallmentPlan *v4;
  PKCreditInstallmentPlan *v5;
  BOOL v6;

  v4 = (PKCreditInstallmentPlan *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditInstallmentPlan isEqualToInstallmentPlan:](self, "isEqualToInstallmentPlan:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlan:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDate *lastUpdated;
  NSDate *v12;
  NSDecimalNumber *apr;
  NSDecimalNumber *v14;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  NSDecimalNumber *totalAmount;
  NSDecimalNumber *v19;
  NSDecimalNumber *totalProductAmount;
  NSDecimalNumber *v21;
  NSDecimalNumber *totalInterestAmount;
  NSDecimalNumber *v23;
  PKInstallmentPlanSummary *summary;
  PKInstallmentPlanSummary *v25;
  NSArray *lineItems;
  NSArray *v27;
  PKCreditInstallmentPlanProduct *product;
  PKCreditInstallmentPlanProduct *v29;
  NSArray *payments;
  NSArray *v31;
  PKInstallmentPlanMerchant *merchant;
  PKInstallmentPlanMerchant *v33;
  PKPaymentTransactionRewards *rewards;
  PKPaymentTransactionRewards *v35;
  void *v36;
  NSString *v37;
  _BOOL4 v38;
  void *v39;
  NSString *v40;
  _BOOL4 v41;
  BOOL v42;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_84;
  v6 = (void *)*((_QWORD *)v4 + 2);
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_83;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_84;
  }
  if (self->_state != *((_QWORD *)v5 + 3))
    goto LABEL_84;
  lastUpdated = self->_lastUpdated;
  v12 = (NSDate *)*((_QWORD *)v5 + 4);
  if (lastUpdated && v12)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (lastUpdated != v12)
  {
    goto LABEL_84;
  }
  apr = self->_apr;
  v14 = (NSDecimalNumber *)*((_QWORD *)v5 + 5);
  if (apr && v14)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (apr != v14)
  {
    goto LABEL_84;
  }
  if (self->_duration != *((_QWORD *)v5 + 6))
    goto LABEL_84;
  v15 = (void *)*((_QWORD *)v5 + 7);
  v7 = self->_currencyCode;
  v16 = v15;
  if (v7 == v16)
  {

  }
  else
  {
    v9 = v16;
    if (!v7 || !v16)
      goto LABEL_83;
    v17 = -[NSString isEqualToString:](v7, "isEqualToString:", v16);

    if (!v17)
      goto LABEL_84;
  }
  totalAmount = self->_totalAmount;
  v19 = (NSDecimalNumber *)*((_QWORD *)v5 + 8);
  if (totalAmount && v19)
  {
    if ((-[NSDecimalNumber isEqual:](totalAmount, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (totalAmount != v19)
  {
    goto LABEL_84;
  }
  totalProductAmount = self->_totalProductAmount;
  v21 = (NSDecimalNumber *)*((_QWORD *)v5 + 9);
  if (totalProductAmount && v21)
  {
    if ((-[NSDecimalNumber isEqual:](totalProductAmount, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (totalProductAmount != v21)
  {
    goto LABEL_84;
  }
  totalInterestAmount = self->_totalInterestAmount;
  v23 = (NSDecimalNumber *)*((_QWORD *)v5 + 10);
  if (totalInterestAmount && v23)
  {
    if ((-[NSDecimalNumber isEqual:](totalInterestAmount, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (totalInterestAmount != v23)
  {
    goto LABEL_84;
  }
  if (self->_periodType != *((_QWORD *)v5 + 11))
    goto LABEL_84;
  summary = self->_summary;
  v25 = (PKInstallmentPlanSummary *)*((_QWORD *)v5 + 14);
  if (summary && v25)
  {
    if (!-[PKInstallmentPlanSummary isEqual:](summary, "isEqual:"))
      goto LABEL_84;
  }
  else if (summary != v25)
  {
    goto LABEL_84;
  }
  lineItems = self->_lineItems;
  v27 = (NSArray *)*((_QWORD *)v5 + 17);
  if (lineItems && v27)
  {
    if ((-[NSArray isEqual:](lineItems, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (lineItems != v27)
  {
    goto LABEL_84;
  }
  product = self->_product;
  v29 = (PKCreditInstallmentPlanProduct *)*((_QWORD *)v5 + 16);
  if (product && v29)
  {
    if (!-[PKCreditInstallmentPlanProduct isEqual:](product, "isEqual:"))
      goto LABEL_84;
  }
  else if (product != v29)
  {
    goto LABEL_84;
  }
  payments = self->_payments;
  v31 = (NSArray *)*((_QWORD *)v5 + 18);
  if (payments && v31)
  {
    if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0)
      goto LABEL_84;
  }
  else if (payments != v31)
  {
    goto LABEL_84;
  }
  merchant = self->_merchant;
  v33 = (PKInstallmentPlanMerchant *)*((_QWORD *)v5 + 15);
  if (merchant && v33)
  {
    if (!-[PKInstallmentPlanMerchant isEqual:](merchant, "isEqual:"))
      goto LABEL_84;
  }
  else if (merchant != v33)
  {
    goto LABEL_84;
  }
  rewards = self->_rewards;
  v35 = (PKPaymentTransactionRewards *)*((_QWORD *)v5 + 19);
  if (rewards && v35)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:"))
      goto LABEL_84;
  }
  else if (rewards != v35)
  {
    goto LABEL_84;
  }
  v36 = (void *)*((_QWORD *)v5 + 12);
  v7 = self->_transactionReferenceIdentifier;
  v37 = v36;
  if (v7 == v37)
  {

    goto LABEL_78;
  }
  v9 = v37;
  if (!v7 || !v37)
  {
LABEL_83:

    goto LABEL_84;
  }
  v38 = -[NSString isEqualToString:](v7, "isEqualToString:", v37);

  if (!v38)
    goto LABEL_84;
LABEL_78:
  v39 = (void *)*((_QWORD *)v5 + 13);
  v7 = self->_accountUserAltDSID;
  v40 = v39;
  if (v7 == v40)
  {

LABEL_87:
    v42 = self->_userViewedIntroduction == v5[8];
    goto LABEL_85;
  }
  v9 = v40;
  if (!v7 || !v40)
    goto LABEL_83;
  v41 = -[NSString isEqualToString:](v7, "isEqualToString:", v40);

  if (v41)
    goto LABEL_87;
LABEL_84:
  v42 = 0;
LABEL_85:

  return v42;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_apr);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalProductAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterestAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_summary);
  objc_msgSend(v3, "safelyAddObject:", self->_lineItems);
  objc_msgSend(v3, "safelyAddObject:", self->_product);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_rewards);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionReferenceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserAltDSID);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_duration - v5 + 32 * v5;
  v7 = self->_periodType - v6 + 32 * v6;
  v8 = self->_userViewedIntroduction - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%ld'; "), self->_state);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  objc_msgSend(v3, "appendFormat:", CFSTR("apr: '%@'; "), self->_apr);
  objc_msgSend(v3, "appendFormat:", CFSTR("duration: '%lu'; "), self->_duration);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: '%@'; "), self->_totalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalProductAmount: '%@'; "), self->_totalProductAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterestAmount: '%@'; "), self->_totalInterestAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("periodType: '%ld'; "), self->_periodType);
  -[PKInstallmentPlanSummary description](self->_summary, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("summary: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("lineItems: '%@'; "), self->_lineItems);
  -[PKCreditInstallmentPlanProduct description](self->_product, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("product: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), self->_payments);
  -[PKInstallmentPlanMerchant description](self->_merchant, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchant: '%@'; "), v6);

  -[PKPaymentTransactionRewards description](self->_rewards, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewards: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("transactionReferenceIdentifier: '%@'; "),
    self->_transactionReferenceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlan)initWithCoder:(id)a3
{
  id v4;
  PKCreditInstallmentPlan *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *lastUpdated;
  uint64_t v10;
  NSDecimalNumber *apr;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSDecimalNumber *totalAmount;
  uint64_t v16;
  NSDecimalNumber *totalProductAmount;
  uint64_t v18;
  NSDecimalNumber *totalInterestAmount;
  uint64_t v20;
  PKInstallmentPlanSummary *summary;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *lineItems;
  uint64_t v27;
  PKCreditInstallmentPlanProduct *product;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSArray *payments;
  uint64_t v34;
  PKInstallmentPlanMerchant *merchant;
  uint64_t v36;
  PKPaymentTransactionRewards *rewards;
  uint64_t v38;
  NSString *transactionReferenceIdentifier;
  uint64_t v40;
  NSString *accountUserAltDSID;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKCreditInstallmentPlan;
  v5 = -[PKCreditInstallmentPlan init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apr"));
    v10 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v10;

    v5->_duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("duration"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalProduct"));
    v16 = objc_claimAutoreleasedReturnValue();
    totalProductAmount = v5->_totalProductAmount;
    v5->_totalProductAmount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterest"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalInterestAmount = v5->_totalInterestAmount;
    v5->_totalInterestAmount = (NSDecimalNumber *)v18;

    v5->_periodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("periodType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summary"));
    v20 = objc_claimAutoreleasedReturnValue();
    summary = v5->_summary;
    v5->_summary = (PKInstallmentPlanSummary *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("lineItems"));
    v25 = objc_claimAutoreleasedReturnValue();
    lineItems = v5->_lineItems;
    v5->_lineItems = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product"));
    v27 = objc_claimAutoreleasedReturnValue();
    product = v5->_product;
    v5->_product = (PKCreditInstallmentPlanProduct *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("payments"));
    v32 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSArray *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchant"));
    v34 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKInstallmentPlanMerchant *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewards"));
    v36 = objc_claimAutoreleasedReturnValue();
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionReferenceIdentifier"));
    v38 = objc_claimAutoreleasedReturnValue();
    transactionReferenceIdentifier = v5->_transactionReferenceIdentifier;
    v5->_transactionReferenceIdentifier = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v40 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v40;

    v5->_userViewedIntroduction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userViewedIntroduction"));
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apr, CFSTR("apr"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalProductAmount, CFSTR("totalProduct"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalInterestAmount, CFSTR("totalInterest"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_periodType, CFSTR("periodType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summary, CFSTR("summary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lineItems, CFSTR("lineItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_product, CFSTR("product"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchant, CFSTR("merchant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewards, CFSTR("rewards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionReferenceIdentifier, CFSTR("transactionReferenceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userViewedIntroduction, CFSTR("userViewedIntroduction"));

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = self->_state;
  v8 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_apr, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_QWORD *)(v5 + 48) = self->_duration;
  v12 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_totalAmount, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_totalProductAmount, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_totalInterestAmount, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v18;

  *(_QWORD *)(v5 + 88) = self->_periodType;
  v20 = -[PKInstallmentPlanSummary copyWithZone:](self->_summary, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v20;

  v22 = -[PKPaymentTransactionRewards copyWithZone:](self->_rewards, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v22;

  v24 = -[NSString copyWithZone:](self->_transactionReferenceIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[NSString copyWithZone:](self->_accountUserAltDSID, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v29 = self->_lineItems;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v56;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v56 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v33), "copyWithZone:", a3);
        objc_msgSend(v28, "addObject:", v34);

        ++v33;
      }
      while (v31 != v33);
      v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v31);
  }

  if (objc_msgSend(v28, "count"))
  {
    v35 = objc_msgSend(v28, "copy");
    v36 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v35;

  }
  v37 = -[PKCreditInstallmentPlanProduct copyWithZone:](self->_product, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v37;

  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v40 = self->_payments;
  v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v52;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v52 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v44), "copyWithZone:", a3, (_QWORD)v51);
        objc_msgSend(v39, "addObject:", v45);

        ++v44;
      }
      while (v42 != v44);
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v42);
  }

  if (objc_msgSend(v39, "count"))
  {
    v46 = objc_msgSend(v39, "copy");
    v47 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v46;

  }
  v48 = -[PKInstallmentPlanMerchant copyWithZone:](self->_merchant, "copyWithZone:", a3, (_QWORD)v51);
  v49 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v48;

  *(_BYTE *)(v5 + 8) = self->_userViewedIntroduction;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
  objc_storeStrong((id *)&self->_apr, a3);
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalAmount, a3);
}

- (NSDecimalNumber)totalProductAmount
{
  return self->_totalProductAmount;
}

- (void)setTotalProductAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalProductAmount, a3);
}

- (NSDecimalNumber)totalInterestAmount
{
  return self->_totalInterestAmount;
}

- (void)setTotalInterestAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalInterestAmount, a3);
}

- (int64_t)periodType
{
  return self->_periodType;
}

- (void)setPeriodType:(int64_t)a3
{
  self->_periodType = a3;
}

- (NSString)transactionReferenceIdentifier
{
  return self->_transactionReferenceIdentifier;
}

- (void)setTransactionReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKInstallmentPlanSummary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (PKInstallmentPlanMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (PKCreditInstallmentPlanProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
  objc_storeStrong((id *)&self->_rewards, a3);
}

- (BOOL)userViewedIntroduction
{
  return self->_userViewedIntroduction;
}

- (void)setUserViewedIntroduction:(BOOL)a3
{
  self->_userViewedIntroduction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_transactionReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_totalInterestAmount, 0);
  objc_storeStrong((id *)&self->_totalProductAmount, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
