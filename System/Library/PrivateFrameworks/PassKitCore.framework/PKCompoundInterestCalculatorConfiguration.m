@implementation PKCompoundInterestCalculatorConfiguration

+ (id)configurationWithCreditAccount:(id)a3
{
  id v3;
  PKCompoundInterestCalculatorConfiguration *v4;

  v3 = a3;
  v4 = objc_alloc_init(PKCompoundInterestCalculatorConfiguration);
  -[PKCompoundInterestCalculatorConfiguration updateWithCreditAccount:](v4, "updateWithCreditAccount:", v3);

  return v4;
}

- (PKCompoundInterestCalculatorConfiguration)init
{
  PKCompoundInterestCalculatorConfiguration *v2;
  PKCompoundInterestCalculatorConfiguration *v3;
  uint64_t v4;
  NSDecimalNumber *apr;
  uint64_t v6;
  NSCalendar *calendar;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKCompoundInterestCalculatorConfiguration;
  v2 = -[PKCompoundInterestCalculatorConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_calculationMethod = 0;
    v2->_compoundingPeriods = 365;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v4 = objc_claimAutoreleasedReturnValue();
    apr = v3->_apr;
    v3->_apr = (NSDecimalNumber *)v4;

    *(_WORD *)&v3->_inGrace = 1;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v6 = objc_claimAutoreleasedReturnValue();
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v6;

  }
  return v3;
}

- (void)updateWithCreditAccount:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDecimalNumber *v12;
  NSDecimalNumber *apr;
  NSDate *v14;
  NSDate *periodStartDate;
  NSDate *v16;
  NSDate *periodEndDate;
  NSDecimalNumber *v18;
  NSDecimalNumber *periodStartingBalance;
  void *v20;
  void *v21;
  NSDecimalNumber *v22;
  NSDecimalNumber *remainingPeriodStartingBalance;
  NSDecimalNumber *v24;
  NSDecimalNumber *remainingPeriodStartingBalanceForGracePurposes;
  NSDecimalNumber *v26;
  NSDecimalNumber *remainingPeriodMinimumPayment;
  NSDecimalNumber *v28;
  NSDecimalNumber *remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
  NSDecimalNumber *v30;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v32;
  NSDecimalNumber *unpostedInterest;
  NSDate *v34;
  NSDate *unpostedInterestTimestamp;
  NSTimeZone *v36;
  NSTimeZone *productTimeZone;
  id v38;

  v4 = a3;
  if (v4)
  {
    v38 = v4;
    v5 = objc_msgSend(v4, "type") == 1;
    v4 = v38;
    if (v5)
    {
      objc_msgSend(v38, "creditDetails");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountSummary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accountSummary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentStatement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "balanceSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "aprForPurchases");
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      apr = self->_apr;
      self->_apr = v12;

      objc_msgSend(v10, "openingDate");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      periodStartDate = self->_periodStartDate;
      self->_periodStartDate = v14;

      objc_msgSend(v10, "closingDate");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      periodEndDate = self->_periodEndDate;
      self->_periodEndDate = v16;

      objc_msgSend(v9, "statementBalance");
      v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      periodStartingBalance = self->_periodStartingBalance;
      self->_periodStartingBalance = v18;

      objc_msgSend(v7, "remainingStatementBalanceForInterestCalculation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        objc_msgSend(v7, "remainingStatementBalance");
        v22 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      }
      remainingPeriodStartingBalance = self->_remainingPeriodStartingBalance;
      self->_remainingPeriodStartingBalance = v22;

      objc_msgSend(v7, "remainingStatementBalance");
      v24 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      remainingPeriodStartingBalanceForGracePurposes = self->_remainingPeriodStartingBalanceForGracePurposes;
      self->_remainingPeriodStartingBalanceForGracePurposes = v24;

      objc_msgSend(v7, "remainingMinimumPayment");
      v26 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      remainingPeriodMinimumPayment = self->_remainingPeriodMinimumPayment;
      self->_remainingPeriodMinimumPayment = v26;

      objc_msgSend(v7, "remainingMinimumPaymentExcludedFromInterestCalculation");
      v28 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      remainingPeriodMinimumPaymentExcludedFromInterestCalculation = self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
      self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation = v28;

      objc_msgSend(v7, "adjustedBalance");
      v30 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      currentBalance = self->_currentBalance;
      self->_currentBalance = v30;

      self->_inGrace = objc_msgSend(v7, "inGrace");
      self->_isInDisasterRecovery = objc_msgSend(v38, "stateReason") == 2;
      objc_msgSend(v7, "unpostedInterest");
      v32 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      unpostedInterest = self->_unpostedInterest;
      self->_unpostedInterest = v32;

      objc_msgSend(v7, "unpostedInterestTimestamp");
      v34 = (NSDate *)objc_claimAutoreleasedReturnValue();
      unpostedInterestTimestamp = self->_unpostedInterestTimestamp;
      self->_unpostedInterestTimestamp = v34;

      objc_msgSend(v6, "productTimeZone");
      v36 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
      productTimeZone = self->_productTimeZone;
      self->_productTimeZone = v36;

      self->_compoundingPeriods = -[PKCompoundInterestCalculatorConfiguration _daysInYearForDate:withTimeZone:](self, "_daysInYearForDate:withTimeZone:", self->_periodStartDate, self->_productTimeZone);
      v4 = v38;
    }
  }

}

- (int64_t)_daysInYearForDate:(id)a3 withTimeZone:(id)a4
{
  NSCalendar *calendar;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;

  calendar = self->_calendar;
  v6 = a4;
  v7 = a3;
  v8 = (void *)-[NSCalendar copy](calendar, "copy");
  objc_msgSend(v8, "setTimeZone:", v6);

  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v10 = objc_msgSend(v8, "component:fromDate:", 4, v7);

  objc_msgSend(v9, "setYear:", v10);
  objc_msgSend(v9, "setMonth:", objc_msgSend(v8, "minimumRangeOfUnit:", 8));
  objc_msgSend(v9, "setDay:", objc_msgSend(v8, "minimumRangeOfUnit:", 16));
  objc_msgSend(v8, "dateFromComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setYear:", objc_msgSend(v9, "year") + 1);
  objc_msgSend(v8, "dateFromComponents:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "day");

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_calculationMethod);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("calculationMethod: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("apr: '%@'; "), self->_apr);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compoundingPeriods);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("compoundingPeriods: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR("periodStartDate: '%@'; "), self->_periodStartDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("periodEndDate: '%@'; "), self->_periodEndDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("periodStartingBalance: '%@'; "), self->_periodStartingBalance);
  objc_msgSend(v6, "appendFormat:", CFSTR("remainingPeriodStartingBalance: '%@'; "),
    self->_remainingPeriodStartingBalance);
  objc_msgSend(v6, "appendFormat:", CFSTR("remainingPeriodStartingBalanceForGracePurposes: '%@'; "),
    self->_remainingPeriodStartingBalanceForGracePurposes);
  objc_msgSend(v6, "appendFormat:", CFSTR("remainingPeriodMinimumPayment: '%@'; "),
    self->_remainingPeriodMinimumPayment);
  objc_msgSend(v6, "appendFormat:", CFSTR("remainingPeriodMinimumPaymentExcludedFromInterestCalculation: '%@'; "),
    self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation);
  objc_msgSend(v6, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inGrace);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("inGrace: '%@'; "), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInDisasterRecovery);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("isInDisasterRecovery: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR("unpostedInterest: '%@'; "), self->_unpostedInterest);
  objc_msgSend(v6, "appendFormat:", CFSTR("unpostedInterestTimestamp: '%@'; "), self->_unpostedInterestTimestamp);
  objc_msgSend(v6, "appendFormat:", CFSTR("productTimeZone: '%@'; "), self->_productTimeZone);
  objc_msgSend(v6, "appendFormat:", CFSTR("periodTransactions: '%@'; "), self->_periodTransactions);
  objc_msgSend(v6, "appendFormat:", CFSTR("futurePayments: '%@'; "), self->_futurePayments);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)calculationMethod
{
  return self->_calculationMethod;
}

- (void)setCalculationMethod:(unint64_t)a3
{
  self->_calculationMethod = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setAPR:(id)a3
{
  objc_storeStrong((id *)&self->_apr, a3);
}

- (int64_t)compoundingPeriods
{
  return self->_compoundingPeriods;
}

- (void)setCompoundingPeriods:(int64_t)a3
{
  self->_compoundingPeriods = a3;
}

- (NSDate)periodStartDate
{
  return self->_periodStartDate;
}

- (void)setPeriodStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_periodStartDate, a3);
}

- (NSDate)periodEndDate
{
  return self->_periodEndDate;
}

- (void)setPeriodEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_periodEndDate, a3);
}

- (NSDecimalNumber)periodStartingBalance
{
  return self->_periodStartingBalance;
}

- (void)setPeriodStartingBalance:(id)a3
{
  objc_storeStrong((id *)&self->_periodStartingBalance, a3);
}

- (NSDecimalNumber)remainingPeriodStartingBalance
{
  return self->_remainingPeriodStartingBalance;
}

- (void)setRemainingPeriodStartingBalance:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalance, a3);
}

- (NSDecimalNumber)remainingPeriodStartingBalanceForGracePurposes
{
  return self->_remainingPeriodStartingBalanceForGracePurposes;
}

- (void)setRemainingPeriodStartingBalanceForGracePurposes:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalanceForGracePurposes, a3);
}

- (NSDecimalNumber)remainingPeriodMinimumPayment
{
  return self->_remainingPeriodMinimumPayment;
}

- (void)setRemainingPeriodMinimumPayment:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPayment, a3);
}

- (NSDecimalNumber)remainingPeriodMinimumPaymentExcludedFromInterestCalculation
{
  return self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation;
}

- (void)setRemainingPeriodMinimumPaymentExcludedFromInterestCalculation:(id)a3
{
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation, a3);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (BOOL)inGrace
{
  return self->_inGrace;
}

- (void)setInGrace:(BOOL)a3
{
  self->_inGrace = a3;
}

- (BOOL)isInDisasterRecovery
{
  return self->_isInDisasterRecovery;
}

- (void)setIsInDisasterRecovery:(BOOL)a3
{
  self->_isInDisasterRecovery = a3;
}

- (NSDecimalNumber)unpostedInterest
{
  return self->_unpostedInterest;
}

- (void)setUnpostedInterest:(id)a3
{
  objc_storeStrong((id *)&self->_unpostedInterest, a3);
}

- (NSDate)unpostedInterestTimestamp
{
  return self->_unpostedInterestTimestamp;
}

- (void)setUnpostedInterestTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_unpostedInterestTimestamp, a3);
}

- (NSArray)periodTransactions
{
  return self->_periodTransactions;
}

- (void)setPeriodTransactions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)futurePayments
{
  return self->_futurePayments;
}

- (void)setFuturePayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_productTimeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_futurePayments, 0);
  objc_storeStrong((id *)&self->_periodTransactions, 0);
  objc_storeStrong((id *)&self->_unpostedInterestTimestamp, 0);
  objc_storeStrong((id *)&self->_unpostedInterest, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPaymentExcludedFromInterestCalculation, 0);
  objc_storeStrong((id *)&self->_remainingPeriodMinimumPayment, 0);
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalanceForGracePurposes, 0);
  objc_storeStrong((id *)&self->_remainingPeriodStartingBalance, 0);
  objc_storeStrong((id *)&self->_periodStartingBalance, 0);
  objc_storeStrong((id *)&self->_periodEndDate, 0);
  objc_storeStrong((id *)&self->_periodStartDate, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
