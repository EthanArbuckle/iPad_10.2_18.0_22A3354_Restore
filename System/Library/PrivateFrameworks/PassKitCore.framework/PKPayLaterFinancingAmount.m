@implementation PKPayLaterFinancingAmount

- (PKPayLaterFinancingAmount)initWithCurrencyAmount:(id)a3
{
  id v5;
  PKPayLaterFinancingAmount *v6;
  PKPayLaterFinancingAmount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingAmount;
  v6 = -[PKPayLaterFinancingAmount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_currencyAmount, a3);

  return v7;
}

- (PKPayLaterFinancingAmount)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingAmount *v5;
  PKPayLaterFinancingAmount *v6;
  NSDecimalNumber *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  PKCurrencyAmount *currencyAmount;
  NSDecimalNumber *v12;
  NSString *v13;
  NSString *v14;
  uint64_t v15;
  PKCurrencyAmount *merchantCurrencyAmount;
  objc_super v18;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v18.receiver = self;
    v18.super_class = (Class)PKPayLaterFinancingAmount;
    v6 = -[PKPayLaterFinancingAmount init](&v18, sel_init);
    if (v6)
    {
      objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
      v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "PKStringForKey:", CFSTR("amountCurrency"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 && v8)
      {
        PKCurrencyAmountCreate(v7, v8, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        currencyAmount = v6->_currencyAmount;
        v6->_currencyAmount = (PKCurrencyAmount *)v10;

      }
      objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("merchantAmount"));
      v12 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantAmountCurrency"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12 && v13)
      {
        PKCurrencyAmountCreate(v12, v13, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        merchantCurrencyAmount = v6->_merchantCurrencyAmount;
        v6->_merchantCurrencyAmount = (PKCurrencyAmount *)v15;

      }
    }
    self = v6;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[PKCurrencyAmount copyWithZone:](self->_currencyAmount, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_merchantCurrencyAmount, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingAmount *v4;
  PKPayLaterFinancingAmount *v5;
  PKPayLaterFinancingAmount *v6;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *merchantCurrencyAmount;
  PKCurrencyAmount *v10;
  char v11;

  v4 = (PKPayLaterFinancingAmount *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        currencyAmount = self->_currencyAmount;
        v8 = v6->_currencyAmount;
        if (currencyAmount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
          {
LABEL_7:
            merchantCurrencyAmount = self->_merchantCurrencyAmount;
            v10 = v6->_merchantCurrencyAmount;
            if (merchantCurrencyAmount && v10)
              v11 = -[PKCurrencyAmount isEqual:](merchantCurrencyAmount, "isEqual:");
            else
              v11 = merchantCurrencyAmount == v10;
            goto LABEL_15;
          }
        }
        else if (currencyAmount == v8)
        {
          goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCurrencyAmount);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *currencyAmount;
  id v5;

  currencyAmount = self->_currencyAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantCurrencyAmount, CFSTR("merchantCurrencyAmount"));

}

- (PKPayLaterFinancingAmount)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingAmount *v5;
  uint64_t v6;
  PKCurrencyAmount *currencyAmount;
  uint64_t v8;
  PKCurrencyAmount *merchantCurrencyAmount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterFinancingAmount;
  v5 = -[PKPayLaterFinancingAmount init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCurrencyAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchantCurrencyAmount = v5->_merchantCurrencyAmount;
    v5->_merchantCurrencyAmount = (PKCurrencyAmount *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: %@; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCurrencyAmount: %@; "), self->_merchantCurrencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (PKCurrencyAmount)merchantCurrencyAmount
{
  return self->_merchantCurrencyAmount;
}

- (void)setMerchantCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_merchantCurrencyAmount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantCurrencyAmount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
