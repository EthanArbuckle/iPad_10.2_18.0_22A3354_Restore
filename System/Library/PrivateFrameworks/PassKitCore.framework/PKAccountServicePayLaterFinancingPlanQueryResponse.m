@implementation PKAccountServicePayLaterFinancingPlanQueryResponse

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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKCurrencyAmount dictionaryRepresentation](self->_dueNext30Days, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("dueNext30Days"));

  -[PKCurrencyAmount dictionaryRepresentation](self->_totalPendingAmount, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("totalPendingAmount"));

  if (self->_financingPlanCount >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("financingPlanCount"));

  }
  -[PKAccountServicePayLaterFinancingPlanQueryInstallments dictionaryRepresentation](self->_upcomingInstallments, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("upcomingInstallments"));

  if (-[NSArray count](self->_completedFinancingPlans, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_financingPlanIdentifierFromList:", self->_completedFinancingPlans);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("completedFinancingPlans"));

  }
  if (-[NSArray count](self->_activeFinancingPlans, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_financingPlanIdentifierFromList:", self->_activeFinancingPlans);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("activeFinancingPlans"));

  }
  if (-[NSArray count](self->_relevantFinancingPlans, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_financingPlanIdentifierFromList:", self->_relevantFinancingPlans);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("relevantFinancingPlans"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQueryResponse)initWithCoder:(id)a3
{
  id v4;
  PKAccountServicePayLaterFinancingPlanQueryResponse *v5;
  uint64_t v6;
  PKCurrencyAmount *dueNext30Days;
  uint64_t v8;
  PKCurrencyAmount *totalPendingAmount;
  uint64_t v10;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *upcomingInstallments;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *completedFinancingPlans;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *activeFinancingPlans;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *relevantFinancingPlans;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryResponse;
  v5 = -[PKAccountServicePayLaterFinancingPlanQueryResponse init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueNext30Days"));
    v6 = objc_claimAutoreleasedReturnValue();
    dueNext30Days = v5->_dueNext30Days;
    v5->_dueNext30Days = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalPendingAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalPendingAmount = v5->_totalPendingAmount;
    v5->_totalPendingAmount = (PKCurrencyAmount *)v8;

    v5->_financingPlanCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("financingPlanCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("upcomingInstallments"));
    v10 = objc_claimAutoreleasedReturnValue();
    upcomingInstallments = v5->_upcomingInstallments;
    v5->_upcomingInstallments = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("completedFinancingPlans"));
    v15 = objc_claimAutoreleasedReturnValue();
    completedFinancingPlans = v5->_completedFinancingPlans;
    v5->_completedFinancingPlans = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("activeFinancingPlans"));
    v20 = objc_claimAutoreleasedReturnValue();
    activeFinancingPlans = v5->_activeFinancingPlans;
    v5->_activeFinancingPlans = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("relevantFinancingPlans"));
    v25 = objc_claimAutoreleasedReturnValue();
    relevantFinancingPlans = v5->_relevantFinancingPlans;
    v5->_relevantFinancingPlans = (NSArray *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *dueNext30Days;
  id v5;

  dueNext30Days = self->_dueNext30Days;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dueNext30Days, CFSTR("dueNext30Days"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalPendingAmount, CFSTR("totalPendingAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_upcomingInstallments, CFSTR("upcomingInstallments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedFinancingPlans, CFSTR("completedFinancingPlans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeFinancingPlans, CFSTR("activeFinancingPlans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantFinancingPlans, CFSTR("relevantFinancingPlans"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_financingPlanCount, CFSTR("financingPlanCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountServicePayLaterFinancingPlanQueryResponse *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *dueNext30Days;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *totalPendingAmount;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v10;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *upcomingInstallments;
  uint64_t v12;
  NSArray *completedFinancingPlans;
  uint64_t v14;
  NSArray *activeFinancingPlans;
  uint64_t v16;
  NSArray *relevantFinancingPlans;

  v5 = -[PKAccountServicePayLaterFinancingPlanQueryResponse init](+[PKAccountServicePayLaterFinancingPlanQueryResponse allocWithZone:](PKAccountServicePayLaterFinancingPlanQueryResponse, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_dueNext30Days, "copyWithZone:", a3);
  dueNext30Days = v5->_dueNext30Days;
  v5->_dueNext30Days = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_totalPendingAmount, "copyWithZone:", a3);
  totalPendingAmount = v5->_totalPendingAmount;
  v5->_totalPendingAmount = v8;

  v5->_financingPlanCount = self->_financingPlanCount;
  v10 = -[PKAccountServicePayLaterFinancingPlanQueryInstallments copyWithZone:](self->_upcomingInstallments, "copyWithZone:", a3);
  upcomingInstallments = v5->_upcomingInstallments;
  v5->_upcomingInstallments = v10;

  v12 = -[NSArray copyWithZone:](self->_completedFinancingPlans, "copyWithZone:", a3);
  completedFinancingPlans = v5->_completedFinancingPlans;
  v5->_completedFinancingPlans = (NSArray *)v12;

  v14 = -[NSArray copyWithZone:](self->_activeFinancingPlans, "copyWithZone:", a3);
  activeFinancingPlans = v5->_activeFinancingPlans;
  v5->_activeFinancingPlans = (NSArray *)v14;

  v16 = -[NSArray copyWithZone:](self->_relevantFinancingPlans, "copyWithZone:", a3);
  relevantFinancingPlans = v5->_relevantFinancingPlans;
  v5->_relevantFinancingPlans = (NSArray *)v16;

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("dueNext30Days: '%@'; "), self->_dueNext30Days);
  objc_msgSend(v6, "appendFormat:", CFSTR("totalPendingAmount: '%@'; "), self->_totalPendingAmount);
  objc_msgSend(v6, "appendFormat:", CFSTR("financingPlanCount: '%ld'; "), self->_financingPlanCount);
  objc_msgSend(v6, "appendFormat:", CFSTR("upcomingInstallments: '%@'; "), self->_upcomingInstallments);
  objc_msgSend(v6, "appendFormat:", CFSTR("completedFinancingPlans: '%@'; "), self->_completedFinancingPlans);
  objc_msgSend(v6, "appendFormat:", CFSTR("activeFinancingPlans: '%@'; "), self->_activeFinancingPlans);
  objc_msgSend(v6, "appendFormat:", CFSTR("relevantFinancingPlans: '%@'; "), self->_relevantFinancingPlans);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_dueNext30Days);
  objc_msgSend(v3, "safelyAddObject:", self->_totalPendingAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_upcomingInstallments);
  objc_msgSend(v3, "safelyAddObject:", self->_completedFinancingPlans);
  objc_msgSend(v3, "safelyAddObject:", self->_activeFinancingPlans);
  objc_msgSend(v3, "safelyAddObject:", self->_relevantFinancingPlans);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_financingPlanCount - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountServicePayLaterFinancingPlanQueryResponse *v4;
  PKAccountServicePayLaterFinancingPlanQueryResponse *v5;
  BOOL v6;

  v4 = (PKAccountServicePayLaterFinancingPlanQueryResponse *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountServicePayLaterFinancingPlanQueryResponse _isEqualToFinancingPlanQueryResponse:](self, "_isEqualToFinancingPlanQueryResponse:", v5);

  return v6;
}

- (BOOL)_isEqualToFinancingPlanQueryResponse:(id)a3
{
  _QWORD *v4;
  PKCurrencyAmount *dueNext30Days;
  PKCurrencyAmount *v6;
  BOOL v7;
  PKCurrencyAmount *totalPendingAmount;
  PKCurrencyAmount *v9;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *upcomingInstallments;
  PKAccountServicePayLaterFinancingPlanQueryInstallments *v11;
  NSArray *completedFinancingPlans;
  NSArray *v13;
  NSArray *activeFinancingPlans;
  NSArray *v15;
  NSArray *relevantFinancingPlans;
  NSArray *v17;
  char v18;

  v4 = a3;
  if (!v4)
    goto LABEL_33;
  dueNext30Days = self->_dueNext30Days;
  v6 = (PKCurrencyAmount *)v4[1];
  if (dueNext30Days)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (dueNext30Days != v6)
      goto LABEL_33;
  }
  else if (!-[PKCurrencyAmount isEqual:](dueNext30Days, "isEqual:"))
  {
    goto LABEL_33;
  }
  totalPendingAmount = self->_totalPendingAmount;
  v9 = (PKCurrencyAmount *)v4[2];
  if (totalPendingAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](totalPendingAmount, "isEqual:"))
      goto LABEL_33;
  }
  else if (totalPendingAmount != v9)
  {
    goto LABEL_33;
  }
  if (self->_financingPlanCount != v4[3])
    goto LABEL_33;
  upcomingInstallments = self->_upcomingInstallments;
  v11 = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)v4[4];
  if (upcomingInstallments && v11)
  {
    if (!-[PKAccountServicePayLaterFinancingPlanQueryInstallments isEqual:](upcomingInstallments, "isEqual:"))
      goto LABEL_33;
  }
  else if (upcomingInstallments != v11)
  {
    goto LABEL_33;
  }
  completedFinancingPlans = self->_completedFinancingPlans;
  v13 = (NSArray *)v4[5];
  if (completedFinancingPlans && v13)
  {
    if ((-[NSArray isEqual:](completedFinancingPlans, "isEqual:") & 1) == 0)
      goto LABEL_33;
  }
  else if (completedFinancingPlans != v13)
  {
    goto LABEL_33;
  }
  activeFinancingPlans = self->_activeFinancingPlans;
  v15 = (NSArray *)v4[6];
  if (!activeFinancingPlans || !v15)
  {
    if (activeFinancingPlans == v15)
      goto LABEL_29;
LABEL_33:
    v18 = 0;
    goto LABEL_34;
  }
  if ((-[NSArray isEqual:](activeFinancingPlans, "isEqual:") & 1) == 0)
    goto LABEL_33;
LABEL_29:
  relevantFinancingPlans = self->_relevantFinancingPlans;
  v17 = (NSArray *)v4[7];
  if (relevantFinancingPlans && v17)
    v18 = -[NSArray isEqual:](relevantFinancingPlans, "isEqual:");
  else
    v18 = relevantFinancingPlans == v17;
LABEL_34:

  return v18;
}

+ (id)_financingPlanIdentifierFromList:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "pk_createOrderedSetByApplyingBlock:", &__block_literal_global_209);
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __87__PKAccountServicePayLaterFinancingPlanQueryResponse__financingPlanIdentifierFromList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "planIdentifier");
}

- (PKCurrencyAmount)dueNext30Days
{
  return self->_dueNext30Days;
}

- (void)setDueNext30Days:(id)a3
{
  objc_storeStrong((id *)&self->_dueNext30Days, a3);
}

- (PKCurrencyAmount)totalPendingAmount
{
  return self->_totalPendingAmount;
}

- (void)setTotalPendingAmount:(id)a3
{
  objc_storeStrong((id *)&self->_totalPendingAmount, a3);
}

- (int64_t)financingPlanCount
{
  return self->_financingPlanCount;
}

- (void)setFinancingPlanCount:(int64_t)a3
{
  self->_financingPlanCount = a3;
}

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)upcomingInstallments
{
  return self->_upcomingInstallments;
}

- (void)setUpcomingInstallments:(id)a3
{
  objc_storeStrong((id *)&self->_upcomingInstallments, a3);
}

- (NSArray)completedFinancingPlans
{
  return self->_completedFinancingPlans;
}

- (void)setCompletedFinancingPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)activeFinancingPlans
{
  return self->_activeFinancingPlans;
}

- (void)setActiveFinancingPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)relevantFinancingPlans
{
  return self->_relevantFinancingPlans;
}

- (void)setRelevantFinancingPlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantFinancingPlans, 0);
  objc_storeStrong((id *)&self->_activeFinancingPlans, 0);
  objc_storeStrong((id *)&self->_completedFinancingPlans, 0);
  objc_storeStrong((id *)&self->_upcomingInstallments, 0);
  objc_storeStrong((id *)&self->_totalPendingAmount, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
}

@end
