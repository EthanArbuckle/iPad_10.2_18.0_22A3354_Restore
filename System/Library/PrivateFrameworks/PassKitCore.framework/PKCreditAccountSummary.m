@implementation PKCreditAccountSummary

- (PKCreditAccountSummary)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *creditLimit;
  uint64_t v8;
  NSDecimalNumber *availableCredit;
  uint64_t v10;
  NSDecimalNumber *currentBalance;
  uint64_t v12;
  NSDecimalNumber *adjustedBalance;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *remainingMinimumPayment;
  uint64_t v18;
  NSDecimalNumber *remainingStatementBalance;
  uint64_t v20;
  NSDecimalNumber *remainingStatementBalanceForInterestCalculation;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSDecimalNumber *pastDueAmount;
  uint64_t v27;
  NSDate *lastPaymentDate;
  uint64_t v29;
  NSDate *paymentDueDate;
  uint64_t v31;
  NSDecimalNumber *unpostedInterest;
  uint64_t v33;
  NSDate *unpostedInterestTimestamp;
  uint64_t v35;
  NSDecimalNumber *remainingMinimumPaymentExcludedFromInterestCalculation;
  uint64_t v37;
  NSDecimalNumber *installmentBalance;
  void *v39;
  NSDecimalNumber *v40;
  void *v41;
  uint64_t v42;
  NSDecimalNumber *chargeOffPreventionAmount;
  uint64_t v44;
  NSDecimalNumber *v45;
  PKCreditAccountBalanceSummary *v46;
  void *v47;
  uint64_t v48;
  PKCreditAccountBalanceSummary *balanceSummary;
  PKCreditAccountStatement *v50;
  void *v51;
  uint64_t v52;
  PKCreditAccountStatement *currentStatement;
  void *v54;
  uint64_t v55;
  NSSet *accountUserActivity;
  void *v57;
  PKCreditAccountMergeSummary *v58;
  PKCreditAccountMergeSummary *mergeSummary;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PKCreditAccountSummary;
  v5 = -[PKCreditAccountSummary init](&v61, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("creditLimit"));
    v6 = objc_claimAutoreleasedReturnValue();
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("availableCredit"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableCredit = v5->_availableCredit;
    v5->_availableCredit = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("adjustedBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    adjustedBalance = v5->_adjustedBalance;
    v5->_adjustedBalance = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("remainingMinimumPayment"));
    v16 = objc_claimAutoreleasedReturnValue();
    remainingMinimumPayment = v5->_remainingMinimumPayment;
    v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("remainingStatementBalance"));
    v18 = objc_claimAutoreleasedReturnValue();
    remainingStatementBalance = v5->_remainingStatementBalance;
    v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("remainingStatementBalanceForInterestCalculation"));
    v20 = objc_claimAutoreleasedReturnValue();
    remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
    v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

    v5->_autoPayEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("autopayStatus"));
    v5->_requiresDebtCollectionNotices = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresDebtCollectionNotices"));
    objc_msgSend(v4, "PKStringForKey:", CFSTR("balanceStatus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lowercaseString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("current")) & 1) != 0)
    {
      v24 = 1;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("pastdue")))
    {
      v24 = 2;
    }
    else
    {
      v24 = 0;
    }

    v5->_balanceStatus = v24;
    v5->_cyclesPastDue = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("cyclesPastDue"));
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("pastDueAmount"));
    v25 = objc_claimAutoreleasedReturnValue();
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v25;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastPaymentDate"));
    v27 = objc_claimAutoreleasedReturnValue();
    lastPaymentDate = v5->_lastPaymentDate;
    v5->_lastPaymentDate = (NSDate *)v27;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("paymentDueDate"));
    v29 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v29;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("unpostedInterest"));
    v31 = objc_claimAutoreleasedReturnValue();
    unpostedInterest = v5->_unpostedInterest;
    v5->_unpostedInterest = (NSDecimalNumber *)v31;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("unpostedInterestTimestamp"));
    v33 = objc_claimAutoreleasedReturnValue();
    unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
    v5->_unpostedInterestTimestamp = (NSDate *)v33;

    v5->_inGrace = objc_msgSend(v4, "PKBoolForKey:", CFSTR("inGrace"));
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("remainingMinimumPaymentExcludedFromInterestCalculation"));
    v35 = objc_claimAutoreleasedReturnValue();
    remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
    v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v35;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("installmentBalance"));
    v37 = objc_claimAutoreleasedReturnValue();
    installmentBalance = v5->_installmentBalance;
    v5->_installmentBalance = (NSDecimalNumber *)v37;

    v5->_recoveryPaymentPlansSupported = objc_msgSend(v4, "PKBoolForKey:", CFSTR("recoveryPaymentPlansSupported"));
    objc_msgSend(v4, "objectForKey:", CFSTR("inGrace"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v5->_inGrace = objc_msgSend(v4, "PKBoolForKey:", CFSTR("inGrace"));
    }
    else
    {
      v40 = v5->_unpostedInterest;
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_inGrace = -[NSDecimalNumber compare:](v40, "compare:", v41) != NSOrderedDescending;

      }
      else
      {
        v5->_inGrace = 1;
      }
    }
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("chargeOffPreventionAmount"));
    v42 = objc_claimAutoreleasedReturnValue();
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v42;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("pastDueAmount"));
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v44;

    v46 = [PKCreditAccountBalanceSummary alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("balanceSummary"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[PKCreditAccountBalanceSummary initWithDictionary:](v46, "initWithDictionary:", v47);
    balanceSummary = v5->_balanceSummary;
    v5->_balanceSummary = (PKCreditAccountBalanceSummary *)v48;

    v50 = [PKCreditAccountStatement alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("currentStatement"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[PKCreditAccountStatement initWithDictionary:](v50, "initWithDictionary:", v51);
    currentStatement = v5->_currentStatement;
    v5->_currentStatement = (PKCreditAccountStatement *)v52;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("accountUserActivity"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "pk_setByApplyingBlock:", &__block_literal_global_16);
    v55 = objc_claimAutoreleasedReturnValue();
    accountUserActivity = v5->_accountUserActivity;
    v5->_accountUserActivity = (NSSet *)v55;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("mergeSummary"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v58 = -[PKCreditAccountMergeSummary initWithDictionary:]([PKCreditAccountMergeSummary alloc], "initWithDictionary:", v57);
      mergeSummary = v5->_mergeSummary;
      v5->_mergeSummary = v58;

    }
  }

  return v5;
}

PKCreditAccountUserActivity *__45__PKCreditAccountSummary_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCreditAccountUserActivity *v3;

  v2 = a2;
  v3 = -[PKCreditAccountUserActivity initWithDictionary:]([PKCreditAccountUserActivity alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSDate)paymentDueDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSDate *v9;

  PKForceAccountDueDateNumberDaysFromNow();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  v5 = objc_msgSend(v3, "integerValue");
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setDay:", v5);
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v8, 0);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (!v9)
LABEL_3:
    v9 = self->_paymentDueDate;

  return v9;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  id v4;
  PKCreditAccountStatement *v5;
  PKCreditAccountStatement *v6;
  PKCreditAccountStatement *currentStatement;
  id v8;

  v4 = a3;
  self->_autoPayEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("autopayStatus"));
  v5 = [PKCreditAccountStatement alloc];
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("currentStatement"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[PKCreditAccountStatement initWithDictionary:](v5, "initWithDictionary:", v8);
  currentStatement = self->_currentStatement;
  self->_currentStatement = v6;

}

- (NSDecimalNumber)adjustedBalance
{
  NSDecimalNumber *adjustedBalance;

  adjustedBalance = self->_adjustedBalance;
  if (!adjustedBalance)
    adjustedBalance = self->_currentBalance;
  return adjustedBalance;
}

- (id)accountUserActivityForAccountUserAltDSID:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = self->_accountUserActivity;
    v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "accountUserAltDSID", (_QWORD)v17);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = v4;
          v13 = v12;
          if (v11 == v12)
          {

LABEL_17:
            v15 = v10;
            goto LABEL_19;
          }
          if (v11)
          {
            v14 = objc_msgSend(v11, "isEqualToString:", v12);

            if ((v14 & 1) != 0)
              goto LABEL_17;
          }
          else
          {

          }
        }
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v15 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_19:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountSummary)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *creditLimit;
  uint64_t v8;
  NSDecimalNumber *availableCredit;
  uint64_t v10;
  NSDecimalNumber *currentBalance;
  uint64_t v12;
  NSDecimalNumber *adjustedBalance;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *remainingMinimumPayment;
  uint64_t v18;
  NSDecimalNumber *remainingStatementBalance;
  uint64_t v20;
  NSDecimalNumber *remainingStatementBalanceForInterestCalculation;
  uint64_t v22;
  NSDecimalNumber *pastDueAmount;
  uint64_t v24;
  NSDate *lastPaymentDate;
  uint64_t v26;
  NSDate *paymentDueDate;
  uint64_t v28;
  PKCreditAccountBalanceSummary *balanceSummary;
  uint64_t v30;
  PKCreditAccountStatement *currentStatement;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSSet *accountUserActivity;
  uint64_t v37;
  PKCreditAccountMergeSummary *mergeSummary;
  uint64_t v39;
  NSDecimalNumber *unpostedInterest;
  uint64_t v41;
  NSDate *unpostedInterestTimestamp;
  uint64_t v43;
  NSDecimalNumber *chargeOffPreventionAmount;
  uint64_t v45;
  NSDecimalNumber *v46;
  uint64_t v47;
  NSDecimalNumber *remainingMinimumPaymentExcludedFromInterestCalculation;
  uint64_t v49;
  NSDecimalNumber *installmentBalance;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PKCreditAccountSummary;
  v5 = -[PKCreditAccountSummary init](&v52, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditLimit"));
    v6 = objc_claimAutoreleasedReturnValue();
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableCredit"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableCredit = v5->_availableCredit;
    v5->_availableCredit = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustedBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    adjustedBalance = v5->_adjustedBalance;
    v5->_adjustedBalance = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingMinimumPayment"));
    v16 = objc_claimAutoreleasedReturnValue();
    remainingMinimumPayment = v5->_remainingMinimumPayment;
    v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingStatementBalance"));
    v18 = objc_claimAutoreleasedReturnValue();
    remainingStatementBalance = v5->_remainingStatementBalance;
    v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingStatementBalanceForInterestCalculation"));
    v20 = objc_claimAutoreleasedReturnValue();
    remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
    v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

    v5->_autoPayEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autopayStatus"));
    v5->_requiresDebtCollectionNotices = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresDebtCollectionNotices"));
    v5->_balanceStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("balanceStatus"));
    v5->_cyclesPastDue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cyclesPastDue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pastDueAmount"));
    v22 = objc_claimAutoreleasedReturnValue();
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastPaymentDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    lastPaymentDate = v5->_lastPaymentDate;
    v5->_lastPaymentDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDueDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceSummary"));
    v28 = objc_claimAutoreleasedReturnValue();
    balanceSummary = v5->_balanceSummary;
    v5->_balanceSummary = (PKCreditAccountBalanceSummary *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentStatement"));
    v30 = objc_claimAutoreleasedReturnValue();
    currentStatement = v5->_currentStatement;
    v5->_currentStatement = (PKCreditAccountStatement *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("accountUserActivity"));
    v35 = objc_claimAutoreleasedReturnValue();
    accountUserActivity = v5->_accountUserActivity;
    v5->_accountUserActivity = (NSSet *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeSummary"));
    v37 = objc_claimAutoreleasedReturnValue();
    mergeSummary = v5->_mergeSummary;
    v5->_mergeSummary = (PKCreditAccountMergeSummary *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unpostedInterest"));
    v39 = objc_claimAutoreleasedReturnValue();
    unpostedInterest = v5->_unpostedInterest;
    v5->_unpostedInterest = (NSDecimalNumber *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unpostedInterestTimestamp"));
    v41 = objc_claimAutoreleasedReturnValue();
    unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
    v5->_unpostedInterestTimestamp = (NSDate *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chargeOffPreventionAmount"));
    v43 = objc_claimAutoreleasedReturnValue();
    chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
    v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pastDueAmount"));
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v5->_pastDueAmount;
    v5->_pastDueAmount = (NSDecimalNumber *)v45;

    v5->_inGrace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inGrace"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingMinimumPaymentExcludedFromInterestCalculation"));
    v47 = objc_claimAutoreleasedReturnValue();
    remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
    v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentBalance"));
    v49 = objc_claimAutoreleasedReturnValue();
    installmentBalance = v5->_installmentBalance;
    v5->_installmentBalance = (NSDecimalNumber *)v49;

    v5->_recoveryPaymentPlansSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recoveryPaymentPlansSupported"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *creditLimit;
  id v5;

  creditLimit = self->_creditLimit;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", creditLimit, CFSTR("creditLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableCredit, CFSTR("availableCredit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adjustedBalance, CFSTR("adjustedBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsBalance, CFSTR("rewardsBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remainingMinimumPayment, CFSTR("remainingMinimumPayment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remainingStatementBalance, CFSTR("remainingStatementBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remainingStatementBalanceForInterestCalculation, CFSTR("remainingStatementBalanceForInterestCalculation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoPayEnabled, CFSTR("autopayStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresDebtCollectionNotices, CFSTR("requiresDebtCollectionNotices"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_balanceStatus, CFSTR("balanceStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cyclesPastDue, CFSTR("cyclesPastDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pastDueAmount, CFSTR("pastDueAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastPaymentDate, CFSTR("lastPaymentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDueDate, CFSTR("paymentDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceSummary, CFSTR("balanceSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountUserActivity, CFSTR("accountUserActivity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mergeSummary, CFSTR("mergeSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentStatement, CFSTR("currentStatement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unpostedInterest, CFSTR("unpostedInterest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unpostedInterestTimestamp, CFSTR("unpostedInterestTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chargeOffPreventionAmount, CFSTR("chargeOffPreventionAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pastDueAmount, CFSTR("pastDueAmount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_inGrace, CFSTR("inGrace"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remainingMinimumPaymentExcludedFromInterestCalculation, CFSTR("remainingMinimumPaymentExcludedFromInterestCalculation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentBalance, CFSTR("installmentBalance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_recoveryPaymentPlansSupported, CFSTR("recoveryPaymentPlansSupported"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *creditLimit;
  NSDecimalNumber *v6;
  NSDecimalNumber *availableCredit;
  NSDecimalNumber *v8;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v10;
  NSDecimalNumber *adjustedBalance;
  NSDecimalNumber *v12;
  NSDecimalNumber *remainingMinimumPayment;
  NSDecimalNumber *v14;
  NSDecimalNumber *remainingStatementBalance;
  NSDecimalNumber *v16;
  NSDecimalNumber *remainingStatementBalanceForInterestCalculation;
  NSDecimalNumber *v18;
  NSDecimalNumber *pastDueAmount;
  NSDecimalNumber *v20;
  NSDate *lastPaymentDate;
  NSDate *v22;
  PKCreditAccountBalanceSummary *balanceSummary;
  PKCreditAccountBalanceSummary *v24;
  NSSet *accountUserActivity;
  NSSet *v26;
  PKCreditAccountMergeSummary *mergeSummary;
  PKCreditAccountMergeSummary *v28;
  PKCreditAccountStatement *currentStatement;
  PKCreditAccountStatement *v30;
  NSDecimalNumber *unpostedInterest;
  NSDecimalNumber *v32;
  NSDate *unpostedInterestTimestamp;
  NSDate *v34;
  NSDecimalNumber *chargeOffPreventionAmount;
  NSDecimalNumber *v36;
  NSDecimalNumber *v37;
  NSDecimalNumber *v38;
  NSDecimalNumber *remainingMinimumPaymentExcludedFromInterestCalculation;
  NSDecimalNumber *v40;
  NSDecimalNumber *installmentBalance;
  NSDecimalNumber *v42;
  NSDate *paymentDueDate;
  NSDate *v44;
  BOOL v45;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_107;
  creditLimit = self->_creditLimit;
  v6 = (NSDecimalNumber *)v4[2];
  if (creditLimit && v6)
  {
    if ((-[NSDecimalNumber isEqual:](creditLimit, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (creditLimit != v6)
  {
    goto LABEL_107;
  }
  availableCredit = self->_availableCredit;
  v8 = (NSDecimalNumber *)v4[3];
  if (availableCredit && v8)
  {
    if ((-[NSDecimalNumber isEqual:](availableCredit, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (availableCredit != v8)
  {
    goto LABEL_107;
  }
  currentBalance = self->_currentBalance;
  v10 = (NSDecimalNumber *)v4[4];
  if (currentBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (currentBalance != v10)
  {
    goto LABEL_107;
  }
  adjustedBalance = self->_adjustedBalance;
  v12 = (NSDecimalNumber *)v4[5];
  if (adjustedBalance && v12)
  {
    if ((-[NSDecimalNumber isEqual:](adjustedBalance, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (adjustedBalance != v12)
  {
    goto LABEL_107;
  }
  remainingMinimumPayment = self->_remainingMinimumPayment;
  v14 = (NSDecimalNumber *)v4[9];
  if (remainingMinimumPayment && v14)
  {
    if ((-[NSDecimalNumber isEqual:](remainingMinimumPayment, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (remainingMinimumPayment != v14)
  {
    goto LABEL_107;
  }
  remainingStatementBalance = self->_remainingStatementBalance;
  v16 = (NSDecimalNumber *)v4[7];
  if (remainingStatementBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](remainingStatementBalance, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (remainingStatementBalance != v16)
  {
    goto LABEL_107;
  }
  remainingStatementBalanceForInterestCalculation = self->_remainingStatementBalanceForInterestCalculation;
  v18 = (NSDecimalNumber *)v4[8];
  if (remainingStatementBalanceForInterestCalculation && v18)
  {
    if ((-[NSDecimalNumber isEqual:](remainingStatementBalanceForInterestCalculation, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (remainingStatementBalanceForInterestCalculation != v18)
  {
    goto LABEL_107;
  }
  pastDueAmount = self->_pastDueAmount;
  v20 = (NSDecimalNumber *)v4[22];
  if (pastDueAmount && v20)
  {
    if ((-[NSDecimalNumber isEqual:](pastDueAmount, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (pastDueAmount != v20)
  {
    goto LABEL_107;
  }
  if (self->_autoPayEnabled != *((unsigned __int8 *)v4 + 10)
    || self->_requiresDebtCollectionNotices != *((unsigned __int8 *)v4 + 8)
    || self->_balanceStatus != v4[15]
    || self->_cyclesPastDue != v4[14]
    || self->_inGrace != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_107;
  }
  lastPaymentDate = self->_lastPaymentDate;
  v22 = (NSDate *)v4[13];
  if (lastPaymentDate && v22)
  {
    if ((-[NSDate isEqual:](lastPaymentDate, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (lastPaymentDate != v22)
  {
    goto LABEL_107;
  }
  balanceSummary = self->_balanceSummary;
  v24 = (PKCreditAccountBalanceSummary *)v4[16];
  if (balanceSummary && v24)
  {
    if (!-[PKCreditAccountBalanceSummary isEqual:](balanceSummary, "isEqual:"))
      goto LABEL_107;
  }
  else if (balanceSummary != v24)
  {
    goto LABEL_107;
  }
  accountUserActivity = self->_accountUserActivity;
  v26 = (NSSet *)v4[17];
  if (accountUserActivity && v26)
  {
    if ((-[NSSet isEqual:](accountUserActivity, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (accountUserActivity != v26)
  {
    goto LABEL_107;
  }
  mergeSummary = self->_mergeSummary;
  v28 = (PKCreditAccountMergeSummary *)v4[18];
  if (mergeSummary && v28)
  {
    if (!-[PKCreditAccountMergeSummary isEqual:](mergeSummary, "isEqual:"))
      goto LABEL_107;
  }
  else if (mergeSummary != v28)
  {
    goto LABEL_107;
  }
  currentStatement = self->_currentStatement;
  v30 = (PKCreditAccountStatement *)v4[23];
  if (currentStatement && v30)
  {
    if (!-[PKCreditAccountStatement isEqual:](currentStatement, "isEqual:"))
      goto LABEL_107;
  }
  else if (currentStatement != v30)
  {
    goto LABEL_107;
  }
  unpostedInterest = self->_unpostedInterest;
  v32 = (NSDecimalNumber *)v4[19];
  if (unpostedInterest && v32)
  {
    if ((-[NSDecimalNumber isEqual:](unpostedInterest, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (unpostedInterest != v32)
  {
    goto LABEL_107;
  }
  unpostedInterestTimestamp = self->_unpostedInterestTimestamp;
  v34 = (NSDate *)v4[20];
  if (unpostedInterestTimestamp && v34)
  {
    if ((-[NSDate isEqual:](unpostedInterestTimestamp, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (unpostedInterestTimestamp != v34)
  {
    goto LABEL_107;
  }
  chargeOffPreventionAmount = self->_chargeOffPreventionAmount;
  v36 = (NSDecimalNumber *)v4[21];
  if (chargeOffPreventionAmount && v36)
  {
    if ((-[NSDecimalNumber isEqual:](chargeOffPreventionAmount, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (chargeOffPreventionAmount != v36)
  {
    goto LABEL_107;
  }
  v37 = self->_pastDueAmount;
  v38 = (NSDecimalNumber *)v4[22];
  if (v37 && v38)
  {
    if ((-[NSDecimalNumber isEqual:](v37, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (v37 != v38)
  {
    goto LABEL_107;
  }
  remainingMinimumPaymentExcludedFromInterestCalculation = self->_remainingMinimumPaymentExcludedFromInterestCalculation;
  v40 = (NSDecimalNumber *)v4[10];
  if (remainingMinimumPaymentExcludedFromInterestCalculation && v40)
  {
    if ((-[NSDecimalNumber isEqual:](remainingMinimumPaymentExcludedFromInterestCalculation, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (remainingMinimumPaymentExcludedFromInterestCalculation != v40)
  {
    goto LABEL_107;
  }
  installmentBalance = self->_installmentBalance;
  v42 = (NSDecimalNumber *)v4[11];
  if (installmentBalance && v42)
  {
    if ((-[NSDecimalNumber isEqual:](installmentBalance, "isEqual:") & 1) == 0)
      goto LABEL_107;
  }
  else if (installmentBalance != v42)
  {
    goto LABEL_107;
  }
  paymentDueDate = self->_paymentDueDate;
  v44 = (NSDate *)v4[12];
  if (!paymentDueDate || !v44)
  {
    if (paymentDueDate == v44)
      goto LABEL_105;
LABEL_107:
    v45 = 0;
    goto LABEL_108;
  }
  if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0)
    goto LABEL_107;
LABEL_105:
  v45 = self->_recoveryPaymentPlansSupported == *((unsigned __int8 *)v4 + 11);
LABEL_108:

  return v45;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_creditLimit);
  objc_msgSend(v3, "safelyAddObject:", self->_availableCredit);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_adjustedBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_remainingMinimumPayment);
  objc_msgSend(v3, "safelyAddObject:", self->_remainingStatementBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_remainingStatementBalanceForInterestCalculation);
  objc_msgSend(v3, "safelyAddObject:", self->_lastPaymentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserActivity);
  objc_msgSend(v3, "safelyAddObject:", self->_mergeSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_currentStatement);
  objc_msgSend(v3, "safelyAddObject:", self->_unpostedInterest);
  objc_msgSend(v3, "safelyAddObject:", self->_unpostedInterestTimestamp);
  objc_msgSend(v3, "safelyAddObject:", self->_chargeOffPreventionAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_pastDueAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_remainingMinimumPaymentExcludedFromInterestCalculation);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentBalance);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_autoPayEnabled - v4 + 32 * v4;
  v6 = self->_requiresDebtCollectionNotices - v5 + 32 * v5;
  v7 = self->_balanceStatus - v6 + 32 * v6;
  v8 = self->_cyclesPastDue - v7 + 32 * v7;
  v9 = self->_inGrace - v8 + 32 * v8;
  v10 = self->_recoveryPaymentPlansSupported - v9 + 32 * v9;

  return v10;
}

- (id)description
{
  void *v3;
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
  unint64_t balanceStatus;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_creditLimit, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("creditLimit: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_availableCredit, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availableCredit: '%@'; "), v5);

  -[NSDecimalNumber stringValue](self->_currentBalance, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_rewardsBalance, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsBalance: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_remainingMinimumPayment, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("remainingMinimumPayment: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_remainingStatementBalance, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("remainingStatementBalance: '%@'; "), v9);

  -[NSDecimalNumber stringValue](self->_remainingStatementBalanceForInterestCalculation, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("remainingStatementBalanceForInterestCalculation: '%@'; "), v10);

  -[NSDecimalNumber stringValue](self->_pastDueAmount, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pastDueAmount: '%@'; "), v11);

  if (self->_autoPayEnabled)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("autoPayEnabled: '%@'; "), v12);
  if (self->_requiresDebtCollectionNotices)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresDebtCollectionNotices: '%@'; "), v13);
  balanceStatus = self->_balanceStatus;
  if (balanceStatus > 2)
    v15 = CFSTR("unknown");
  else
    v15 = off_1E2AC26F8[balanceStatus];
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceStatus: '%@'; "), v15);
  objc_msgSend(v3, "appendFormat:", CFSTR("cyclesPastDue: '%ld'; "), self->_cyclesPastDue);
  -[NSDate description](self->_lastPaymentDate, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastPaymentDate: '%@'; "), v16);

  -[NSDate description](self->_paymentDueDate, "description");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDueDate: '%@'; "), v17);

  -[NSDecimalNumber stringValue](self->_unpostedInterest, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("unpostedInterest: '%@'; "), v18);

  -[NSDate description](self->_unpostedInterestTimestamp, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("unpostedInterestTimestamp: '%@'; "), v19);

  -[NSDecimalNumber stringValue](self->_chargeOffPreventionAmount, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("chargeOffPreventionAmount: '%@'; "), v20);

  -[NSDecimalNumber stringValue](self->_pastDueAmount, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pastDueAmount: '%@'; "), v21);

  if (self->_inGrace)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("inGrace: '%@'; "), v22);
  -[PKCreditAccountBalanceSummary description](self->_balanceSummary, "description");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceSummary: '%@'; "), v23);

  -[NSSet description](self->_accountUserActivity, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserActivity: '%@'; "), v24);

  -[PKCreditAccountMergeSummary description](self->_mergeSummary, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("mergeSummary: '%@'; "), v25);

  -[PKCreditAccountStatement description](self->_currentStatement, "description");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentStatement: '%@'; "), v26);

  -[NSDecimalNumber description](self->_installmentBalance, "description");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentBalance: '%@'; "), v27);

  -[PKCreditAccountSummary adjustedBalance](self, "adjustedBalance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("adjustedBalance: '%@'; "), v28);

  if (self->_recoveryPaymentPlansSupported)
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("recoveryPaymentPlansSupported: '%@'; "), v29);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *creditLimit;
  uint64_t v8;
  NSDecimalNumber *availableCredit;
  uint64_t v10;
  NSDecimalNumber *currentBalance;
  uint64_t v12;
  NSDecimalNumber *adjustedBalance;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *remainingMinimumPayment;
  uint64_t v18;
  NSDecimalNumber *remainingStatementBalance;
  uint64_t v20;
  NSDecimalNumber *remainingStatementBalanceForInterestCalculation;
  uint64_t v22;
  NSDate *lastPaymentDate;
  uint64_t v24;
  NSDate *paymentDueDate;
  PKCreditAccountBalanceSummary *v26;
  PKCreditAccountBalanceSummary *balanceSummary;
  uint64_t v28;
  NSSet *accountUserActivity;
  PKCreditAccountMergeSummary *v30;
  PKCreditAccountMergeSummary *mergeSummary;
  PKCreditAccountStatement *v32;
  PKCreditAccountStatement *currentStatement;
  uint64_t v34;
  NSDecimalNumber *unpostedInterest;
  uint64_t v36;
  NSDate *unpostedInterestTimestamp;
  uint64_t v38;
  NSDecimalNumber *chargeOffPreventionAmount;
  uint64_t v40;
  NSDecimalNumber *pastDueAmount;
  uint64_t v42;
  NSDecimalNumber *remainingMinimumPaymentExcludedFromInterestCalculation;
  uint64_t v44;
  NSDecimalNumber *installmentBalance;

  v5 = -[PKCreditAccountSummary init](+[PKCreditAccountSummary allocWithZone:](PKCreditAccountSummary, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_creditLimit, "copyWithZone:", a3);
  creditLimit = v5->_creditLimit;
  v5->_creditLimit = (NSDecimalNumber *)v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_availableCredit, "copyWithZone:", a3);
  availableCredit = v5->_availableCredit;
  v5->_availableCredit = (NSDecimalNumber *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_adjustedBalance, "copyWithZone:", a3);
  adjustedBalance = v5->_adjustedBalance;
  v5->_adjustedBalance = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_rewardsBalance, "copyWithZone:", a3);
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_remainingMinimumPayment, "copyWithZone:", a3);
  remainingMinimumPayment = v5->_remainingMinimumPayment;
  v5->_remainingMinimumPayment = (NSDecimalNumber *)v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_remainingStatementBalance, "copyWithZone:", a3);
  remainingStatementBalance = v5->_remainingStatementBalance;
  v5->_remainingStatementBalance = (NSDecimalNumber *)v18;

  v20 = -[NSDecimalNumber copyWithZone:](self->_remainingStatementBalanceForInterestCalculation, "copyWithZone:", a3);
  remainingStatementBalanceForInterestCalculation = v5->_remainingStatementBalanceForInterestCalculation;
  v5->_remainingStatementBalanceForInterestCalculation = (NSDecimalNumber *)v20;

  v5->_autoPayEnabled = self->_autoPayEnabled;
  v5->_requiresDebtCollectionNotices = self->_requiresDebtCollectionNotices;
  v5->_balanceStatus = self->_balanceStatus;
  v5->_cyclesPastDue = self->_cyclesPastDue;
  objc_storeStrong((id *)&v5->_pastDueAmount, self->_pastDueAmount);
  v22 = -[NSDate copyWithZone:](self->_lastPaymentDate, "copyWithZone:", a3);
  lastPaymentDate = v5->_lastPaymentDate;
  v5->_lastPaymentDate = (NSDate *)v22;

  v24 = -[NSDate copyWithZone:](self->_paymentDueDate, "copyWithZone:", a3);
  paymentDueDate = v5->_paymentDueDate;
  v5->_paymentDueDate = (NSDate *)v24;

  v26 = -[PKCreditAccountBalanceSummary copyWithZone:](self->_balanceSummary, "copyWithZone:", a3);
  balanceSummary = v5->_balanceSummary;
  v5->_balanceSummary = v26;

  v28 = -[NSSet copyWithZone:](self->_accountUserActivity, "copyWithZone:", a3);
  accountUserActivity = v5->_accountUserActivity;
  v5->_accountUserActivity = (NSSet *)v28;

  v30 = -[PKCreditAccountMergeSummary copyWithZone:](self->_mergeSummary, "copyWithZone:", a3);
  mergeSummary = v5->_mergeSummary;
  v5->_mergeSummary = v30;

  v32 = -[PKCreditAccountStatement copyWithZone:](self->_currentStatement, "copyWithZone:", a3);
  currentStatement = v5->_currentStatement;
  v5->_currentStatement = v32;

  v34 = -[NSDecimalNumber copyWithZone:](self->_unpostedInterest, "copyWithZone:", a3);
  unpostedInterest = v5->_unpostedInterest;
  v5->_unpostedInterest = (NSDecimalNumber *)v34;

  v36 = -[NSDate copyWithZone:](self->_unpostedInterestTimestamp, "copyWithZone:", a3);
  unpostedInterestTimestamp = v5->_unpostedInterestTimestamp;
  v5->_unpostedInterestTimestamp = (NSDate *)v36;

  v38 = -[NSDecimalNumber copyWithZone:](self->_chargeOffPreventionAmount, "copyWithZone:", a3);
  chargeOffPreventionAmount = v5->_chargeOffPreventionAmount;
  v5->_chargeOffPreventionAmount = (NSDecimalNumber *)v38;

  v40 = -[NSDecimalNumber copyWithZone:](self->_pastDueAmount, "copyWithZone:", a3);
  pastDueAmount = v5->_pastDueAmount;
  v5->_pastDueAmount = (NSDecimalNumber *)v40;

  v5->_inGrace = self->_inGrace;
  v42 = -[NSDecimalNumber copyWithZone:](self->_remainingMinimumPaymentExcludedFromInterestCalculation, "copyWithZone:", a3);
  remainingMinimumPaymentExcludedFromInterestCalculation = v5->_remainingMinimumPaymentExcludedFromInterestCalculation;
  v5->_remainingMinimumPaymentExcludedFromInterestCalculation = (NSDecimalNumber *)v42;

  v44 = -[NSDecimalNumber copyWithZone:](self->_installmentBalance, "copyWithZone:", a3);
  installmentBalance = v5->_installmentBalance;
  v5->_installmentBalance = (NSDecimalNumber *)v44;

  v5->_recoveryPaymentPlansSupported = self->_recoveryPaymentPlansSupported;
  return v5;
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)availableCredit
{
  return self->_availableCredit;
}

- (void)setAvailableCredit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAdjustedBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)remainingStatementBalance
{
  return self->_remainingStatementBalance;
}

- (void)setRemainingStatementBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)remainingStatementBalanceForInterestCalculation
{
  return self->_remainingStatementBalanceForInterestCalculation;
}

- (void)setRemainingStatementBalanceForInterestCalculation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)remainingMinimumPayment
{
  return self->_remainingMinimumPayment;
}

- (void)setRemainingMinimumPayment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)remainingMinimumPaymentExcludedFromInterestCalculation
{
  return self->_remainingMinimumPaymentExcludedFromInterestCalculation;
}

- (void)setRemainingMinimumPaymentExcludedFromInterestCalculation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)installmentBalance
{
  return self->_installmentBalance;
}

- (void)setInstallmentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPaymentDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDate)lastPaymentDate
{
  return self->_lastPaymentDate;
}

- (void)setLastPaymentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)cyclesPastDue
{
  return self->_cyclesPastDue;
}

- (void)setCyclesPastDue:(int64_t)a3
{
  self->_cyclesPastDue = a3;
}

- (unint64_t)balanceStatus
{
  return self->_balanceStatus;
}

- (void)setBalanceStatus:(unint64_t)a3
{
  self->_balanceStatus = a3;
}

- (PKCreditAccountBalanceSummary)balanceSummary
{
  return self->_balanceSummary;
}

- (void)setBalanceSummary:(id)a3
{
  objc_storeStrong((id *)&self->_balanceSummary, a3);
}

- (NSSet)accountUserActivity
{
  return self->_accountUserActivity;
}

- (void)setAccountUserActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKCreditAccountMergeSummary)mergeSummary
{
  return self->_mergeSummary;
}

- (void)setMergeSummary:(id)a3
{
  objc_storeStrong((id *)&self->_mergeSummary, a3);
}

- (BOOL)requiresDebtCollectionNotices
{
  return self->_requiresDebtCollectionNotices;
}

- (void)setRequiresDebtCollectionNotices:(BOOL)a3
{
  self->_requiresDebtCollectionNotices = a3;
}

- (NSDecimalNumber)unpostedInterest
{
  return self->_unpostedInterest;
}

- (void)setUnpostedInterest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDate)unpostedInterestTimestamp
{
  return self->_unpostedInterestTimestamp;
}

- (void)setUnpostedInterestTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)inGrace
{
  return self->_inGrace;
}

- (void)setInGrace:(BOOL)a3
{
  self->_inGrace = a3;
}

- (NSDecimalNumber)chargeOffPreventionAmount
{
  return self->_chargeOffPreventionAmount;
}

- (void)setChargeOffPreventionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDecimalNumber)pastDueAmount
{
  return self->_pastDueAmount;
}

- (void)setPastDueAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)autoPayEnabled
{
  return self->_autoPayEnabled;
}

- (void)setAutoPayEnabled:(BOOL)a3
{
  self->_autoPayEnabled = a3;
}

- (PKCreditAccountStatement)currentStatement
{
  return self->_currentStatement;
}

- (void)setCurrentStatement:(id)a3
{
  objc_storeStrong((id *)&self->_currentStatement, a3);
}

- (BOOL)recoveryPaymentPlansSupported
{
  return self->_recoveryPaymentPlansSupported;
}

- (void)setRecoveryPaymentPlansSupported:(BOOL)a3
{
  self->_recoveryPaymentPlansSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStatement, 0);
  objc_storeStrong((id *)&self->_pastDueAmount, 0);
  objc_storeStrong((id *)&self->_chargeOffPreventionAmount, 0);
  objc_storeStrong((id *)&self->_unpostedInterestTimestamp, 0);
  objc_storeStrong((id *)&self->_unpostedInterest, 0);
  objc_storeStrong((id *)&self->_mergeSummary, 0);
  objc_storeStrong((id *)&self->_accountUserActivity, 0);
  objc_storeStrong((id *)&self->_balanceSummary, 0);
  objc_storeStrong((id *)&self->_lastPaymentDate, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_installmentBalance, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPaymentExcludedFromInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingMinimumPayment, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalanceForInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingStatementBalance, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_adjustedBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
}

@end
