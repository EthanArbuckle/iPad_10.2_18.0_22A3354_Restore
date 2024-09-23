@implementation PKAccountServicePayLaterFinancingPlanQuery

- (PKAccountServicePayLaterFinancingPlanQuery)initWithAccountIdentifier:(id)a3 queryItems:(unint64_t)a4
{
  id v7;
  PKAccountServicePayLaterFinancingPlanQuery *v8;
  void *v9;
  uint64_t v10;
  NSString *queryIdentifier;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountServicePayLaterFinancingPlanQuery;
  v8 = -[PKAccountServicePayLaterFinancingPlanQuery init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    queryIdentifier = v8->_queryIdentifier;
    v8->_queryIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v8->_queryItems = a4;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *transactionStartDate;
  void *v6;
  NSDate *transactionEndDate;
  void *v8;
  NSDate *installmentDueOrPaidDateStart;
  void *v10;
  NSDate *installmentDueOrPaidDateEnd;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_queryIdentifier, CFSTR("queryIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend((id)objc_opt_class(), "descriptionForQueryItems:", self->_queryItems);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("queryItems"));

  transactionStartDate = self->_transactionStartDate;
  if (transactionStartDate)
  {
    PKMediumDateString(transactionStartDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("transactionStartDate"));

  }
  transactionEndDate = self->_transactionEndDate;
  if (transactionEndDate)
  {
    PKMediumDateString(transactionEndDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("transactionEndDate"));

  }
  installmentDueOrPaidDateStart = self->_installmentDueOrPaidDateStart;
  if (installmentDueOrPaidDateStart)
  {
    PKMediumDateString(installmentDueOrPaidDateStart);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("installmentDueOrPaidDateStart"));

  }
  installmentDueOrPaidDateEnd = self->_installmentDueOrPaidDateEnd;
  if (installmentDueOrPaidDateEnd)
  {
    PKMediumDateString(installmentDueOrPaidDateEnd);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("installmentDueOrPaidDateEnd"));

  }
  if (self->_upcomingInstallmentsLimit >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("upcomingInstallmentsLimit"));

  }
  if (-[NSArray count](self->_relevantFinancingPlanStates, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_relevantFinancingPlanStates, CFSTR("relevantFinancingPlanStates"));
  if (-[NSArray count](self->_countFinancingPlanStates, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_countFinancingPlanStates, CFSTR("countFinancingPlanStates"));
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQuery)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicePayLaterFinancingPlanQuery *v5;
  uint64_t v6;
  NSString *queryIdentifier;
  uint64_t v8;
  NSString *accountIdentifier;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *relevantFinancingPlanStates;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *countFinancingPlanStates;
  uint64_t v20;
  NSDate *transactionStartDate;
  uint64_t v22;
  NSDate *transactionEndDate;
  uint64_t v24;
  NSDate *installmentDueOrPaidDateStart;
  uint64_t v26;
  NSDate *installmentDueOrPaidDateEnd;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountServicePayLaterFinancingPlanQuery;
  v5 = -[PKAccountServicePayLaterFinancingPlanQuery init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryIdentifier = v5->_queryIdentifier;
    v5->_queryIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    v5->_queryItems = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("queryItems"));
    v5->_upcomingInstallmentsLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("upcomingInstallmentsLimit"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("relevantFinancingPlanStates"));
    v13 = objc_claimAutoreleasedReturnValue();
    relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
    v5->_relevantFinancingPlanStates = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("countFinancingPlanStates"));
    v18 = objc_claimAutoreleasedReturnValue();
    countFinancingPlanStates = v5->_countFinancingPlanStates;
    v5->_countFinancingPlanStates = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionStartDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    transactionStartDate = v5->_transactionStartDate;
    v5->_transactionStartDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionEndDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    transactionEndDate = v5->_transactionEndDate;
    v5->_transactionEndDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentDueOrPaidDateStart"));
    v24 = objc_claimAutoreleasedReturnValue();
    installmentDueOrPaidDateStart = v5->_installmentDueOrPaidDateStart;
    v5->_installmentDueOrPaidDateStart = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installmentDueOrPaidDateEnd"));
    v26 = objc_claimAutoreleasedReturnValue();
    installmentDueOrPaidDateEnd = v5->_installmentDueOrPaidDateEnd;
    v5->_installmentDueOrPaidDateEnd = (NSDate *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *queryIdentifier;
  id v5;

  queryIdentifier = self->_queryIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", queryIdentifier, CFSTR("queryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_queryItems, CFSTR("queryItems"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_upcomingInstallmentsLimit, CFSTR("upcomingInstallmentsLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantFinancingPlanStates, CFSTR("relevantFinancingPlanStates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countFinancingPlanStates, CFSTR("countFinancingPlanStates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionStartDate, CFSTR("transactionStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionEndDate, CFSTR("transactionEndDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentDueOrPaidDateStart, CFSTR("installmentDueOrPaidDateStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_installmentDueOrPaidDateEnd, CFSTR("installmentDueOrPaidDateEnd"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountServicePayLaterFinancingPlanQuery *v5;
  uint64_t v6;
  NSString *queryIdentifier;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSArray *relevantFinancingPlanStates;
  uint64_t v12;
  NSArray *countFinancingPlanStates;
  uint64_t v14;
  NSDate *transactionStartDate;
  uint64_t v16;
  NSDate *transactionEndDate;
  uint64_t v18;
  NSDate *installmentDueOrPaidDateStart;
  uint64_t v20;
  NSDate *installmentDueOrPaidDateEnd;

  v5 = -[PKAccountServicePayLaterFinancingPlanQuery init](+[PKAccountServicePayLaterFinancingPlanQuery allocWithZone:](PKAccountServicePayLaterFinancingPlanQuery, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_queryIdentifier, "copyWithZone:", a3);
  queryIdentifier = v5->_queryIdentifier;
  v5->_queryIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  v5->_queryItems = self->_queryItems;
  v5->_upcomingInstallmentsLimit = self->_upcomingInstallmentsLimit;
  v10 = -[NSArray copyWithZone:](self->_relevantFinancingPlanStates, "copyWithZone:", a3);
  relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
  v5->_relevantFinancingPlanStates = (NSArray *)v10;

  v12 = -[NSArray copyWithZone:](self->_countFinancingPlanStates, "copyWithZone:", a3);
  countFinancingPlanStates = v5->_countFinancingPlanStates;
  v5->_countFinancingPlanStates = (NSArray *)v12;

  v14 = -[NSDate copyWithZone:](self->_transactionStartDate, "copyWithZone:", a3);
  transactionStartDate = v5->_transactionStartDate;
  v5->_transactionStartDate = (NSDate *)v14;

  v16 = -[NSDate copyWithZone:](self->_transactionEndDate, "copyWithZone:", a3);
  transactionEndDate = v5->_transactionEndDate;
  v5->_transactionEndDate = (NSDate *)v16;

  v18 = -[NSDate copyWithZone:](self->_installmentDueOrPaidDateStart, "copyWithZone:", a3);
  installmentDueOrPaidDateStart = v5->_installmentDueOrPaidDateStart;
  v5->_installmentDueOrPaidDateStart = (NSDate *)v18;

  v20 = -[NSDate copyWithZone:](self->_installmentDueOrPaidDateEnd, "copyWithZone:", a3);
  installmentDueOrPaidDateEnd = v5->_installmentDueOrPaidDateEnd;
  v5->_installmentDueOrPaidDateEnd = (NSDate *)v20;

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("queryIdentifier: '%@'; "), self->_queryIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend((id)objc_opt_class(), "descriptionForQueryItems:", self->_queryItems);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("queryItems: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("upcomingInstallmentsLimit: '%ld'; "), self->_upcomingInstallmentsLimit);
  objc_msgSend(v6, "appendFormat:", CFSTR("relevantFinancingPlanStates: '%@'; "), self->_relevantFinancingPlanStates);
  objc_msgSend(v6, "appendFormat:", CFSTR("countFinancingPlanStates: '%@'; "), self->_countFinancingPlanStates);
  objc_msgSend(v6, "appendFormat:", CFSTR("transactionStartDate: '%@'; "), self->_transactionStartDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("transactionEndDate: '%@'; "), self->_transactionEndDate);
  objc_msgSend(v6, "appendFormat:", CFSTR("installmentDueOrPaidDateStart: '%@'; "),
    self->_installmentDueOrPaidDateStart);
  objc_msgSend(v6, "appendFormat:", CFSTR("installmentDueOrPaidDateEnd: '%@'; "), self->_installmentDueOrPaidDateEnd);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_queryIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_relevantFinancingPlanStates);
  objc_msgSend(v3, "safelyAddObject:", self->_countFinancingPlanStates);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionStartDate);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionEndDate);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentDueOrPaidDateStart);
  objc_msgSend(v3, "safelyAddObject:", self->_installmentDueOrPaidDateEnd);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_queryItems - v4 + 32 * v4;
  v6 = self->_upcomingInstallmentsLimit - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountServicePayLaterFinancingPlanQuery *v4;
  PKAccountServicePayLaterFinancingPlanQuery *v5;
  BOOL v6;

  v4 = (PKAccountServicePayLaterFinancingPlanQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountServicePayLaterFinancingPlanQuery _isEqualToFinancingPlanQuery:](self, "_isEqualToFinancingPlanQuery:", v5);

  return v6;
}

- (BOOL)_isEqualToFinancingPlanQuery:(id)a3
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
  BOOL v14;
  NSArray *relevantFinancingPlanStates;
  NSArray *v17;
  NSArray *countFinancingPlanStates;
  NSArray *v19;
  NSDate *transactionStartDate;
  NSDate *v21;
  NSDate *transactionEndDate;
  NSDate *v23;
  NSDate *installmentDueOrPaidDateStart;
  NSDate *v25;
  NSDate *installmentDueOrPaidDateEnd;
  NSDate *v27;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  v6 = (void *)v4[1];
  v7 = self->_queryIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_13;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_14;
  }
  v11 = (void *)v5[2];
  v7 = self->_accountIdentifier;
  v12 = v11;
  if (v7 != v12)
  {
    v9 = v12;
    if (v7 && v12)
    {
      v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

      if (!v13)
        goto LABEL_14;
      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_17:
  relevantFinancingPlanStates = self->_relevantFinancingPlanStates;
  v17 = (NSArray *)v5[5];
  if (relevantFinancingPlanStates && v17)
  {
    if ((-[NSArray isEqual:](relevantFinancingPlanStates, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (relevantFinancingPlanStates != v17)
  {
    goto LABEL_14;
  }
  countFinancingPlanStates = self->_countFinancingPlanStates;
  v19 = (NSArray *)v5[6];
  if (countFinancingPlanStates && v19)
  {
    if ((-[NSArray isEqual:](countFinancingPlanStates, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (countFinancingPlanStates != v19)
  {
    goto LABEL_14;
  }
  transactionStartDate = self->_transactionStartDate;
  v21 = (NSDate *)v5[7];
  if (transactionStartDate && v21)
  {
    if ((-[NSDate isEqual:](transactionStartDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (transactionStartDate != v21)
  {
    goto LABEL_14;
  }
  transactionEndDate = self->_transactionEndDate;
  v23 = (NSDate *)v5[8];
  if (transactionEndDate && v23)
  {
    if ((-[NSDate isEqual:](transactionEndDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (transactionEndDate != v23)
  {
    goto LABEL_14;
  }
  installmentDueOrPaidDateStart = self->_installmentDueOrPaidDateStart;
  v25 = (NSDate *)v5[9];
  if (installmentDueOrPaidDateStart && v25)
  {
    if ((-[NSDate isEqual:](installmentDueOrPaidDateStart, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (installmentDueOrPaidDateStart != v25)
  {
    goto LABEL_14;
  }
  installmentDueOrPaidDateEnd = self->_installmentDueOrPaidDateEnd;
  v27 = (NSDate *)v5[10];
  if (installmentDueOrPaidDateEnd && v27)
  {
    if ((-[NSDate isEqual:](installmentDueOrPaidDateEnd, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (installmentDueOrPaidDateEnd != v27)
  {
    goto LABEL_14;
  }
  if (self->_queryItems == v5[3])
  {
    v14 = self->_upcomingInstallmentsLimit == v5[4];
    goto LABEL_15;
  }
LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

+ (id)descriptionForQueryItems:(unint64_t)a3
{
  id v4;
  int v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    v5 = 1;
    v6 = 1;
    do
    {
      if ((v6 & a3) != 0)
      {
        if (v6 <= 15)
        {
          v7 = CFSTR("None");
          switch(v6)
          {
            case 0:
              goto LABEL_19;
            case 1:
              v7 = CFSTR("DueNext30Days");
              goto LABEL_19;
            case 2:
              v7 = CFSTR("TotalPendingAmount");
              goto LABEL_19;
            case 4:
              v7 = CFSTR("UpcomingInstallments");
              goto LABEL_19;
            case 8:
              v7 = CFSTR("CompletedFinancingPlans");
              goto LABEL_19;
            default:
              goto LABEL_20;
          }
          goto LABEL_20;
        }
        if (v6 > 63)
        {
          if (v6 == 64)
          {
            v7 = CFSTR("FinancingPlanCount");
            goto LABEL_19;
          }
          if (v6 == 127)
          {
            v7 = CFSTR("All");
            goto LABEL_19;
          }
        }
        else
        {
          if (v6 == 16)
          {
            v7 = CFSTR("ActiveFinancingPlans");
            goto LABEL_19;
          }
          if (v6 == 32)
          {
            v7 = CFSTR("RelevantFinancingPlans");
LABEL_19:
            objc_msgSend(v4, "addObject:", v7);
          }
        }
      }
LABEL_20:
      v6 = 1 << v5++;
    }
    while (v6 <= a3);
  }
  objc_msgSend(v4, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)queryItems
{
  return self->_queryItems;
}

- (int64_t)upcomingInstallmentsLimit
{
  return self->_upcomingInstallmentsLimit;
}

- (void)setUpcomingInstallmentsLimit:(int64_t)a3
{
  self->_upcomingInstallmentsLimit = a3;
}

- (NSArray)relevantFinancingPlanStates
{
  return self->_relevantFinancingPlanStates;
}

- (void)setRelevantFinancingPlanStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)countFinancingPlanStates
{
  return self->_countFinancingPlanStates;
}

- (void)setCountFinancingPlanStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)transactionStartDate
{
  return self->_transactionStartDate;
}

- (void)setTransactionStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)transactionEndDate
{
  return self->_transactionEndDate;
}

- (void)setTransactionEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)installmentDueOrPaidDateStart
{
  return self->_installmentDueOrPaidDateStart;
}

- (void)setInstallmentDueOrPaidDateStart:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)installmentDueOrPaidDateEnd
{
  return self->_installmentDueOrPaidDateEnd;
}

- (void)setInstallmentDueOrPaidDateEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentDueOrPaidDateEnd, 0);
  objc_storeStrong((id *)&self->_installmentDueOrPaidDateStart, 0);
  objc_storeStrong((id *)&self->_transactionEndDate, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
  objc_storeStrong((id *)&self->_countFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_relevantFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
}

@end
