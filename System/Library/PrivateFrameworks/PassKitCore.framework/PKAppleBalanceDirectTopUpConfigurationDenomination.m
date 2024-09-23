@implementation PKAppleBalanceDirectTopUpConfigurationDenomination

- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithDictionary:(id)a3
{
  id v4;
  PKAppleBalanceDirectTopUpConfigurationDenomination *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currencyCode;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppleBalanceDirectTopUpConfigurationDenomination;
  v5 = -[PKAppleBalanceDirectTopUpConfigurationDenomination init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceDirectTopUpConfigurationDenomination)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalanceDirectTopUpConfigurationDenomination *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currencyCode;

  v4 = a3;
  v5 = -[PKAppleBalanceDirectTopUpConfigurationDenomination init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *amount;
  NSDecimalNumber *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  amount = self->_amount;
  v6 = (NSDecimalNumber *)v4[1];
  if (!amount || !v6)
  {
    if (amount == v6)
      goto LABEL_5;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  if ((-[NSDecimalNumber isEqual:](amount, "isEqual:") & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = (void *)v4[2];
  v8 = self->_currencyCode;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    v11 = 1;
  }
  else
  {
    v11 = 0;
    if (v8 && v9)
      v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);
  }

LABEL_13:
  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber description](self->_amount, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), v4);

  -[NSString description](self->_currencyCode, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), v5);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalanceDirectTopUpConfigurationDenomination *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currencyCode;

  v5 = -[PKAppleBalanceDirectTopUpConfigurationDenomination init](+[PKAppleBalanceDirectTopUpConfigurationDenomination allocWithZone:](PKAppleBalanceDirectTopUpConfigurationDenomination, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = (NSDecimalNumber *)v6;

  v8 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  return v5;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
