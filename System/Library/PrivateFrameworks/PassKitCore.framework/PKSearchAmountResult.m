@implementation PKSearchAmountResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 2;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_comparison, CFSTR("comparison"));

}

- (PKSearchAmountResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchAmountResult *v5;
  uint64_t v6;
  PKCurrencyAmount *amount;

  v4 = a3;
  v5 = -[PKSearchAmountResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    v5->_comparison = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("comparison"));
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchAmountResult;
  -[PKSearchAmountResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v4, "appendFormat:", CFSTR("comparison: '%lu'; "), self->_comparison);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  amount = self->_amount;
  v6 = (PKCurrencyAmount *)v4[1];
  if (!amount || !v6)
  {
    if (amount == v6)
      goto LABEL_5;
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
    goto LABEL_7;
LABEL_5:
  v7 = self->_comparison == v4[2];
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_comparison - v4 + 32 * v4;

  return v5;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (void)setComparison:(int64_t)a3
{
  self->_comparison = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
