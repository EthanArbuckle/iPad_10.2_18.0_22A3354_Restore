@implementation PKAccountUserPreferences

- (PKAccountUserPreferences)initWithDictionary:(id)a3
{
  id v4;
  PKAccountUserPreferences *v5;
  uint64_t v6;
  NSDecimalNumber *transactionSpendLimitAmount;
  uint64_t v8;
  NSDecimalNumber *monthlySpendLimitAmount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  v5 = -[PKAccountUserPreferences init](&v11, sel_init);
  if (v5)
  {
    v5->_spendingEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("spendingEnabled"));
    v5->_showAvailableCredit = objc_msgSend(v4, "PKBoolForKey:", CFSTR("showAvailableCredit"));
    v5->_transactionSpendLimitEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("transactionLimitEnabled"));
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("transactionLimitAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("monthlySpendLimitEnabled"));
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("monthlySpendLimitAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;

  }
  return v5;
}

- (PKAccountUserPreferences)initWithAccountUserPreferences:(id)a3
{
  id v4;
  PKAccountUserPreferences *v5;
  uint64_t v6;
  NSDecimalNumber *transactionSpendLimitAmount;
  uint64_t v8;
  NSDecimalNumber *monthlySpendLimitAmount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  v5 = -[PKAccountUserPreferences init](&v11, sel_init);
  if (v5)
  {
    v5->_spendingEnabled = objc_msgSend(v4, "spendingEnabled");
    v5->_showAvailableCredit = objc_msgSend(v4, "showAvailableCredit");
    v5->_transactionSpendLimitEnabled = objc_msgSend(v4, "transactionSpendLimitEnabled");
    objc_msgSend(v4, "transactionSpendLimitAmount");
    v6 = objc_claimAutoreleasedReturnValue();
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = objc_msgSend(v4, "monthlySpendLimitEnabled");
    objc_msgSend(v4, "monthlySpendLimitAmount");
    v8 = objc_claimAutoreleasedReturnValue();
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;

  }
  return v5;
}

- (id)jsonRepresentationForAccountUserAccessLevel:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_spendingEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("spendingEnabled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showAvailableCredit);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("showAvailableCredit"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_transactionSpendLimitEnabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("transactionLimitEnabled"));

    -[NSDecimalNumber stringValue](self->_transactionSpendLimitAmount, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("transactionLimitAmount"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_monthlySpendLimitEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("monthlySpendLimitEnabled"));

  -[NSDecimalNumber stringValue](self->_monthlySpendLimitAmount, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("monthlySpendLimitAmount"));

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountUserPreferences *v4;
  PKAccountUserPreferences *v5;
  BOOL v6;

  v4 = (PKAccountUserPreferences *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountUserPreferences isEqualToAccountUserPreferences:](self, "isEqualToAccountUserPreferences:", v5);

  return v6;
}

- (BOOL)isEqualToAccountUserPreferences:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  NSDecimalNumber *transactionSpendLimitAmount;
  NSDecimalNumber *v7;
  NSDecimalNumber *monthlySpendLimitAmount;
  NSDecimalNumber *v9;
  char v10;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4
    || self->_spendingEnabled != v4[8]
    || self->_showAvailableCredit != v4[9]
    || self->_transactionSpendLimitEnabled != v4[10])
  {
    goto LABEL_14;
  }
  transactionSpendLimitAmount = self->_transactionSpendLimitAmount;
  v7 = (NSDecimalNumber *)*((_QWORD *)v5 + 2);
  if (transactionSpendLimitAmount && v7)
  {
    if ((-[NSDecimalNumber isEqual:](transactionSpendLimitAmount, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (transactionSpendLimitAmount != v7)
  {
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (self->_monthlySpendLimitEnabled != v5[11])
    goto LABEL_14;
  monthlySpendLimitAmount = self->_monthlySpendLimitAmount;
  v9 = (NSDecimalNumber *)*((_QWORD *)v5 + 3);
  if (monthlySpendLimitAmount && v9)
    v10 = -[NSDecimalNumber isEqual:](monthlySpendLimitAmount, "isEqual:");
  else
    v10 = monthlySpendLimitAmount == v9;
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSpendLimitAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_monthlySpendLimitAmount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_spendingEnabled - v4 + 32 * v4;
  v6 = self->_showAvailableCredit - v5 + 32 * v5;
  v7 = self->_transactionSpendLimitEnabled - v6 + 32 * v6;
  v8 = self->_monthlySpendLimitEnabled - v7 + 32 * v7;

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PKAccountUserPreferences initWithAccountUserPreferences:](+[PKMutableAccountUserPreferences allocWithZone:](PKMutableAccountUserPreferences, "allocWithZone:", a3), "initWithAccountUserPreferences:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserPreferences)initWithCoder:(id)a3
{
  id v4;
  PKAccountUserPreferences *v5;
  uint64_t v6;
  NSDecimalNumber *transactionSpendLimitAmount;
  uint64_t v8;
  NSDecimalNumber *monthlySpendLimitAmount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  v5 = -[PKAccountUserPreferences init](&v11, sel_init);
  if (v5)
  {
    v5->_spendingEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spendingEnabled"));
    v5->_showAvailableCredit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showAvailableCredit"));
    v5->_transactionSpendLimitEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transactionLimitEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionLimitAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("monthlySpendLimitEnabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monthlySpendLimitAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 spendingEnabled;
  id v5;

  spendingEnabled = self->_spendingEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", spendingEnabled, CFSTR("spendingEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showAvailableCredit, CFSTR("showAvailableCredit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_transactionSpendLimitEnabled, CFSTR("transactionLimitEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSpendLimitAmount, CFSTR("transactionLimitAmount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_monthlySpendLimitEnabled, CFSTR("monthlySpendLimitEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_monthlySpendLimitAmount, CFSTR("monthlySpendLimitAmount"));

}

- (BOOL)spendingEnabled
{
  return self->_spendingEnabled;
}

- (void)setSpendingEnabled:(BOOL)a3
{
  self->_spendingEnabled = a3;
}

- (BOOL)showAvailableCredit
{
  return self->_showAvailableCredit;
}

- (void)setShowAvailableCredit:(BOOL)a3
{
  self->_showAvailableCredit = a3;
}

- (BOOL)transactionSpendLimitEnabled
{
  return self->_transactionSpendLimitEnabled;
}

- (void)setTransactionSpendLimitEnabled:(BOOL)a3
{
  self->_transactionSpendLimitEnabled = a3;
}

- (NSDecimalNumber)transactionSpendLimitAmount
{
  return self->_transactionSpendLimitAmount;
}

- (void)setTransactionSpendLimitAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSpendLimitAmount, a3);
}

- (BOOL)monthlySpendLimitEnabled
{
  return self->_monthlySpendLimitEnabled;
}

- (void)setMonthlySpendLimitEnabled:(BOOL)a3
{
  self->_monthlySpendLimitEnabled = a3;
}

- (NSDecimalNumber)monthlySpendLimitAmount
{
  return self->_monthlySpendLimitAmount;
}

- (void)setMonthlySpendLimitAmount:(id)a3
{
  objc_storeStrong((id *)&self->_monthlySpendLimitAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlySpendLimitAmount, 0);
  objc_storeStrong((id *)&self->_transactionSpendLimitAmount, 0);
}

@end
