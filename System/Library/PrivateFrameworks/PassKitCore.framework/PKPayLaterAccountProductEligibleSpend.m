@implementation PKPayLaterAccountProductEligibleSpend

- (PKPayLaterAccountProductEligibleSpend)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAccountProductEligibleSpend *v5;
  uint64_t v6;
  NSDate *expirationDate;
  uint64_t v8;
  PKCurrencyAmount *availableToSpend;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PKPayLaterFinancingOption *v18;
  PKPayLaterFinancingOption *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *financingOptions;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterAccountProductEligibleSpend;
  v5 = -[PKPayLaterAccountProductEligibleSpend init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("availableToSpend"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableToSpend = v5->_availableToSpend;
    v5->_availableToSpend = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("financingOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
            v18 = [PKPayLaterFinancingOption alloc];
            v19 = -[PKPayLaterFinancingOption initWithDictionary:](v18, "initWithDictionary:", v17, (_QWORD)v25);
            objc_msgSend(v11, "safelyAddObject:", v19);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v14);
      }

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("apr"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sortUsingDescriptors:", v21);

      if (objc_msgSend(v11, "count"))
      {
        v22 = objc_msgSend(v11, "copy");
        financingOptions = v5->_financingOptions;
        v5->_financingOptions = (NSArray *)v22;
      }
      else
      {
        financingOptions = v5->_financingOptions;
        v5->_financingOptions = 0;
      }

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountProductEligibleSpend)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAccountProductEligibleSpend *v5;
  uint64_t v6;
  NSDate *expirationDate;
  uint64_t v8;
  PKCurrencyAmount *availableToSpend;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *financingOptions;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterAccountProductEligibleSpend;
  v5 = -[PKPayLaterAccountProductEligibleSpend init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableToSpend"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableToSpend = v5->_availableToSpend;
    v5->_availableToSpend = (PKCurrencyAmount *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("financingOptions"));
    v13 = objc_claimAutoreleasedReturnValue();
    financingOptions = v5->_financingOptions;
    v5->_financingOptions = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *expirationDate;
  id v5;

  expirationDate = self->_expirationDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableToSpend, CFSTR("availableToSpend"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_financingOptions, CFSTR("financingOptions"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *expirationDate;
  NSDate *v6;
  PKCurrencyAmount *availableToSpend;
  PKCurrencyAmount *v8;
  NSArray *financingOptions;
  NSArray *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  expirationDate = self->_expirationDate;
  v6 = (NSDate *)v4[1];
  if (expirationDate && v6)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (expirationDate != v6)
  {
    goto LABEL_14;
  }
  availableToSpend = self->_availableToSpend;
  v8 = (PKCurrencyAmount *)v4[2];
  if (!availableToSpend || !v8)
  {
    if (availableToSpend == v8)
      goto LABEL_10;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (!-[PKCurrencyAmount isEqual:](availableToSpend, "isEqual:"))
    goto LABEL_14;
LABEL_10:
  financingOptions = self->_financingOptions;
  v10 = (NSArray *)v4[3];
  if (financingOptions && v10)
    v11 = -[NSArray isEqual:](financingOptions, "isEqual:");
  else
    v11 = financingOptions == v10;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_availableToSpend);
  objc_msgSend(v3, "safelyAddObject:", self->_financingOptions);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("expirationDate: '%@'; "), self->_expirationDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("availableToSpend: '%@'; "), self->_availableToSpend);
  objc_msgSend(v3, "appendFormat:", CFSTR("financingOptions: '%@'; "), self->_financingOptions);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAccountProductEligibleSpend *v5;
  uint64_t v6;
  NSDate *expirationDate;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *availableToSpend;
  uint64_t v10;
  NSArray *financingOptions;

  v5 = -[PKPayLaterAccountProductEligibleSpend init](+[PKPayLaterAccountProductEligibleSpend allocWithZone:](PKPayLaterAccountProductEligibleSpend, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_availableToSpend, "copyWithZone:", a3);
  availableToSpend = v5->_availableToSpend;
  v5->_availableToSpend = v8;

  v10 = -[NSArray copyWithZone:](self->_financingOptions, "copyWithZone:", a3);
  financingOptions = v5->_financingOptions;
  v5->_financingOptions = (NSArray *)v10;

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKCurrencyAmount)availableToSpend
{
  return self->_availableToSpend;
}

- (void)setAvailableToSpend:(id)a3
{
  objc_storeStrong((id *)&self->_availableToSpend, a3);
}

- (NSArray)financingOptions
{
  return self->_financingOptions;
}

- (void)setFinancingOptions:(id)a3
{
  objc_storeStrong((id *)&self->_financingOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_availableToSpend, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
