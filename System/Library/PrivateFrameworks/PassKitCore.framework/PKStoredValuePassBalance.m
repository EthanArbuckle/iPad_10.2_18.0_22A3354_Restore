@implementation PKStoredValuePassBalance

- (PKStoredValuePassBalance)initWithCurrencyAmount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKStoredValuePassBalance *v7;

  v4 = a3;
  objc_msgSend(v4, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    self = -[PKStoredValuePassBalance initWithIdentifier:cashAmount:currencyCode:expiryDate:](self, "initWithIdentifier:cashAmount:currencyCode:expiryDate:", 0, v5, v6, 0);
    v7 = self;
  }

  return v7;
}

- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 cashAmount:(id)a4 currencyCode:(id)a5 expiryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKStoredValuePassBalance *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *currencyCode;
  NSString *balanceType;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKStoredValuePassBalance;
  v14 = -[PKStoredValuePassBalance init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_amount, a4);
    v17 = objc_msgSend(v12, "copy");
    currencyCode = v14->_currencyCode;
    v14->_currencyCode = (NSString *)v17;

    balanceType = v14->_balanceType;
    v14->_balanceType = (NSString *)CFSTR("com.apple.wallet.storedvaluepassbalancetype.cash");

    objc_storeStrong((id *)&v14->_expiryDate, a6);
  }

  return v14;
}

- (PKStoredValuePassBalance)initWithTransitAppletBalance:(id)a3 balanceField:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PKStoredValuePassBalance *v11;
  void *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  PKStoredValuePassBalance *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balance");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    objc_msgSend(v6, "currency");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("XXX"));

    if (v13)
    {
      if ((unint64_t)(objc_msgSend(v7, "unitType") + 1) >= 4)
        v14 = CFSTR("com.apple.wallet.storedvaluepassbalancetype.loyaltypoints");
      else
        v14 = CFSTR("com.apple.wallet.storedvaluepassbalancetype.unknown");
      v15 = v14;
      objc_msgSend(v6, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "balance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expirationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[PKStoredValuePassBalance initWithIdentifier:amount:balanceType:expiryDate:](self, "initWithIdentifier:amount:balanceType:expiryDate:", v16, v17, v15, v18);

      self = v19;
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "balance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currency");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expirationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PKStoredValuePassBalance initWithIdentifier:cashAmount:currencyCode:expiryDate:](self, "initWithIdentifier:cashAmount:currencyCode:expiryDate:", v16, v17, v18, v20);

    }
    v11 = self;
  }

  return v11;
}

- (PKStoredValuePassBalance)initWithIdentifier:(id)a3 amount:(id)a4 balanceType:(id)a5 expiryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKStoredValuePassBalance *v14;
  uint64_t v15;
  NSString *identifier;
  NSString *currencyCode;
  uint64_t v18;
  NSString *balanceType;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKStoredValuePassBalance;
  v14 = -[PKStoredValuePassBalance init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    objc_storeStrong((id *)&v14->_amount, a4);
    currencyCode = v14->_currencyCode;
    v14->_currencyCode = 0;

    v18 = objc_msgSend(v12, "copy");
    balanceType = v14->_balanceType;
    v14->_balanceType = (NSString *)v18;

    objc_storeStrong((id *)&v14->_expiryDate, a6);
  }

  return v14;
}

- (PKStoredValuePassBalance)initWithCoder:(id)a3
{
  id v4;
  PKStoredValuePassBalance *v5;
  uint64_t v6;
  NSDecimalNumber *amount;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSString *balanceType;
  uint64_t v12;
  NSDate *expiryDate;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKStoredValuePassBalance;
  v5 = -[PKStoredValuePassBalance init](&v17, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceType"));
    v10 = objc_claimAutoreleasedReturnValue();
    balanceType = v5->_balanceType;
    v5->_balanceType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiryDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v14;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKStoredValuePassBalance *v4;
  PKStoredValuePassBalance *v5;
  BOOL v6;

  v4 = (PKStoredValuePassBalance *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKStoredValuePassBalance isEqualToBalance:](self, "isEqualToBalance:", v5);

  return v6;
}

- (BOOL)isEqualToBalance:(PKStoredValuePassBalance *)balance
{
  PKStoredValuePassBalance *v4;
  NSDecimalNumber *amount;
  NSDecimalNumber *v6;
  BOOL v7;
  char v8;
  NSString *currencyCode;
  NSString *v10;
  NSString *balanceType;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  NSDate *expiryDate;
  NSDate *v17;
  char v18;
  NSString *identifier;
  NSString *v21;

  v4 = balance;
  amount = self->_amount;
  v6 = v4->_amount;
  if (amount)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (amount != v6)
      goto LABEL_26;
  }
  else
  {
    v8 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_26;
  }
  currencyCode = self->_currencyCode;
  v10 = v4->_currencyCode;
  if (currencyCode && v10)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (currencyCode != v10)
  {
    goto LABEL_26;
  }
  balanceType = v4->_balanceType;
  v12 = self->_balanceType;
  v13 = balanceType;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_26;
    }
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_26;
  }
  expiryDate = self->_expiryDate;
  v17 = v4->_expiryDate;
  if (expiryDate && v17)
  {
    if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) != 0)
      goto LABEL_28;
LABEL_26:
    v18 = 0;
    goto LABEL_27;
  }
  if (expiryDate != v17)
    goto LABEL_26;
LABEL_28:
  identifier = self->_identifier;
  v21 = v4->_identifier;
  if (identifier && v21)
    v18 = -[NSString isEqual:](identifier, "isEqual:");
  else
    v18 = identifier == v21;
LABEL_27:

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceType);
  objc_msgSend(v3, "safelyAddObject:", self->_expiryDate);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceType, CFSTR("balanceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expiryDate, CFSTR("expiryDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (BOOL)isExpired
{
  void *v3;
  BOOL v4;

  if (!self->_expiryDate)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_expiryDate) != -1;

  return v4;
}

- (BOOL)isCurrencyBalance
{
  return self->_currencyCode != 0;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (PKStoredValuePassBalanceType)balanceType
{
  return self->_balanceType;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_balanceType, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
