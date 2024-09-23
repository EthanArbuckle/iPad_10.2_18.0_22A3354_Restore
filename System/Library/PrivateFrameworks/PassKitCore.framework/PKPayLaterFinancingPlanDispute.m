@implementation PKPayLaterFinancingPlanDispute

- (PKPayLaterFinancingPlanDispute)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanDispute *v5;
  uint64_t v6;
  NSString *identifier;
  __CFString *v8;
  __CFString *v9;
  char v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  int v26;
  uint64_t v27;
  NSDate *openDate;
  uint64_t v29;
  NSDate *lastUpdated;
  uint64_t v31;
  NSDate *deadlineDate;
  uint64_t v33;
  NSString *emailAddress;
  void *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  PKPayLaterAppliedPayment *v47;
  PKPayLaterAppliedPayment *v48;
  uint64_t v49;
  NSArray *appliedPayments;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterFinancingPlanDispute;
  v5 = -[PKPayLaterFinancingPlanDispute init](&v56, sel_init);
  if (!v5)
    goto LABEL_32;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
  v8 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == CFSTR("review"))
    goto LABEL_5;
  if (!v8)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("review"));

  if ((v10 & 1) == 0)
  {
    v12 = v9;
    if (v12 == CFSTR("evidenceRequired")
      || (v13 = v12,
          v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("evidenceRequired")),
          v13,
          (v14 & 1) != 0))
    {
      v11 = 2;
      goto LABEL_22;
    }
    v15 = v13;
    if (v15 == CFSTR("approved")
      || (v16 = v15,
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("approved")),
          v16,
          (v17 & 1) != 0))
    {
      v11 = 3;
      goto LABEL_22;
    }
    v18 = v16;
    if (v18 == CFSTR("rejected")
      || (v19 = v18,
          v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("rejected")),
          v19,
          (v20 & 1) != 0))
    {
      v11 = 4;
      goto LABEL_22;
    }
    v21 = v19;
    if (v21 == CFSTR("split")
      || (v22 = v21,
          v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("split")),
          v22,
          (v23 & 1) != 0))
    {
      v11 = 5;
      goto LABEL_22;
    }
    v24 = v22;
    if (v24 == CFSTR("withdrawn")
      || (v25 = v24,
          v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("withdrawn")),
          v25,
          v26))
    {
      v11 = 6;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_5:
  v11 = 1;
LABEL_22:

  v5->_state = v11;
  objc_msgSend(v4, "PKDateForKey:", CFSTR("openDate"));
  v27 = objc_claimAutoreleasedReturnValue();
  openDate = v5->_openDate;
  v5->_openDate = (NSDate *)v27;

  objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdated"));
  v29 = objc_claimAutoreleasedReturnValue();
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v29;

  objc_msgSend(v4, "PKDateForKey:", CFSTR("deadlineDate"));
  v31 = objc_claimAutoreleasedReturnValue();
  deadlineDate = v5->_deadlineDate;
  v5->_deadlineDate = (NSDate *)v31;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("emailAddress"));
  v33 = objc_claimAutoreleasedReturnValue();
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v33;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredDocuments"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "containsObject:", CFSTR("receipt"));
  v37 = objc_msgSend(v35, "containsObject:", CFSTR("itemPhoto"));
  v38 = v36 | 2;
  if (!v37)
    v38 = v36;
  v5->_requiredDocuments = v38;

  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("appliedPayments"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v41 = v39;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v53;
    do
    {
      v45 = 0;
      do
      {
        if (*(_QWORD *)v53 != v44)
          objc_enumerationMutation(v41);
        v46 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v45);
        v47 = [PKPayLaterAppliedPayment alloc];
        v48 = -[PKPayLaterAppliedPayment initWithDictionary:](v47, "initWithDictionary:", v46, (_QWORD)v52);
        objc_msgSend(v40, "safelyAddObject:", v48);

        ++v45;
      }
      while (v43 != v45);
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v43);
  }

  v49 = objc_msgSend(v40, "copy");
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v49;

LABEL_32:
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlanDispute *v4;
  PKPayLaterFinancingPlanDispute *v5;
  BOOL v6;

  v4 = (PKPayLaterFinancingPlanDispute *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFinancingPlanDispute isEqualToPayLaterFinancingPlanDispute:](self, "isEqualToPayLaterFinancingPlanDispute:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlanDispute:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDate *openDate;
  NSDate *v12;
  NSDate *lastUpdated;
  NSDate *v14;
  NSDate *deadlineDate;
  NSDate *v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  char v20;
  NSArray *appliedPayments;
  NSArray *v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_31;
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
      goto LABEL_30;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_31;
  }
  if (self->_state != v5[2] || self->_requiredDocuments != v5[7])
    goto LABEL_31;
  openDate = self->_openDate;
  v12 = (NSDate *)v5[3];
  if (openDate && v12)
  {
    if ((-[NSDate isEqual:](openDate, "isEqual:") & 1) == 0)
      goto LABEL_31;
  }
  else if (openDate != v12)
  {
    goto LABEL_31;
  }
  lastUpdated = self->_lastUpdated;
  v14 = (NSDate *)v5[4];
  if (lastUpdated && v14)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
      goto LABEL_31;
  }
  else if (lastUpdated != v14)
  {
    goto LABEL_31;
  }
  deadlineDate = self->_deadlineDate;
  v16 = (NSDate *)v5[5];
  if (deadlineDate && v16)
  {
    if ((-[NSDate isEqual:](deadlineDate, "isEqual:") & 1) == 0)
      goto LABEL_31;
  }
  else if (deadlineDate != v16)
  {
    goto LABEL_31;
  }
  v17 = (void *)v5[6];
  v7 = self->_emailAddress;
  v18 = v17;
  if (v7 != v18)
  {
    v9 = v18;
    if (v7 && v18)
    {
      v19 = -[NSString isEqualToString:](v7, "isEqualToString:", v18);

      if (v19)
        goto LABEL_34;
LABEL_31:
      v20 = 0;
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }

LABEL_34:
  appliedPayments = self->_appliedPayments;
  v23 = (NSArray *)v5[8];
  if (appliedPayments && v23)
    v20 = -[NSArray isEqual:](appliedPayments, "isEqual:");
  else
    v20 = appliedPayments == v23;
LABEL_32:

  return v20;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_openDate);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_deadlineDate);
  objc_msgSend(v3, "safelyAddObject:", self->_emailAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_appliedPayments);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_state - v4 + 32 * v4;
  v6 = self->_requiredDocuments - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3;
  unint64_t state;
  const __CFString *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  state = self->_state;
  if (state > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD2B28[state];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("openDate: '%@'; "), self->_openDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  objc_msgSend(v3, "appendFormat:", CFSTR("deadlineDate: '%@'; "), self->_deadlineDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("emailAddress: '%@'; "), self->_emailAddress);
  PKPayLaterFinancingPlanDisputeDocumentToStrings(self->_requiredDocuments);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("requiredDocuments: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("appliedPayments: '%@'; "), self->_appliedPayments);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t state;
  const __CFString *v5;
  NSDate *openDate;
  void *v7;
  NSDate *lastUpdated;
  void *v9;
  NSDate *deadlineDate;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  state = self->_state;
  if (state > 6)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD2B28[state];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("state"));
  openDate = self->_openDate;
  if (openDate)
  {
    PKISO8601DateStringFromDate(openDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("openDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("openDate"));
  }
  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    PKISO8601DateStringFromDate(lastUpdated);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lastUpdated"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("lastUpdated"));
  }
  deadlineDate = self->_deadlineDate;
  if (deadlineDate)
  {
    PKISO8601DateStringFromDate(deadlineDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deadlineDate"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("deadlineDate"));
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_emailAddress, CFSTR("emailAddress"));
  PKPayLaterFinancingPlanDisputeDocumentToStrings(self->_requiredDocuments);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("requiredDocuments"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_appliedPayments, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_135);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("appliedPayments"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

uint64_t __58__PKPayLaterFinancingPlanDispute_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isTerminal
{
  return self->_state - 3 < 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanDispute)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlanDispute *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openDate;
  uint64_t v10;
  NSDate *lastUpdated;
  uint64_t v12;
  NSDate *deadlineDate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *appliedPayments;
  uint64_t v19;
  NSString *emailAddress;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterFinancingPlanDispute;
  v5 = -[PKPayLaterFinancingPlanDispute init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deadlineDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    deadlineDate = v5->_deadlineDate;
    v5->_deadlineDate = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("appliedPayments"));
    v17 = objc_claimAutoreleasedReturnValue();
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emailAddress"));
    v19 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v19;

    v5->_requiredDocuments = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiredDocuments"));
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requiredDocuments, CFSTR("requiredDocuments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openDate, CFSTR("openDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deadlineDate, CFSTR("deadlineDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appliedPayments, CFSTR("appliedPayments"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingPlanDispute *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openDate;
  uint64_t v10;
  NSDate *lastUpdated;
  uint64_t v12;
  NSDate *deadlineDate;
  uint64_t v14;
  NSString *emailAddress;
  uint64_t v16;
  NSArray *appliedPayments;

  v5 = -[PKPayLaterFinancingPlanDispute init](+[PKPayLaterFinancingPlanDispute allocWithZone:](PKPayLaterFinancingPlanDispute, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_state = self->_state;
  v5->_requiredDocuments = self->_requiredDocuments;
  v8 = -[NSDate copyWithZone:](self->_openDate, "copyWithZone:", a3);
  openDate = v5->_openDate;
  v5->_openDate = (NSDate *)v8;

  v10 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v10;

  v12 = -[NSDate copyWithZone:](self->_deadlineDate, "copyWithZone:", a3);
  deadlineDate = v5->_deadlineDate;
  v5->_deadlineDate = (NSDate *)v12;

  v14 = -[NSString copyWithZone:](self->_emailAddress, "copyWithZone:", a3);
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v14;

  v16 = -[NSArray copyWithZone:](self->_appliedPayments, "copyWithZone:", a3);
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v16;

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

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)deadlineDate
{
  return self->_deadlineDate;
}

- (void)setDeadlineDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)requiredDocuments
{
  return self->_requiredDocuments;
}

- (void)setRequiredDocuments:(unint64_t)a3
{
  self->_requiredDocuments = a3;
}

- (NSArray)appliedPayments
{
  return self->_appliedPayments;
}

- (void)setAppliedPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedPayments, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_deadlineDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_openDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
