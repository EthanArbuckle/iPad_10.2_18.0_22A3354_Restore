@implementation PKAppleBalanceAccountSummary

- (PKAppleBalanceAccountSummary)initWithDictionary:(id)a3
{
  id v4;
  PKAppleBalanceAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;

  v4 = a3;
  v5 = -[PKAppleBalanceAccountSummary init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceAccountSummary)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalanceAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;

  v4 = a3;
  v5 = -[PKAppleBalanceAccountSummary init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    currentBalance = self->_currentBalance;
    v6 = (NSDecimalNumber *)v4[1];
    if (currentBalance && v6)
      v7 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
    else
      v7 = currentBalance == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_currentBalance, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), v4);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalanceAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;

  v5 = -[PKAppleBalanceAccountSummary init](+[PKAppleBalanceAccountSummary allocWithZone:](PKAppleBalanceAccountSummary, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v6;

  return v5;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalance, 0);
}

@end
