@implementation PKAccountAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAction)initWithCoder:(id)a3
{
  id v4;
  PKAccountAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDecimalNumber *amount;
  uint64_t v10;
  NSString *currencyCode;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountAction;
  v5 = -[PKAccountAction init](&v13, sel_init);
  if (v5)
  {
    v5->_actionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v8 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v10;

    v5->_redemptionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rewardRedemptionType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t actionType;
  id v5;

  actionType = self->_actionType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", actionType, CFSTR("action"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_redemptionType, CFSTR("rewardRedemptionType"));

}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
