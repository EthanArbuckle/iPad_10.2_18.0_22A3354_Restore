@implementation PKSpendingSummary

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSpendingSummary)initWithCoder:(id)a3
{
  id v4;
  PKSpendingSummary *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  PKCurrencyAmount *totalSpending;
  uint64_t v12;
  PKCurrencyAmount *previousTotalSpending;
  uint64_t v14;
  PKCurrencyAmount *previousMaxAmount;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *orderedSpendingCategories;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *orderedSpendingPerMerchants;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  PKSpendingInsightTrendCollection *insights;
  uint64_t v31;
  PKPaymentTransactionGroup *rewards;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *spendingsPerCalendarUnit;
  uint64_t v38;
  PKPaymentTransactionGroup *interest;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKSpendingSummary;
  v5 = -[PKSpendingSummary init](&v41, sel_init);
  if (v5)
  {
    v5->_summaryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summaryType"));
    v5->_summaryUnit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summaryUnit"));
    v5->_isLoading = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLoading"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalSpending"));
    v10 = objc_claimAutoreleasedReturnValue();
    totalSpending = v5->_totalSpending;
    v5->_totalSpending = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousTotalSpending"));
    v12 = objc_claimAutoreleasedReturnValue();
    previousTotalSpending = v5->_previousTotalSpending;
    v5->_previousTotalSpending = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousMaxAmount"));
    v14 = objc_claimAutoreleasedReturnValue();
    previousMaxAmount = v5->_previousMaxAmount;
    v5->_previousMaxAmount = (PKCurrencyAmount *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("orderedSpendingCategories"));
    v19 = objc_claimAutoreleasedReturnValue();
    orderedSpendingCategories = v5->_orderedSpendingCategories;
    v5->_orderedSpendingCategories = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("orderedSpendingPerMerchants"));
    v24 = objc_claimAutoreleasedReturnValue();
    orderedSpendingPerMerchants = v5->_orderedSpendingPerMerchants;
    v5->_orderedSpendingPerMerchants = (NSArray *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("insights"));
    v29 = objc_claimAutoreleasedReturnValue();
    insights = v5->_insights;
    v5->_insights = (PKSpendingInsightTrendCollection *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewards"));
    v31 = objc_claimAutoreleasedReturnValue();
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionGroup *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("spendingsPerCalendarUnit"));
    v36 = objc_claimAutoreleasedReturnValue();
    spendingsPerCalendarUnit = v5->_spendingsPerCalendarUnit;
    v5->_spendingsPerCalendarUnit = (NSArray *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestCharged"));
    v38 = objc_claimAutoreleasedReturnValue();
    interest = v5->_interest;
    v5->_interest = (PKPaymentTransactionGroup *)v38;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t summaryType;
  id v5;

  summaryType = self->_summaryType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", summaryType, CFSTR("summaryType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_summaryUnit, CFSTR("summaryUnit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLoading, CFSTR("isLoading"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalSpending, CFSTR("totalSpending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousTotalSpending, CFSTR("previousTotalSpending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousMaxAmount, CFSTR("previousMaxAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderedSpendingCategories, CFSTR("orderedSpendingCategories"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orderedSpendingPerMerchants, CFSTR("orderedSpendingPerMerchants"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_insights, CFSTR("insights"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewards, CFSTR("rewards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spendingsPerCalendarUnit, CFSTR("spendingsPerCalendarUnit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interest, CFSTR("interestCharged"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  NSDate *endDate;
  NSDate *v8;
  PKCurrencyAmount *totalSpending;
  PKCurrencyAmount *v10;
  PKPaymentTransactionGroup *rewards;
  PKPaymentTransactionGroup *v12;
  PKCurrencyAmount *v13;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *previousMaxAmount;
  PKCurrencyAmount *v16;
  PKPaymentTransactionGroup *interest;
  PKPaymentTransactionGroup *v18;
  PKSpendingInsightTrendCollection *insights;
  PKSpendingInsightTrendCollection *v20;
  BOOL v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_44;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[4];
  if (startDate && v6)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
      goto LABEL_44;
  }
  else if (startDate != v6)
  {
    goto LABEL_44;
  }
  endDate = self->_endDate;
  v8 = (NSDate *)v4[5];
  if (endDate && v8)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0)
      goto LABEL_44;
  }
  else if (endDate != v8)
  {
    goto LABEL_44;
  }
  totalSpending = self->_totalSpending;
  v10 = (PKCurrencyAmount *)v4[6];
  if (totalSpending && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](totalSpending, "isEqual:"))
      goto LABEL_44;
  }
  else if (totalSpending != v10)
  {
    goto LABEL_44;
  }
  rewards = self->_rewards;
  v12 = (PKPaymentTransactionGroup *)v4[12];
  if (rewards && v12)
  {
    if (!-[PKPaymentTransactionGroup isEqual:](rewards, "isEqual:"))
      goto LABEL_44;
  }
  else if (rewards != v12)
  {
    goto LABEL_44;
  }
  v13 = self->_totalSpending;
  v14 = (PKCurrencyAmount *)v4[6];
  if (v13 && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](v13, "isEqual:"))
      goto LABEL_44;
  }
  else if (v13 != v14)
  {
    goto LABEL_44;
  }
  previousMaxAmount = self->_previousMaxAmount;
  v16 = (PKCurrencyAmount *)v4[11];
  if (previousMaxAmount && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](previousMaxAmount, "isEqual:"))
      goto LABEL_44;
  }
  else if (previousMaxAmount != v16)
  {
    goto LABEL_44;
  }
  interest = self->_interest;
  v18 = (PKPaymentTransactionGroup *)v4[13];
  if (interest && v18)
  {
    if (!-[PKPaymentTransactionGroup isEqual:](interest, "isEqual:"))
      goto LABEL_44;
  }
  else if (interest != v18)
  {
    goto LABEL_44;
  }
  insights = self->_insights;
  v20 = (PKSpendingInsightTrendCollection *)v4[9];
  if (!insights || !v20)
  {
    if (insights == v20)
      goto LABEL_42;
LABEL_44:
    v21 = 0;
    goto LABEL_45;
  }
  if (!-[PKSpendingInsightTrendCollection isEqual:](insights, "isEqual:"))
    goto LABEL_44;
LABEL_42:
  if (self->_isLoading != *((unsigned __int8 *)v4 + 9))
    goto LABEL_44;
  v21 = self->_summaryType == v4[2];
LABEL_45:

  return v21;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endDate);
  objc_msgSend(v3, "safelyAddObject:", self->_totalSpending);
  objc_msgSend(v3, "safelyAddObject:", self->_rewards);
  objc_msgSend(v3, "safelyAddObject:", self->_previousTotalSpending);
  objc_msgSend(v3, "safelyAddObject:", self->_previousMaxAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_interest);
  objc_msgSend(v3, "safelyAddObject:", self->_insights);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_isLoading - v4 + 32 * v4;
  v6 = self->_summaryType - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_startDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startDate: '%@'; "), v4);

  -[NSDate description](self->_endDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("totalSpending: '%@'; "), self->_totalSpending);
  objc_msgSend(v3, "appendFormat:", CFSTR("previousTotalSpending: '%@'; "), self->_previousTotalSpending);
  objc_msgSend(v3, "appendFormat:", CFSTR("previousMaxAmount: '%@'; "), self->_previousMaxAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%lu'; "), self->_summaryType);
  objc_msgSend(v3, "appendFormat:", CFSTR("unit: '%lu'; "), self->_summaryUnit);
  objc_msgSend(v3, "appendFormat:", CFSTR("categories: '%@'; "), self->_orderedSpendingCategories);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchants: '%@'; "), self->_orderedSpendingPerMerchants);
  objc_msgSend(v3, "appendFormat:", CFSTR("insights: '%@'; "), self->_insights);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (BOOL)isCurrentPeriod
{
  NSDate *endDate;
  void *v3;

  endDate = self->_endDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(endDate) = -[NSDate compare:](endDate, "compare:", v3) == NSOrderedDescending;

  return (char)endDate;
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (void)setSummaryType:(unint64_t)a3
{
  self->_summaryType = a3;
}

- (BOOL)isFamilySummary
{
  return self->_isFamilySummary;
}

- (void)setIsFamilySummary:(BOOL)a3
{
  self->_isFamilySummary = a3;
}

- (unint64_t)summaryUnit
{
  return self->_summaryUnit;
}

- (void)setSummaryUnit:(unint64_t)a3
{
  self->_summaryUnit = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (void)setTotalSpending:(id)a3
{
  objc_storeStrong((id *)&self->_totalSpending, a3);
}

- (NSArray)orderedSpendingCategories
{
  return self->_orderedSpendingCategories;
}

- (void)setOrderedSpendingCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)orderedSpendingPerMerchants
{
  return self->_orderedSpendingPerMerchants;
}

- (void)setOrderedSpendingPerMerchants:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PKSpendingInsightTrendCollection)insights
{
  return self->_insights;
}

- (void)setInsights:(id)a3
{
  objc_storeStrong((id *)&self->_insights, a3);
}

- (PKCurrencyAmount)previousTotalSpending
{
  return self->_previousTotalSpending;
}

- (void)setPreviousTotalSpending:(id)a3
{
  objc_storeStrong((id *)&self->_previousTotalSpending, a3);
}

- (PKCurrencyAmount)previousMaxAmount
{
  return self->_previousMaxAmount;
}

- (void)setPreviousMaxAmount:(id)a3
{
  objc_storeStrong((id *)&self->_previousMaxAmount, a3);
}

- (PKPaymentTransactionGroup)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
  objc_storeStrong((id *)&self->_rewards, a3);
}

- (PKPaymentTransactionGroup)interest
{
  return self->_interest;
}

- (void)setInterest:(id)a3
{
  objc_storeStrong((id *)&self->_interest, a3);
}

- (PKPaymentTransactionGroup)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_storeStrong((id *)&self->_payments, a3);
}

- (PKPaymentTransactionGroup)refunds
{
  return self->_refunds;
}

- (void)setRefunds:(id)a3
{
  objc_storeStrong((id *)&self->_refunds, a3);
}

- (PKPaymentTransactionGroup)adjustments
{
  return self->_adjustments;
}

- (void)setAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->_adjustments, a3);
}

- (NSDictionary)spendingsPerAltDSID
{
  return self->_spendingsPerAltDSID;
}

- (void)setSpendingsPerAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)spendingsPerCalendarUnit
{
  return self->_spendingsPerCalendarUnit;
}

- (void)setSpendingsPerCalendarUnit:(id)a3
{
  objc_storeStrong((id *)&self->_spendingsPerCalendarUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spendingsPerCalendarUnit, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_spendingsPerAltDSID, 0);
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_refunds, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_interest, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_previousMaxAmount, 0);
  objc_storeStrong((id *)&self->_previousTotalSpending, 0);
  objc_storeStrong((id *)&self->_insights, 0);
  objc_storeStrong((id *)&self->_orderedSpendingPerMerchants, 0);
  objc_storeStrong((id *)&self->_orderedSpendingCategories, 0);
  objc_storeStrong((id *)&self->_totalSpending, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
