@implementation PKCreditInstallmentPlanPayment

- (PKCreditInstallmentPlanPayment)initWithDictionary:(id)a3
{
  id v4;
  PKCreditInstallmentPlanPayment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *statementIdentifier;
  uint64_t v10;
  NSString *currencyCode;
  uint64_t v12;
  NSDecimalNumber *originalAmountDue;
  uint64_t v14;
  NSDecimalNumber *amountDue;
  uint64_t v16;
  NSDecimalNumber *amountPaid;
  uint64_t v18;
  NSDate *dueDate;
  uint64_t v20;
  NSDate *statementDate;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *lineItems;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKCreditInstallmentPlanPayment;
  v5 = -[PKCreditInstallmentPlanPayment init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("statementIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("originalAmountDue"));
    v12 = objc_claimAutoreleasedReturnValue();
    originalAmountDue = v5->_originalAmountDue;
    v5->_originalAmountDue = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amountDue"));
    v14 = objc_claimAutoreleasedReturnValue();
    amountDue = v5->_amountDue;
    v5->_amountDue = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amountPaid"));
    v16 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("dueDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v18;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("statementDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    statementDate = v5->_statementDate;
    v5->_statementDate = (NSDate *)v20;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("lineItems"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "pk_arrayByApplyingBlock:", &__block_literal_global_62);
      v24 = objc_claimAutoreleasedReturnValue();
      lineItems = v5->_lineItems;
      v5->_lineItems = (NSArray *)v24;

    }
  }

  return v5;
}

PKCreditInstallmentPlanLineItem *__53__PKCreditInstallmentPlanPayment_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCreditInstallmentPlanLineItem *v3;

  v2 = a2;
  v3 = -[PKCreditInstallmentPlanLineItem initWithDictionary:]([PKCreditInstallmentPlanLineItem alloc], "initWithDictionary:", v2);

  return v3;
}

- (BOOL)isPaid
{
  NSDecimalNumber *amountPaid;
  void *v3;

  amountPaid = self->_amountPaid;
  if (amountPaid)
  {
    if (self->_amountDue)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(amountPaid) = -[NSDecimalNumber compare:](amountPaid, "compare:", v3) == NSOrderedDescending;

    }
    else
    {
      LOBYTE(amountPaid) = 0;
    }
  }
  return (char)amountPaid;
}

- (NSString)localizedDisplay
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_paymentCount && self->_paymentNumber)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_paymentNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromNumber:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_paymentCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromNumber:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedBeekmanString(CFSTR("INSTALLMENT_COUNT_FORMAT"), CFSTR("%@%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditInstallmentPlanPayment *v4;
  PKCreditInstallmentPlanPayment *v5;
  BOOL v6;

  v4 = (PKCreditInstallmentPlanPayment *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditInstallmentPlanPayment isEqualToInstallmentPlanPayment:](self, "isEqualToInstallmentPlanPayment:", v5);

  return v6;
}

- (BOOL)isEqualToInstallmentPlanPayment:(id)a3
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
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  BOOL v17;
  NSDecimalNumber *originalAmountDue;
  NSDecimalNumber *v20;
  NSDecimalNumber *amountDue;
  NSDecimalNumber *v22;
  NSDecimalNumber *amountPaid;
  NSDecimalNumber *v24;
  NSDate *dueDate;
  NSDate *v26;
  NSDate *statementDate;
  NSDate *v28;
  NSArray *lineItems;
  NSArray *v30;
  PKCreditAccountStatement *statement;
  PKCreditAccountStatement *v32;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_20;
  v6 = (void *)v4[1];
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
  v11 = (void *)v5[2];
  v7 = self->_statementIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

  }
  else
  {
    v9 = v12;
    if (!v7 || !v12)
      goto LABEL_19;
    v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

    if (!v13)
      goto LABEL_20;
  }
  v14 = (void *)v5[3];
  v7 = self->_currencyCode;
  v15 = v14;
  if (v7 != v15)
  {
    v9 = v15;
    if (v7 && v15)
    {
      v16 = -[NSString isEqualToString:](v7, "isEqualToString:", v15);

      if (!v16)
        goto LABEL_20;
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }

LABEL_23:
  originalAmountDue = self->_originalAmountDue;
  v20 = (NSDecimalNumber *)v5[4];
  if (originalAmountDue && v20)
  {
    if ((-[NSDecimalNumber isEqual:](originalAmountDue, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (originalAmountDue != v20)
  {
    goto LABEL_20;
  }
  amountDue = self->_amountDue;
  v22 = (NSDecimalNumber *)v5[5];
  if (amountDue && v22)
  {
    if ((-[NSDecimalNumber isEqual:](amountDue, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (amountDue != v22)
  {
    goto LABEL_20;
  }
  amountPaid = self->_amountPaid;
  v24 = (NSDecimalNumber *)v5[6];
  if (amountPaid && v24)
  {
    if ((-[NSDecimalNumber isEqual:](amountPaid, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (amountPaid != v24)
  {
    goto LABEL_20;
  }
  dueDate = self->_dueDate;
  v26 = (NSDate *)v5[7];
  if (dueDate && v26)
  {
    if ((-[NSDate isEqual:](dueDate, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (dueDate != v26)
  {
    goto LABEL_20;
  }
  statementDate = self->_statementDate;
  v28 = (NSDate *)v5[8];
  if (statementDate && v28)
  {
    if ((-[NSDate isEqual:](statementDate, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (statementDate != v28)
  {
    goto LABEL_20;
  }
  lineItems = self->_lineItems;
  v30 = (NSArray *)v5[9];
  if (lineItems && v30)
  {
    if ((-[NSArray isEqual:](lineItems, "isEqual:") & 1) == 0)
      goto LABEL_20;
  }
  else if (lineItems != v30)
  {
    goto LABEL_20;
  }
  statement = self->_statement;
  v32 = (PKCreditAccountStatement *)v5[12];
  if (statement && v32)
  {
    if (!-[PKCreditAccountStatement isEqual:](statement, "isEqual:"))
      goto LABEL_20;
  }
  else if (statement != v32)
  {
    goto LABEL_20;
  }
  if (self->_paymentNumber == v5[10])
  {
    v17 = self->_paymentCount == v5[11];
    goto LABEL_21;
  }
LABEL_20:
  v17 = 0;
LABEL_21:

  return v17;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_statementIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_originalAmountDue);
  objc_msgSend(v3, "safelyAddObject:", self->_amountDue);
  objc_msgSend(v3, "safelyAddObject:", self->_amountPaid);
  objc_msgSend(v3, "safelyAddObject:", self->_dueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_statementDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lineItems);
  objc_msgSend(v3, "safelyAddObject:", self->_statement);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_paymentNumber - v4 + 32 * v4;
  v6 = self->_paymentCount - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditInstallmentPlanPayment)initWithCoder:(id)a3
{
  id v4;
  PKCreditInstallmentPlanPayment *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *statementIdentifier;
  uint64_t v10;
  NSString *currencyCode;
  uint64_t v12;
  NSDecimalNumber *originalAmountDue;
  uint64_t v14;
  NSDecimalNumber *amountDue;
  uint64_t v16;
  NSDecimalNumber *amountPaid;
  uint64_t v18;
  NSDate *dueDate;
  uint64_t v20;
  NSDate *statementDate;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *lineItems;
  uint64_t v27;
  PKCreditAccountStatement *statement;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKCreditInstallmentPlanPayment;
  v5 = -[PKCreditInstallmentPlanPayment init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalAmountDue"));
    v12 = objc_claimAutoreleasedReturnValue();
    originalAmountDue = v5->_originalAmountDue;
    v5->_originalAmountDue = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountDue"));
    v14 = objc_claimAutoreleasedReturnValue();
    amountDue = v5->_amountDue;
    v5->_amountDue = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountPaid"));
    v16 = objc_claimAutoreleasedReturnValue();
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    dueDate = v5->_dueDate;
    v5->_dueDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    statementDate = v5->_statementDate;
    v5->_statementDate = (NSDate *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("lineItems"));
    v25 = objc_claimAutoreleasedReturnValue();
    lineItems = v5->_lineItems;
    v5->_lineItems = (NSArray *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statement"));
    v27 = objc_claimAutoreleasedReturnValue();
    statement = v5->_statement;
    v5->_statement = (PKCreditAccountStatement *)v27;

    v5->_paymentNumber = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentNumber"));
    v5->_paymentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentCount"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalAmountDue, CFSTR("originalAmountDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountDue, CFSTR("amountDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountPaid, CFSTR("amountPaid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dueDate, CFSTR("dueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementDate, CFSTR("statementDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lineItems, CFSTR("lineItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statement, CFSTR("statement"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentNumber, CFSTR("paymentNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentCount, CFSTR("paymentCount"));

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
  id v22;
  void *v23;
  id v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_statementIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_originalAmountDue, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_amountDue, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_amountPaid, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  v18 = -[NSDate copyWithZone:](self->_dueDate, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  v20 = -[NSDate copyWithZone:](self->_statementDate, "copyWithZone:", a3);
  v21 = (void *)v5[8];
  v5[8] = v20;

  v22 = -[PKCreditAccountStatement copyWithZone:](self->_statement, "copyWithZone:", a3);
  v23 = (void *)v5[12];
  v5[12] = v22;

  v5[10] = self->_paymentNumber;
  v5[11] = self->_paymentCount;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = self->_lineItems;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v29), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend(v24, "addObject:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v27);
  }

  if (objc_msgSend(v24, "count"))
  {
    v31 = objc_msgSend(v24, "copy");
    v32 = (void *)v5[9];
    v5[9] = v31;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)originalAmountDue
{
  return self->_originalAmountDue;
}

- (void)setOriginalAmountDue:(id)a3
{
  objc_storeStrong((id *)&self->_originalAmountDue, a3);
}

- (NSDecimalNumber)amountDue
{
  return self->_amountDue;
}

- (void)setAmountDue:(id)a3
{
  objc_storeStrong((id *)&self->_amountDue, a3);
}

- (NSDecimalNumber)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
  objc_storeStrong((id *)&self->_amountPaid, a3);
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_dueDate, a3);
}

- (NSDate)statementDate
{
  return self->_statementDate;
}

- (void)setStatementDate:(id)a3
{
  objc_storeStrong((id *)&self->_statementDate, a3);
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)paymentNumber
{
  return self->_paymentNumber;
}

- (void)setPaymentNumber:(unint64_t)a3
{
  self->_paymentNumber = a3;
}

- (unint64_t)paymentCount
{
  return self->_paymentCount;
}

- (void)setPaymentCount:(unint64_t)a3
{
  self->_paymentCount = a3;
}

- (PKCreditAccountStatement)statement
{
  return self->_statement;
}

- (void)setStatement:(id)a3
{
  objc_storeStrong((id *)&self->_statement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_statementDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_amountDue, 0);
  objc_storeStrong((id *)&self->_originalAmountDue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
