@implementation PKInstallmentPlanSummary

- (PKInstallmentPlanSummary)initWithDictionary:(id)a3
{
  id v4;
  PKInstallmentPlanSummary *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *originalEndDate;
  uint64_t v10;
  NSDate *currentEndDate;
  uint64_t v12;
  NSDecimalNumber *currentBalance;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSDecimalNumber *minimumDue;
  uint64_t v18;
  NSDate *minimumDueDate;
  uint64_t v20;
  NSDecimalNumber *interestCharged;
  uint64_t v22;
  NSDecimalNumber *paymentsToDateAmount;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKInstallmentPlanSummary;
  v5 = -[PKInstallmentPlanSummary init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("originalEndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalEndDate = v5->_originalEndDate;
    v5->_originalEndDate = (NSDate *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("currentEndDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentEndDate = v5->_currentEndDate;
    v5->_currentEndDate = (NSDate *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumDue"));
    v16 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("minimumDueDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    minimumDueDate = v5->_minimumDueDate;
    v5->_minimumDueDate = (NSDate *)v18;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestCharged"));
    v20 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("paymentsToDateAmount"));
    v22 = objc_claimAutoreleasedReturnValue();
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v22;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKInstallmentPlanSummary *v4;
  PKInstallmentPlanSummary *v5;
  BOOL v6;

  v4 = (PKInstallmentPlanSummary *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKInstallmentPlanSummary isEqualToInstallmentPlanSummary:](self, "isEqualToInstallmentPlanSummary:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlanSummary:(id)a3
{
  _QWORD *v4;
  NSDate *startDate;
  NSDate *v6;
  BOOL v7;
  NSDate *originalEndDate;
  NSDate *v9;
  NSDate *currentEndDate;
  NSDate *v11;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v13;
  NSString *currencyCode;
  NSString *v15;
  NSDecimalNumber *minimumDue;
  NSDecimalNumber *v17;
  NSDate *minimumDueDate;
  NSDate *v19;
  NSDecimalNumber *interestCharged;
  NSDecimalNumber *v21;
  NSDecimalNumber *paymentsToDateAmount;
  NSDecimalNumber *v23;
  char v24;

  v4 = a3;
  if (!v4)
    goto LABEL_47;
  startDate = self->_startDate;
  v6 = (NSDate *)v4[1];
  if (startDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (startDate != v6)
      goto LABEL_47;
  }
  else if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_47;
  }
  originalEndDate = self->_originalEndDate;
  v9 = (NSDate *)v4[2];
  if (originalEndDate && v9)
  {
    if ((-[NSDate isEqual:](originalEndDate, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (originalEndDate != v9)
  {
    goto LABEL_47;
  }
  currentEndDate = self->_currentEndDate;
  v11 = (NSDate *)v4[3];
  if (currentEndDate && v11)
  {
    if ((-[NSDate isEqual:](currentEndDate, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (currentEndDate != v11)
  {
    goto LABEL_47;
  }
  currentBalance = self->_currentBalance;
  v13 = (NSDecimalNumber *)v4[4];
  if (currentBalance && v13)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (currentBalance != v13)
  {
    goto LABEL_47;
  }
  currencyCode = self->_currencyCode;
  v15 = (NSString *)v4[5];
  if (currencyCode && v15)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (currencyCode != v15)
  {
    goto LABEL_47;
  }
  minimumDue = self->_minimumDue;
  v17 = (NSDecimalNumber *)v4[6];
  if (minimumDue && v17)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (minimumDue != v17)
  {
    goto LABEL_47;
  }
  minimumDueDate = self->_minimumDueDate;
  v19 = (NSDate *)v4[7];
  if (minimumDueDate && v19)
  {
    if ((-[NSDate isEqual:](minimumDueDate, "isEqual:") & 1) == 0)
      goto LABEL_47;
  }
  else if (minimumDueDate != v19)
  {
    goto LABEL_47;
  }
  interestCharged = self->_interestCharged;
  v21 = (NSDecimalNumber *)v4[8];
  if (!interestCharged || !v21)
  {
    if (interestCharged == v21)
      goto LABEL_43;
LABEL_47:
    v24 = 0;
    goto LABEL_48;
  }
  if ((-[NSDecimalNumber isEqual:](interestCharged, "isEqual:") & 1) == 0)
    goto LABEL_47;
LABEL_43:
  paymentsToDateAmount = self->_paymentsToDateAmount;
  v23 = (NSDecimalNumber *)v4[9];
  if (paymentsToDateAmount && v23)
    v24 = -[NSDecimalNumber isEqual:](paymentsToDateAmount, "isEqual:");
  else
    v24 = paymentsToDateAmount == v23;
LABEL_48:

  return v24;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_startDate);
  objc_msgSend(v3, "safelyAddObject:", self->_originalEndDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currentEndDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDue);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_interestCharged);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentsToDateAmount);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKInstallmentPlanSummary)initWithCoder:(id)a3
{
  id v4;
  PKInstallmentPlanSummary *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *originalEndDate;
  uint64_t v10;
  NSDate *currentEndDate;
  uint64_t v12;
  NSDecimalNumber *currentBalance;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSDecimalNumber *minimumDue;
  uint64_t v18;
  NSDate *minimumDueDate;
  uint64_t v20;
  NSDecimalNumber *interestCharged;
  uint64_t v22;
  NSDecimalNumber *paymentsToDateAmount;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKInstallmentPlanSummary;
  v5 = -[PKInstallmentPlanSummary init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalEndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    originalEndDate = v5->_originalEndDate;
    v5->_originalEndDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentEndDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentEndDate = v5->_currentEndDate;
    v5->_currentEndDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDue"));
    v16 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDueDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    minimumDueDate = v5->_minimumDueDate;
    v5->_minimumDueDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestCharged"));
    v20 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentsToDateAmount"));
    v22 = objc_claimAutoreleasedReturnValue();
    paymentsToDateAmount = v5->_paymentsToDateAmount;
    v5->_paymentsToDateAmount = (NSDecimalNumber *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalEndDate, CFSTR("originalEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentEndDate, CFSTR("currentEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumDue, CFSTR("minimumDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumDueDate, CFSTR("minimumDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestCharged, CFSTR("interestCharged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentsToDateAmount, CFSTR("paymentsToDateAmount"));

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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDate copyWithZone:](self->_originalEndDate, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDate copyWithZone:](self->_currentEndDate, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_minimumDue, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSDate copyWithZone:](self->_minimumDueDate, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[NSDecimalNumber copyWithZone:](self->_interestCharged, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[NSDecimalNumber copyWithZone:](self->_paymentsToDateAmount, "copyWithZone:", a3);
  v23 = (void *)v5[9];
  v5[9] = v22;

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)originalEndDate
{
  return self->_originalEndDate;
}

- (void)setOriginalEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalEndDate, a3);
}

- (NSDate)currentEndDate
{
  return self->_currentEndDate;
}

- (void)setCurrentEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentEndDate, a3);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDue, a3);
}

- (NSDate)minimumDueDate
{
  return self->_minimumDueDate;
}

- (void)setMinimumDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_minimumDueDate, a3);
}

- (NSDecimalNumber)interestCharged
{
  return self->_interestCharged;
}

- (void)setInterestCharged:(id)a3
{
  objc_storeStrong((id *)&self->_interestCharged, a3);
}

- (NSDecimalNumber)paymentsToDateAmount
{
  return self->_paymentsToDateAmount;
}

- (void)setPaymentsToDateAmount:(id)a3
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsToDateAmount, 0);
  objc_storeStrong((id *)&self->_interestCharged, 0);
  objc_storeStrong((id *)&self->_minimumDueDate, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_currentEndDate, 0);
  objc_storeStrong((id *)&self->_originalEndDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
