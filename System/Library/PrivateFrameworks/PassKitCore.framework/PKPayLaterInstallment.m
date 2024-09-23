@implementation PKPayLaterInstallment

- (PKPayLaterInstallment)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterInstallment *v5;
  uint64_t v6;
  NSString *installmentIdentifier;
  uint64_t v8;
  NSString *planIdentifier;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PKPayLaterAppliedPayment *v18;
  PKPayLaterAppliedPayment *v19;
  uint64_t v20;
  NSArray *appliedPayments;
  __CFString *v22;
  __CFString *v23;
  char v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  int v37;
  uint64_t v38;
  PKCurrencyAmount *totalAmount;
  uint64_t v40;
  PKCurrencyAmount *currentBalance;
  uint64_t v42;
  NSDate *dueDate;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKPayLaterInstallment;
  v5 = -[PKPayLaterInstallment init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("installmentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentIdentifier = v5->_installmentIdentifier;
    v5->_installmentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("planIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("appliedPayments"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v16);
          v18 = [PKPayLaterAppliedPayment alloc];
          v19 = -[PKPayLaterAppliedPayment initWithDictionary:](v18, "initWithDictionary:", v17, (_QWORD)v45);
          objc_msgSend(v11, "safelyAddObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v14);
    }

    v20 = objc_msgSend(v11, "copy");
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v20;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("status"));
    v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 == CFSTR("open"))
      goto LABEL_12;
    if (v22)
    {
      v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("open"));

      if ((v24 & 1) != 0)
      {
LABEL_12:
        v25 = 1;
LABEL_26:

        v5->_status = v25;
        objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("totalAmount"));
        v38 = objc_claimAutoreleasedReturnValue();
        totalAmount = v5->_totalAmount;
        v5->_totalAmount = (PKCurrencyAmount *)v38;

        objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("currentBalance"));
        v40 = objc_claimAutoreleasedReturnValue();
        currentBalance = v5->_currentBalance;
        v5->_currentBalance = (PKCurrencyAmount *)v40;

        objc_msgSend(v4, "PKDateForKey:", CFSTR("dueDate"));
        v42 = objc_claimAutoreleasedReturnValue();
        dueDate = v5->_dueDate;
        v5->_dueDate = (NSDate *)v42;

        v5->_interval = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("interval"));
        goto LABEL_27;
      }
      v26 = v23;
      if (v26 == CFSTR("paid")
        || (v27 = v26,
            v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("paid")),
            v27,
            (v28 & 1) != 0))
      {
        v25 = 3;
        goto LABEL_26;
      }
      v29 = v27;
      if (v29 == CFSTR("paused")
        || (v30 = v29,
            v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("paused")),
            v30,
            (v31 & 1) != 0))
      {
        v25 = 2;
        goto LABEL_26;
      }
      v32 = v30;
      if (v32 == CFSTR("overdue")
        || (v33 = v32,
            v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("overdue")),
            v33,
            (v34 & 1) != 0))
      {
        v25 = 4;
        goto LABEL_26;
      }
      v35 = v33;
      if (v35 == CFSTR("cancelled")
        || (v36 = v35,
            v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("cancelled")),
            v36,
            v37))
      {
        v25 = 5;
        goto LABEL_26;
      }
    }
    v25 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return v5;
}

- (id)amountPaid
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[PKCurrencyAmount currencyAmountBySubtractingCurrencyAmount:](self->_totalAmount, "currencyAmountBySubtractingCurrencyAmount:", self->_currentBalance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "amount"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "pk_isNegativeNumber"),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (BOOL)paymentIdentitiferContributedToInstallment:(id)a3
{
  id v4;
  NSArray *payments;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  payments = self->_payments;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPayLaterInstallment_paymentIdentitiferContributedToInstallment___block_invoke;
  v8[3] = &unk_1E2AC9438;
  v9 = v4;
  v6 = v4;
  LOBYTE(payments) = -[NSArray pk_containsObjectPassingTest:](payments, "pk_containsObjectPassingTest:", v8);

  return (char)payments;
}

uint64_t __68__PKPayLaterInstallment_paymentIdentitiferContributedToInstallment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "paymentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterInstallment *v4;
  PKPayLaterInstallment *v5;
  BOOL v6;

  v4 = (PKPayLaterInstallment *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterInstallment isEqualToPayLaterInstallment:](self, "isEqualToPayLaterInstallment:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterInstallment:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSArray *appliedPayments;
  NSArray *v12;
  void *v13;
  NSString *v14;
  _BOOL4 v15;
  BOOL v16;
  PKCurrencyAmount *totalAmount;
  PKCurrencyAmount *v19;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v21;
  NSDate *dueDate;
  NSDate *v23;
  NSDate *payoffDate;
  NSDate *v25;
  NSArray *payments;
  NSArray *v27;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  v6 = (void *)v4[1];
  v7 = self->_installmentIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_18;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_19;
  }
  appliedPayments = self->_appliedPayments;
  v12 = (NSArray *)v5[3];
  if (appliedPayments && v12)
  {
    if ((-[NSArray isEqual:](appliedPayments, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (appliedPayments != v12)
  {
    goto LABEL_19;
  }
  v13 = (void *)v5[2];
  v7 = self->_planIdentifier;
  v14 = v13;
  if (v7 != v14)
  {
    v9 = v14;
    if (v7 && v14)
    {
      v15 = -[NSString isEqualToString:](v7, "isEqualToString:", v14);

      if (!v15)
        goto LABEL_19;
      goto LABEL_22;
    }
LABEL_18:

    goto LABEL_19;
  }

LABEL_22:
  totalAmount = self->_totalAmount;
  v19 = (PKCurrencyAmount *)v5[5];
  if (totalAmount && v19)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:"))
      goto LABEL_19;
  }
  else if (totalAmount != v19)
  {
    goto LABEL_19;
  }
  currentBalance = self->_currentBalance;
  v21 = (PKCurrencyAmount *)v5[6];
  if (currentBalance && v21)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:"))
      goto LABEL_19;
  }
  else if (currentBalance != v21)
  {
    goto LABEL_19;
  }
  dueDate = self->_dueDate;
  v23 = (NSDate *)v5[7];
  if (dueDate && v23)
  {
    if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (dueDate != v23)
  {
    goto LABEL_19;
  }
  payoffDate = self->_payoffDate;
  v25 = (NSDate *)v5[8];
  if (payoffDate && v25)
  {
    if ((-[NSDate isEqual:](payoffDate, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (payoffDate != v25)
  {
    goto LABEL_19;
  }
  payments = self->_payments;
  v27 = (NSArray *)v5[10];
  if (payments && v27)
  {
    if ((-[NSArray isEqual:](payments, "isEqual:") & 1) == 0)
      goto LABEL_19;
  }
  else if (payments != v27)
  {
    goto LABEL_19;
  }
  if (self->_status == v5[4])
  {
    v16 = self->_interval == v5[9];
    goto LABEL_20;
  }
LABEL_19:
  v16 = 0;
LABEL_20:

  return v16;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_planIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_appliedPayments);
  objc_msgSend(v3, "safelyAddObject:", self->_totalAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_dueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_payoffDate);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_status - v4 + 32 * v4;
  v6 = self->_interval - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("installmentIdentifier: '%@'; "), self->_installmentIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("planIdentifier: '%@'; "), self->_planIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("appliedPayments: '%@'; "), self->_appliedPayments);
  v4 = self->_status - 1;
  if (v4 > 4)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD37F0[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("totalAmount: '%@'; "), self->_totalAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  -[NSDate description](self->_dueDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("dueDate: '%@'; "), v6);

  -[NSDate description](self->_payoffDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("payoffDate: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), self->_payments);
  objc_msgSend(v3, "appendFormat:", CFSTR("interval: %ld; "), self->_interval);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  NSDate *dueDate;
  void *v10;
  NSDate *payoffDate;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_installmentIdentifier, CFSTR("installmentIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_planIdentifier, CFSTR("planIdentifier"));
  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_appliedPayments, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_144);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appliedPayments"));

  v5 = self->_status - 1;
  if (v5 > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD37F0[v5];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("status"));
  -[PKCurrencyAmount dictionaryRepresentation](self->_totalAmount, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("totalAmount"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_currentBalance, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("currentBalance"));

  dueDate = self->_dueDate;
  if (dueDate)
  {
    PKISO8601DateStringFromDate(dueDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dueDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("dueDate"));
  }
  payoffDate = self->_payoffDate;
  if (payoffDate)
  {
    PKISO8601DateStringFromDate(payoffDate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("payOffDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("payOffDate"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_interval);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("interval"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

uint64_t __49__PKPayLaterInstallment_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterInstallment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterInstallment *v5;
  uint64_t v6;
  NSString *installmentIdentifier;
  uint64_t v8;
  NSString *planIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *appliedPayments;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *payments;
  uint64_t v20;
  PKCurrencyAmount *totalAmount;
  uint64_t v22;
  PKCurrencyAmount *currentBalance;
  uint64_t v24;
  NSDate *dueDate;
  uint64_t v26;
  NSDate *payoffDate;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterInstallment;
  v5 = -[PKPayLaterInstallment init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    installmentIdentifier = v5->_installmentIdentifier;
    v5->_installmentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("appliedPayments"));
    v13 = objc_claimAutoreleasedReturnValue();
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("payments"));
    v18 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSArray *)v18;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalAmount"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v22 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payOffDate"));
    v26 = objc_claimAutoreleasedReturnValue();
    payoffDate = v5->_payoffDate;
    v5->_payoffDate = (NSDate *)v26;

    v5->_interval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *installmentIdentifier;
  id v5;

  installmentIdentifier = self->_installmentIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", installmentIdentifier, CFSTR("installmentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planIdentifier, CFSTR("planIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appliedPayments, CFSTR("appliedPayments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalAmount, CFSTR("totalAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payoffDate, CFSTR("payOffDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_interval, CFSTR("interval"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterInstallment *v5;
  uint64_t v6;
  NSString *installmentIdentifier;
  uint64_t v8;
  NSArray *payments;
  uint64_t v10;
  NSString *planIdentifier;
  uint64_t v12;
  NSArray *appliedPayments;
  PKCurrencyAmount *v14;
  PKCurrencyAmount *totalAmount;
  PKCurrencyAmount *v16;
  PKCurrencyAmount *currentBalance;
  uint64_t v18;
  NSDate *dueDate;
  uint64_t v20;
  NSDate *payoffDate;

  v5 = -[PKPayLaterInstallment init](+[PKPayLaterInstallment allocWithZone:](PKPayLaterInstallment, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_installmentIdentifier, "copyWithZone:", a3);
  installmentIdentifier = v5->_installmentIdentifier;
  v5->_installmentIdentifier = (NSString *)v6;

  v8 = -[NSArray copyWithZone:](self->_payments, "copyWithZone:", a3);
  payments = v5->_payments;
  v5->_payments = (NSArray *)v8;

  v10 = -[NSString copyWithZone:](self->_planIdentifier, "copyWithZone:", a3);
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v10;

  v12 = -[NSArray copyWithZone:](self->_appliedPayments, "copyWithZone:", a3);
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v12;

  v14 = -[PKCurrencyAmount copyWithZone:](self->_totalAmount, "copyWithZone:", a3);
  totalAmount = v5->_totalAmount;
  v5->_totalAmount = v14;

  v16 = -[PKCurrencyAmount copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v16;

  v18 = -[NSDate copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  dueDate = v5->_dueDate;
  v5->_dueDate = (NSDate *)v18;

  v20 = -[NSDate copyWithZone:](self->_payoffDate, "copyWithZone:", a3);
  payoffDate = v5->_payoffDate;
  v5->_payoffDate = (NSDate *)v20;

  v5->_status = self->_status;
  v5->_interval = self->_interval;
  return v5;
}

- (NSString)installmentIdentifier
{
  return self->_installmentIdentifier;
}

- (void)setInstallmentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)appliedPayments
{
  return self->_appliedPayments;
}

- (void)setAppliedPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)payoffDate
{
  return self->_payoffDate;
}

- (void)setPayoffDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_payoffDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_appliedPayments, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentIdentifier, 0);
}

@end
