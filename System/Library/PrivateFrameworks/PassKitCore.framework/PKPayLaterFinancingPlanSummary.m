@implementation PKPayLaterFinancingPlanSummary

- (PKPayLaterFinancingPlanSummary)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanSummary *v5;
  uint64_t v6;
  NSDecimalNumber *apr;
  uint64_t v8;
  PKCurrencyAmount *pastDueAmount;
  uint64_t v10;
  PKCurrencyAmount *totalAmount;
  uint64_t v12;
  PKCurrencyAmount *initialAmount;
  uint64_t v14;
  PKCurrencyAmount *currentBalance;
  uint64_t v16;
  PKCurrencyAmount *installmentAmount;
  uint64_t v18;
  PKCurrencyAmount *totalAdjustments;
  uint64_t v20;
  PKCurrencyAmount *totalPrincipal;
  uint64_t v22;
  PKCurrencyAmount *paymentAmountToDate;
  uint64_t v24;
  PKCurrencyAmount *totalInterest;
  uint64_t v26;
  PKCurrencyAmount *interestPaidToDate;
  uint64_t v28;
  PKCurrencyAmount *principalPaidToDate;
  uint64_t v30;
  PKCurrencyAmount *payoffAmount;
  uint64_t v32;
  NSDate *transactionDate;
  uint64_t v34;
  NSDate *startInstallmentDate;
  uint64_t v36;
  NSDate *nextInstallmentDueDate;
  uint64_t v38;
  NSDate *endInstallmentDate;
  uint64_t v40;
  NSDate *cancellationDate;
  void *v42;
  uint64_t v43;
  NSString *panSuffix;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PKPayLaterFinancingPlanSummary;
  v5 = -[PKPayLaterFinancingPlanSummary init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("apr"));
    v6 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v6;

    v5->_hasAPR = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasAPR"));
    v5->_daysPastDue = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("daysPastDue"));
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("pastDueAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (PKCurrencyAmount *)v8;

    v5->_installmentCount = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("installmentCount"));
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("initialAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    initialAmount = v5->_initialAmount;
    v5->_initialAmount = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("currentBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("installmentAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v16;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalAdjustments"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalAdjustments = v5->_totalAdjustments;
    v5->_totalAdjustments = (PKCurrencyAmount *)v18;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalPrincipal"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKCurrencyAmount *)v20;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("paymentAmountToDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    paymentAmountToDate = v5->_paymentAmountToDate;
    v5->_paymentAmountToDate = (PKCurrencyAmount *)v22;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalInterest"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v24;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("interestPaidToDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    interestPaidToDate = v5->_interestPaidToDate;
    v5->_interestPaidToDate = (PKCurrencyAmount *)v26;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("principalPaidToDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    principalPaidToDate = v5->_principalPaidToDate;
    v5->_principalPaidToDate = (PKCurrencyAmount *)v28;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("payoffAmount"));
    v30 = objc_claimAutoreleasedReturnValue();
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v30;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("transactionDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v32;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("startInstallmentDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    startInstallmentDate = v5->_startInstallmentDate;
    v5->_startInstallmentDate = (NSDate *)v34;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("nextInstallmentDueDate"));
    v36 = objc_claimAutoreleasedReturnValue();
    nextInstallmentDueDate = v5->_nextInstallmentDueDate;
    v5->_nextInstallmentDueDate = (NSDate *)v36;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("endInstallmentDate"));
    v38 = objc_claimAutoreleasedReturnValue();
    endInstallmentDate = v5->_endInstallmentDate;
    v5->_endInstallmentDate = (NSDate *)v38;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("cancellationDate"));
    v40 = objc_claimAutoreleasedReturnValue();
    cancellationDate = v5->_cancellationDate;
    v5->_cancellationDate = (NSDate *)v40;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("cancellationReason"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cancellationReason = PKPayLaterFinancingPlanCancellationReasonFromString(v42);

    objc_msgSend(v4, "PKStringForKey:", CFSTR("panSuffix"));
    v43 = objc_claimAutoreleasedReturnValue();
    panSuffix = v5->_panSuffix;
    v5->_panSuffix = (NSString *)v43;

  }
  return v5;
}

- (double)progress
{
  PKCurrencyAmount *paymentAmountToDate;
  double v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  float v15;

  paymentAmountToDate = self->_paymentAmountToDate;
  v4 = 0.0;
  if (paymentAmountToDate && self->_totalAmount)
  {
    -[PKCurrencyAmount currency](paymentAmountToDate, "currency");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount currency](self->_totalAmount, "currency");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
      {

        v11 = v7;
        goto LABEL_15;
      }
      v10 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v10 & 1) == 0)
        return v4;
    }
    -[PKCurrencyAmount amount](self->_paymentAmountToDate, "amount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](self->_totalAmount, "amount");
    v12 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12;
    if (!v11 || !v12)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToNumber:", v7) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "isEqualToNumber:", v13);

      if ((v14 & 1) != 0)
      {
LABEL_16:

        return v4;
      }
      objc_msgSend(v11, "decimalNumberByDividingBy:", v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v4 = v15;
    }
LABEL_15:

    goto LABEL_16;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanSummary *v4;
  PKPayLaterFinancingPlanSummary *v5;
  BOOL v6;

  v4 = (PKPayLaterFinancingPlanSummary *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFinancingPlanSummary isEqualToPayLaterFinancingPlanSummary:](self, "isEqualToPayLaterFinancingPlanSummary:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlanSummary:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *apr;
  NSDecimalNumber *v6;
  BOOL v7;
  char v8;
  PKCurrencyAmount *pastDueAmount;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *totalAmount;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *initialAmount;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v16;
  PKCurrencyAmount *installmentAmount;
  PKCurrencyAmount *v18;
  PKCurrencyAmount *totalAdjustments;
  PKCurrencyAmount *v20;
  PKCurrencyAmount *totalPrincipal;
  PKCurrencyAmount *v22;
  PKCurrencyAmount *paymentAmountToDate;
  PKCurrencyAmount *v24;
  PKCurrencyAmount *totalInterest;
  PKCurrencyAmount *v26;
  PKCurrencyAmount *interestPaidToDate;
  PKCurrencyAmount *v28;
  PKCurrencyAmount *principalPaidToDate;
  PKCurrencyAmount *v30;
  PKCurrencyAmount *payoffAmount;
  PKCurrencyAmount *v32;
  NSDate *transactionDate;
  NSDate *v34;
  NSDate *startInstallmentDate;
  NSDate *v36;
  NSDate *nextInstallmentDueDate;
  NSDate *v38;
  NSDate *endInstallmentDate;
  NSDate *v40;
  NSDate *cancellationDate;
  NSDate *v42;
  NSString *panSuffix;
  void *v44;
  NSString *v45;
  NSString *v46;
  NSString *v47;
  char v48;

  v4 = a3;
  if (!v4)
    goto LABEL_102;
  apr = self->_apr;
  v6 = (NSDecimalNumber *)v4[2];
  if (apr)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (apr != v6)
      goto LABEL_102;
  }
  else
  {
    v8 = -[NSDecimalNumber isEqual:](apr, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_102;
  }
  if (self->_hasAPR != *((unsigned __int8 *)v4 + 8)
    || self->_installmentCount != v4[5]
    || self->_daysPastDue != v4[3]
    || self->_cancellationReason != v4[22])
  {
    goto LABEL_102;
  }
  pastDueAmount = self->_pastDueAmount;
  v10 = (PKCurrencyAmount *)v4[4];
  if (pastDueAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](pastDueAmount, "isEqual:"))
      goto LABEL_102;
  }
  else if (pastDueAmount != v10)
  {
    goto LABEL_102;
  }
  totalAmount = self->_totalAmount;
  v12 = (PKCurrencyAmount *)v4[6];
  if (totalAmount && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:"))
      goto LABEL_102;
  }
  else if (totalAmount != v12)
  {
    goto LABEL_102;
  }
  initialAmount = self->_initialAmount;
  v14 = (PKCurrencyAmount *)v4[7];
  if (initialAmount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](initialAmount, "isEqual:"))
      goto LABEL_102;
  }
  else if (initialAmount != v14)
  {
    goto LABEL_102;
  }
  currentBalance = self->_currentBalance;
  v16 = (PKCurrencyAmount *)v4[8];
  if (currentBalance && v16)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:"))
      goto LABEL_102;
  }
  else if (currentBalance != v16)
  {
    goto LABEL_102;
  }
  installmentAmount = self->_installmentAmount;
  v18 = (PKCurrencyAmount *)v4[9];
  if (installmentAmount && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](installmentAmount, "isEqual:"))
      goto LABEL_102;
  }
  else if (installmentAmount != v18)
  {
    goto LABEL_102;
  }
  totalAdjustments = self->_totalAdjustments;
  v20 = (PKCurrencyAmount *)v4[10];
  if (totalAdjustments && v20)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAdjustments, "isEqual:"))
      goto LABEL_102;
  }
  else if (totalAdjustments != v20)
  {
    goto LABEL_102;
  }
  totalPrincipal = self->_totalPrincipal;
  v22 = (PKCurrencyAmount *)v4[11];
  if (totalPrincipal && v22)
  {
    if (!-[PKCurrencyAmount isEqual:](totalPrincipal, "isEqual:"))
      goto LABEL_102;
  }
  else if (totalPrincipal != v22)
  {
    goto LABEL_102;
  }
  paymentAmountToDate = self->_paymentAmountToDate;
  v24 = (PKCurrencyAmount *)v4[12];
  if (paymentAmountToDate && v24)
  {
    if (!-[PKCurrencyAmount isEqual:](paymentAmountToDate, "isEqual:"))
      goto LABEL_102;
  }
  else if (paymentAmountToDate != v24)
  {
    goto LABEL_102;
  }
  totalInterest = self->_totalInterest;
  v26 = (PKCurrencyAmount *)v4[13];
  if (totalInterest && v26)
  {
    if (!-[PKCurrencyAmount isEqual:](totalInterest, "isEqual:"))
      goto LABEL_102;
  }
  else if (totalInterest != v26)
  {
    goto LABEL_102;
  }
  interestPaidToDate = self->_interestPaidToDate;
  v28 = (PKCurrencyAmount *)v4[15];
  if (interestPaidToDate && v28)
  {
    if (!-[PKCurrencyAmount isEqual:](interestPaidToDate, "isEqual:"))
      goto LABEL_102;
  }
  else if (interestPaidToDate != v28)
  {
    goto LABEL_102;
  }
  principalPaidToDate = self->_principalPaidToDate;
  v30 = (PKCurrencyAmount *)v4[14];
  if (principalPaidToDate && v30)
  {
    if (!-[PKCurrencyAmount isEqual:](principalPaidToDate, "isEqual:"))
      goto LABEL_102;
  }
  else if (principalPaidToDate != v30)
  {
    goto LABEL_102;
  }
  payoffAmount = self->_payoffAmount;
  v32 = (PKCurrencyAmount *)v4[16];
  if (payoffAmount && v32)
  {
    if (!-[PKCurrencyAmount isEqual:](payoffAmount, "isEqual:"))
      goto LABEL_102;
  }
  else if (payoffAmount != v32)
  {
    goto LABEL_102;
  }
  transactionDate = self->_transactionDate;
  v34 = (NSDate *)v4[17];
  if (transactionDate && v34)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0)
      goto LABEL_102;
  }
  else if (transactionDate != v34)
  {
    goto LABEL_102;
  }
  startInstallmentDate = self->_startInstallmentDate;
  v36 = (NSDate *)v4[18];
  if (startInstallmentDate && v36)
  {
    if ((-[NSDate isEqual:](startInstallmentDate, "isEqual:") & 1) == 0)
      goto LABEL_102;
  }
  else if (startInstallmentDate != v36)
  {
    goto LABEL_102;
  }
  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  v38 = (NSDate *)v4[19];
  if (nextInstallmentDueDate && v38)
  {
    if ((-[NSDate isEqual:](nextInstallmentDueDate, "isEqual:") & 1) == 0)
      goto LABEL_102;
  }
  else if (nextInstallmentDueDate != v38)
  {
    goto LABEL_102;
  }
  endInstallmentDate = self->_endInstallmentDate;
  v40 = (NSDate *)v4[20];
  if (endInstallmentDate && v40)
  {
    if ((-[NSDate isEqual:](endInstallmentDate, "isEqual:") & 1) == 0)
      goto LABEL_102;
  }
  else if (endInstallmentDate != v40)
  {
    goto LABEL_102;
  }
  cancellationDate = self->_cancellationDate;
  v42 = (NSDate *)v4[21];
  if (!cancellationDate || !v42)
  {
    if (cancellationDate == v42)
      goto LABEL_97;
LABEL_102:
    v48 = 0;
    goto LABEL_103;
  }
  if ((-[NSDate isEqual:](cancellationDate, "isEqual:") & 1) == 0)
    goto LABEL_102;
LABEL_97:
  panSuffix = self->_panSuffix;
  v44 = (void *)v4[23];
  v45 = panSuffix;
  v46 = v44;
  v47 = v46;
  if (v45 == v46)
  {
    v48 = 1;
  }
  else
  {
    v48 = 0;
    if (v45 && v46)
      v48 = -[NSString isEqualToString:](v45, "isEqualToString:", v46);
  }

LABEL_103:
  return v48;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_apr);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_initialAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAdjustments);
  objc_msgSend(v3, "safelyAddObject:", self->_totalPrincipal);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentAmountToDate);
  objc_msgSend(v3, "safelyAddObject:", self->_interestPaidToDate);
  objc_msgSend(v3, "safelyAddObject:", self->_principalPaidToDate);
  objc_msgSend(v3, "safelyAddObject:", self->_payoffAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_totalInterest);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDate);
  objc_msgSend(v3, "safelyAddObject:", self->_startInstallmentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_nextInstallmentDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_endInstallmentDate);
  objc_msgSend(v3, "safelyAddObject:", self->_cancellationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_panSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_pastDueAmount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_hasAPR - v4 + 32 * v4;
  v6 = self->_installmentCount - v5 + 32 * v5;
  v7 = self->_daysPastDue - v6 + 32 * v6;
  v8 = self->_cancellationReason - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  -[NSDecimalNumber stringValue](self->_apr, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("apr: '%@'; "), v4);

  if (self->_hasAPR)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasAPR: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("daysPastDue: %ld; "), self->_daysPastDue);
  objc_msgSend(v3, "appendFormat:", CFSTR("pastDueAmount: '%@'; "), self->_pastDueAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentCount: '%lu'; "), self->_installmentCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: '%@'; "), self->_totalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("initialAmount: '%@'; "), self->_initialAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentAmount: '%@'; "), self->_installmentAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAdjustments: '%@'; "), self->_totalAdjustments);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalPrincipal: '%@'; "), self->_totalPrincipal);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalInterest: '%@'; "), self->_totalInterest);
  objc_msgSend(v3, "appendFormat:", CFSTR("interestPaidToDate: '%@'; "), self->_interestPaidToDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("principalPaidToDate: '%@'; "), self->_principalPaidToDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("payoffAmount: '%@'; "), self->_payoffAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentAmountToDate: '%@'; "), self->_paymentAmountToDate);
  -[NSDate description](self->_transactionDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionDate: '%@'; "), v6);

  -[NSDate description](self->_startInstallmentDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("startInstallmentDate: '%@'; "), v7);

  -[NSDate description](self->_nextInstallmentDueDate, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("nextInstallmentDueDate: '%@'; "), v8);

  -[NSDate description](self->_endInstallmentDate, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endInstallmentDate: '%@'; "), v9);

  -[NSDate description](self->_cancellationDate, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellationDate: '%@'; "), v10);

  PKPayLaterFinancingPlanCancellationReasonToString(self->_cancellationReason);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellationReason: '%@'; "), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("panSuffix: '%@'; "), self->_panSuffix);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDate *transactionDate;
  void *v21;
  NSDate *startInstallmentDate;
  void *v23;
  NSDate *nextInstallmentDueDate;
  void *v25;
  NSDate *endInstallmentDate;
  void *v27;
  NSDate *cancellationDate;
  void *v29;
  void *v30;
  void *v31;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSDecimalNumber stringValue](self->_apr, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("apr"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAPR);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("hasAPR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_daysPastDue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("daysPastDue"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_pastDueAmount, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("pastDueAmount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_installmentCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("installmentCount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalAmount, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("totalAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_initialAmount, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("initialAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_currentBalance, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("currentBalance"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_installmentAmount, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("installmentAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalAdjustments, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("totalAdjustments"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalPrincipal, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("totalPrincipal"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_paymentAmountToDate, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("paymentAmountToDate"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_interestPaidToDate, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("interestPaidToDate"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_principalPaidToDate, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("principalPaidToDate"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_payoffAmount, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("payoffAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalInterest, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("totalInterest"));

  transactionDate = self->_transactionDate;
  if (transactionDate)
  {
    PKISO8601DateStringFromDate(transactionDate);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("transactionDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("transactionDate"));
  }
  startInstallmentDate = self->_startInstallmentDate;
  if (startInstallmentDate)
  {
    PKISO8601DateStringFromDate(startInstallmentDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("startInstallmentDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("startInstallmentDate"));
  }
  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  if (nextInstallmentDueDate)
  {
    PKISO8601DateStringFromDate(nextInstallmentDueDate);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("nextInstallmentDueDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("nextInstallmentDueDate"));
  }
  endInstallmentDate = self->_endInstallmentDate;
  if (endInstallmentDate)
  {
    PKISO8601DateStringFromDate(endInstallmentDate);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("endInstallmentDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("endInstallmentDate"));
  }
  cancellationDate = self->_cancellationDate;
  if (cancellationDate)
  {
    PKISO8601DateStringFromDate(cancellationDate);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("cancellationDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("cancellationDate"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_panSuffix, CFSTR("panSuffix"));
  PKPayLaterFinancingPlanCancellationReasonToString(self->_cancellationReason);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("cancellationReason"));

  v31 = (void *)objc_msgSend(v3, "copy");
  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanSummary)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanSummary *v5;
  uint64_t v6;
  NSDecimalNumber *apr;
  uint64_t v8;
  PKCurrencyAmount *pastDueAmount;
  uint64_t v10;
  PKCurrencyAmount *totalAmount;
  uint64_t v12;
  PKCurrencyAmount *initialAmount;
  uint64_t v14;
  PKCurrencyAmount *currentBalance;
  uint64_t v16;
  PKCurrencyAmount *installmentAmount;
  uint64_t v18;
  PKCurrencyAmount *totalAdjustments;
  uint64_t v20;
  PKCurrencyAmount *totalPrincipal;
  uint64_t v22;
  PKCurrencyAmount *paymentAmountToDate;
  uint64_t v24;
  PKCurrencyAmount *totalInterest;
  uint64_t v26;
  PKCurrencyAmount *interestPaidToDate;
  uint64_t v28;
  PKCurrencyAmount *principalPaidToDate;
  uint64_t v30;
  PKCurrencyAmount *payoffAmount;
  uint64_t v32;
  NSDate *transactionDate;
  uint64_t v34;
  NSDate *startInstallmentDate;
  uint64_t v36;
  NSDate *nextInstallmentDueDate;
  uint64_t v38;
  NSDate *endInstallmentDate;
  uint64_t v40;
  NSDate *cancellationDate;
  uint64_t v42;
  NSString *panSuffix;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterFinancingPlanSummary;
  v5 = -[PKPayLaterFinancingPlanSummary init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apr"));
    v6 = objc_claimAutoreleasedReturnValue();
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v6;

    v5->_hasAPR = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAPR"));
    v5->_daysPastDue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("daysPastDue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pastDueAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    pastDueAmount = v5->_pastDueAmount;
    v5->_pastDueAmount = (PKCurrencyAmount *)v8;

    v5->_installmentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("installmentCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialAmount"));
    v12 = objc_claimAutoreleasedReturnValue();
    initialAmount = v5->_initialAmount;
    v5->_initialAmount = (PKCurrencyAmount *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKCurrencyAmount *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAdjustments"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalAdjustments = v5->_totalAdjustments;
    v5->_totalAdjustments = (PKCurrencyAmount *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalPrincipal"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKCurrencyAmount *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentAmountToDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    paymentAmountToDate = v5->_paymentAmountToDate;
    v5->_paymentAmountToDate = (PKCurrencyAmount *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalInterest"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKCurrencyAmount *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestPaidToDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    interestPaidToDate = v5->_interestPaidToDate;
    v5->_interestPaidToDate = (PKCurrencyAmount *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("principalPaidToDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    principalPaidToDate = v5->_principalPaidToDate;
    v5->_principalPaidToDate = (PKCurrencyAmount *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payoffAmount"));
    v30 = objc_claimAutoreleasedReturnValue();
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v32 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startInstallmentDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    startInstallmentDate = v5->_startInstallmentDate;
    v5->_startInstallmentDate = (NSDate *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextInstallmentDueDate"));
    v36 = objc_claimAutoreleasedReturnValue();
    nextInstallmentDueDate = v5->_nextInstallmentDueDate;
    v5->_nextInstallmentDueDate = (NSDate *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endInstallmentDate"));
    v38 = objc_claimAutoreleasedReturnValue();
    endInstallmentDate = v5->_endInstallmentDate;
    v5->_endInstallmentDate = (NSDate *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancellationDate"));
    v40 = objc_claimAutoreleasedReturnValue();
    cancellationDate = v5->_cancellationDate;
    v5->_cancellationDate = (NSDate *)v40;

    v5->_cancellationReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cancellationReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("panSuffix"));
    v42 = objc_claimAutoreleasedReturnValue();
    panSuffix = v5->_panSuffix;
    v5->_panSuffix = (NSString *)v42;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *apr;
  id v5;

  apr = self->_apr;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", apr, CFSTR("apr"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAPR, CFSTR("hasAPR"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_daysPastDue, CFSTR("daysPastDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pastDueAmount, CFSTR("pastDueAmount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_installmentCount, CFSTR("installmentCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialAmount, CFSTR("initialAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentAmount, CFSTR("installmentAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAdjustments, CFSTR("totalAdjustments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalPrincipal, CFSTR("totalPrincipal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentAmountToDate, CFSTR("paymentAmountToDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalInterest, CFSTR("totalInterest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestPaidToDate, CFSTR("interestPaidToDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_principalPaidToDate, CFSTR("principalPaidToDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payoffAmount, CFSTR("payoffAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startInstallmentDate, CFSTR("startInstallmentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextInstallmentDueDate, CFSTR("nextInstallmentDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endInstallmentDate, CFSTR("endInstallmentDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cancellationDate, CFSTR("cancellationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cancellationReason, CFSTR("cancellationReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_panSuffix, CFSTR("panSuffix"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingPlanSummary *v5;
  uint64_t v6;
  NSDecimalNumber *apr;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *pastDueAmount;
  PKCurrencyAmount *v10;
  PKCurrencyAmount *totalAmount;
  PKCurrencyAmount *v12;
  PKCurrencyAmount *initialAmount;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v16;
  PKCurrencyAmount *installmentAmount;
  PKCurrencyAmount *v18;
  PKCurrencyAmount *totalAdjustments;
  PKCurrencyAmount *v20;
  PKCurrencyAmount *totalPrincipal;
  PKCurrencyAmount *v22;
  PKCurrencyAmount *paymentAmountToDate;
  PKCurrencyAmount *v24;
  PKCurrencyAmount *totalInterest;
  PKCurrencyAmount *v26;
  PKCurrencyAmount *interestPaidToDate;
  PKCurrencyAmount *v28;
  PKCurrencyAmount *principalPaidToDate;
  PKCurrencyAmount *v30;
  PKCurrencyAmount *payoffAmount;
  uint64_t v32;
  NSDate *transactionDate;
  uint64_t v34;
  NSDate *startInstallmentDate;
  uint64_t v36;
  NSDate *nextInstallmentDueDate;
  uint64_t v38;
  NSDate *endInstallmentDate;
  uint64_t v40;
  NSDate *cancellationDate;
  uint64_t v42;
  NSString *panSuffix;

  v5 = -[PKPayLaterFinancingPlanSummary init](+[PKPayLaterFinancingPlanSummary allocWithZone:](PKPayLaterFinancingPlanSummary, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_apr, "copyWithZone:", a3);
  apr = v5->_apr;
  v5->_apr = (NSDecimalNumber *)v6;

  v5->_hasAPR = self->_hasAPR;
  v5->_installmentCount = self->_installmentCount;
  v5->_daysPastDue = self->_daysPastDue;
  v5->_cancellationReason = self->_cancellationReason;
  v8 = -[PKCurrencyAmount copyWithZone:](self->_pastDueAmount, "copyWithZone:", a3);
  pastDueAmount = v5->_pastDueAmount;
  v5->_pastDueAmount = v8;

  v10 = -[PKCurrencyAmount copyWithZone:](self->_totalAmount, "copyWithZone:", a3);
  totalAmount = v5->_totalAmount;
  v5->_totalAmount = v10;

  v12 = -[PKCurrencyAmount copyWithZone:](self->_initialAmount, "copyWithZone:", a3);
  initialAmount = v5->_initialAmount;
  v5->_initialAmount = v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v14;

  v16 = -[PKCurrencyAmount copyWithZone:](self->_installmentAmount, "copyWithZone:", a3);
  installmentAmount = v5->_installmentAmount;
  v5->_installmentAmount = v16;

  v18 = -[PKCurrencyAmount copyWithZone:](self->_totalAdjustments, "copyWithZone:", a3);
  totalAdjustments = v5->_totalAdjustments;
  v5->_totalAdjustments = v18;

  v20 = -[PKCurrencyAmount copyWithZone:](self->_totalPrincipal, "copyWithZone:", a3);
  totalPrincipal = v5->_totalPrincipal;
  v5->_totalPrincipal = v20;

  v22 = -[PKCurrencyAmount copyWithZone:](self->_paymentAmountToDate, "copyWithZone:", a3);
  paymentAmountToDate = v5->_paymentAmountToDate;
  v5->_paymentAmountToDate = v22;

  v24 = -[PKCurrencyAmount copyWithZone:](self->_totalInterest, "copyWithZone:", a3);
  totalInterest = v5->_totalInterest;
  v5->_totalInterest = v24;

  v26 = -[PKCurrencyAmount copyWithZone:](self->_interestPaidToDate, "copyWithZone:", a3);
  interestPaidToDate = v5->_interestPaidToDate;
  v5->_interestPaidToDate = v26;

  v28 = -[PKCurrencyAmount copyWithZone:](self->_principalPaidToDate, "copyWithZone:", a3);
  principalPaidToDate = v5->_principalPaidToDate;
  v5->_principalPaidToDate = v28;

  v30 = -[PKCurrencyAmount copyWithZone:](self->_payoffAmount, "copyWithZone:", a3);
  payoffAmount = v5->_payoffAmount;
  v5->_payoffAmount = v30;

  v32 = -[NSDate copyWithZone:](self->_transactionDate, "copyWithZone:", a3);
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = (NSDate *)v32;

  v34 = -[NSDate copyWithZone:](self->_startInstallmentDate, "copyWithZone:", a3);
  startInstallmentDate = v5->_startInstallmentDate;
  v5->_startInstallmentDate = (NSDate *)v34;

  v36 = -[NSDate copyWithZone:](self->_nextInstallmentDueDate, "copyWithZone:", a3);
  nextInstallmentDueDate = v5->_nextInstallmentDueDate;
  v5->_nextInstallmentDueDate = (NSDate *)v36;

  v38 = -[NSDate copyWithZone:](self->_endInstallmentDate, "copyWithZone:", a3);
  endInstallmentDate = v5->_endInstallmentDate;
  v5->_endInstallmentDate = (NSDate *)v38;

  v40 = -[NSDate copyWithZone:](self->_cancellationDate, "copyWithZone:", a3);
  cancellationDate = v5->_cancellationDate;
  v5->_cancellationDate = (NSDate *)v40;

  v42 = -[NSString copyWithZone:](self->_panSuffix, "copyWithZone:", a3);
  panSuffix = v5->_panSuffix;
  v5->_panSuffix = (NSString *)v42;

  return v5;
}

- (BOOL)isNextInstallmentPastDue
{
  NSDate *nextInstallmentDueDate;
  void *v3;

  nextInstallmentDueDate = self->_nextInstallmentDueDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(nextInstallmentDueDate) = -[NSDate compare:](nextInstallmentDueDate, "compare:", v3) == NSOrderedAscending;

  return (char)nextInstallmentDueDate;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (int64_t)daysPastDue
{
  return self->_daysPastDue;
}

- (void)setDaysPastDue:(int64_t)a3
{
  self->_daysPastDue = a3;
}

- (PKCurrencyAmount)pastDueAmount
{
  return self->_pastDueAmount;
}

- (void)setPastDueAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(unint64_t)a3
{
  self->_installmentCount = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (PKCurrencyAmount)initialAmount
{
  return self->_initialAmount;
}

- (void)setInitialAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PKCurrencyAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PKCurrencyAmount)totalAdjustments
{
  return self->_totalAdjustments;
}

- (void)setTotalAdjustments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PKCurrencyAmount)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKCurrencyAmount)paymentAmountToDate
{
  return self->_paymentAmountToDate;
}

- (void)setPaymentAmountToDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PKCurrencyAmount)totalInterest
{
  return self->_totalInterest;
}

- (void)setTotalInterest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PKCurrencyAmount)principalPaidToDate
{
  return self->_principalPaidToDate;
}

- (void)setPrincipalPaidToDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKCurrencyAmount)interestPaidToDate
{
  return self->_interestPaidToDate;
}

- (void)setInterestPaidToDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (PKCurrencyAmount)payoffAmount
{
  return self->_payoffAmount;
}

- (void)setPayoffAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDate)startInstallmentDate
{
  return self->_startInstallmentDate;
}

- (void)setStartInstallmentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDate)nextInstallmentDueDate
{
  return self->_nextInstallmentDueDate;
}

- (void)setNextInstallmentDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDate)endInstallmentDate
{
  return self->_endInstallmentDate;
}

- (void)setEndInstallmentDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDate)cancellationDate
{
  return self->_cancellationDate;
}

- (void)setCancellationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (unint64_t)cancellationReason
{
  return self->_cancellationReason;
}

- (void)setCancellationReason:(unint64_t)a3
{
  self->_cancellationReason = a3;
}

- (NSString)panSuffix
{
  return self->_panSuffix;
}

- (void)setPanSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panSuffix, 0);
  objc_storeStrong((id *)&self->_cancellationDate, 0);
  objc_storeStrong((id *)&self->_endInstallmentDate, 0);
  objc_storeStrong((id *)&self->_nextInstallmentDueDate, 0);
  objc_storeStrong((id *)&self->_startInstallmentDate, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_payoffAmount, 0);
  objc_storeStrong((id *)&self->_interestPaidToDate, 0);
  objc_storeStrong((id *)&self->_principalPaidToDate, 0);
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_paymentAmountToDate, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_totalAdjustments, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_initialAmount, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_pastDueAmount, 0);
  objc_storeStrong((id *)&self->_apr, 0);
}

@end
