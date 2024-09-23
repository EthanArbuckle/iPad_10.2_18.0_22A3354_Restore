@implementation PKAccountRewards

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountRewards)initWithCoder:(id)a3
{
  id v4;
  PKAccountRewards *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKCurrencyAmount *currencyAmount;
  uint64_t v10;
  NSString *status;
  uint64_t v12;
  PKPaymentTransactionRewards *rewards;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSSet *transactionIdentifiers;
  uint64_t v19;
  NSSet *rewardsAddedIdentifiers;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountRewards;
  v5 = -[PKAccountRewards init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v10 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v10;

    v5->_statusCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statusCode"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewards"));
    v12 = objc_claimAutoreleasedReturnValue();
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("transactionIdentifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    transactionIdentifiers = v5->_transactionIdentifiers;
    v5->_transactionIdentifiers = (NSSet *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("rewardsAddedIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    rewardsAddedIdentifiers = v5->_rewardsAddedIdentifiers;
    v5->_rewardsAddedIdentifiers = (NSSet *)v19;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statusCode, CFSTR("statusCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewards, CFSTR("rewards"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionIdentifiers, CFSTR("transactionIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsAddedIdentifiers, CFSTR("rewardsAddedIdentifiers"));

}

- (PKAccountRewards)initWithRecord:(id)a3
{
  id v4;
  PKAccountRewards *v5;
  uint64_t v6;
  NSString *identifier;
  NSString *v8;
  NSDecimalNumber *v9;
  NSDecimalNumber *v10;
  uint64_t v11;
  PKCurrencyAmount *currencyAmount;
  uint64_t v13;
  NSString *status;
  void *v15;
  PKPaymentTransactionRewards *v16;
  void *v17;
  uint64_t v18;
  PKPaymentTransactionRewards *rewards;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *transactionIdentifiers;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSSet *rewardsAddedIdentifiers;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountRewards;
  v5 = -[PKAccountRewards init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("amount"));
    v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && v8)
    {
      PKCurrencyAmountCreate(v9, v8, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      currencyAmount = v5->_currencyAmount;
      v5->_currencyAmount = (PKCurrencyAmount *)v11;

    }
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("status"));
    v13 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (NSString *)v13;

    v5->_statusCode = (int)objc_msgSend(v4, "pk_encryptedIntForKey:", CFSTR("statusCode"));
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKAccountRewardRedemptionTypeFromString(v15);

    v16 = [PKPaymentTransactionRewards alloc];
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("rewards"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKPaymentTransactionRewards initWithJsonString:](v16, "initWithJsonString:", v17);
    rewards = v5->_rewards;
    v5->_rewards = (PKPaymentTransactionRewards *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v21, CFSTR("transactionIdentifiers"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    transactionIdentifiers = v5->_transactionIdentifiers;
    v5->_transactionIdentifiers = (NSSet *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v26, CFSTR("rewardsAddedIdentifiers"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    rewardsAddedIdentifiers = v5->_rewardsAddedIdentifiers;
    v5->_rewardsAddedIdentifiers = (NSSet *)v28;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a3, "encryptedValues");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v5, CFSTR("amount"));

  -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v6, CFSTR("currencyCode"));

  objc_msgSend(v20, "setObject:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_statusCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v7, CFSTR("statusCode"));

  PKAccountRewardRedemptionTypeToString(self->_type);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v8, CFSTR("type"));

  -[PKPaymentTransactionRewards jsonString](self->_rewards, "jsonString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v9, CFSTR("rewards"));

  if (self->_transactionIdentifiers)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = (void *)MEMORY[0x1E0CB36D8];
    -[NSSet allObjects](self->_transactionIdentifiers, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataWithJSONObject:options:error:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithData:encoding:", v13, 4);

    objc_msgSend(v20, "setObject:forKey:", v14, CFSTR("transactionIdentifiers"));
  }
  if (self->_rewardsAddedIdentifiers)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    v16 = (void *)MEMORY[0x1E0CB36D8];
    -[NSSet allObjects](self->_rewardsAddedIdentifiers, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataWithJSONObject:options:error:", v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithData:encoding:", v18, 4);

    objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("rewardsAddedIdentifiers"));
  }

}

+ (id)recordType
{
  return CFSTR("Rewards");
}

+ (id)recordNamePrefix
{
  return CFSTR("rewardsRedeemed-");
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_status);
  objc_msgSend(v3, "safelyAddObject:", self->_rewards);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsAddedIdentifiers);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_statusCode - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountRewards *v4;
  PKAccountRewards *v5;
  BOOL v6;

  v4 = (PKAccountRewards *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountRewards isEqualToAccountEvent:](self, "isEqualToAccountEvent:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEvent:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v9;
  NSString *status;
  NSString *v11;
  PKPaymentTransactionRewards *rewards;
  PKPaymentTransactionRewards *v13;
  NSSet *transactionIdentifiers;
  NSSet *v15;
  NSSet *rewardsAddedIdentifiers;
  NSSet *v17;
  BOOL v18;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_36;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_36;
  }
  currencyAmount = self->_currencyAmount;
  v9 = (PKCurrencyAmount *)v4[2];
  if (currencyAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_36;
  }
  else if (currencyAmount != v9)
  {
    goto LABEL_36;
  }
  status = self->_status;
  v11 = (NSString *)v4[3];
  if (status && v11)
  {
    if ((-[NSString isEqual:](status, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (status != v11)
  {
    goto LABEL_36;
  }
  rewards = self->_rewards;
  v13 = (PKPaymentTransactionRewards *)v4[5];
  if (rewards && v13)
  {
    if (!-[PKPaymentTransactionRewards isEqual:](rewards, "isEqual:"))
      goto LABEL_36;
  }
  else if (rewards != v13)
  {
    goto LABEL_36;
  }
  transactionIdentifiers = self->_transactionIdentifiers;
  v15 = (NSSet *)v4[7];
  if (transactionIdentifiers && v15)
  {
    if ((-[NSSet isEqual:](transactionIdentifiers, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (transactionIdentifiers != v15)
  {
    goto LABEL_36;
  }
  rewardsAddedIdentifiers = self->_rewardsAddedIdentifiers;
  v17 = (NSSet *)v4[8];
  if (!rewardsAddedIdentifiers || !v17)
  {
    if (rewardsAddedIdentifiers == v17)
      goto LABEL_34;
LABEL_36:
    v18 = 0;
    goto LABEL_37;
  }
  if ((-[NSSet isEqual:](rewardsAddedIdentifiers, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_34:
  if (self->_statusCode != v4[4])
    goto LABEL_36;
  v18 = self->_type == v4[6];
LABEL_37:

  return v18;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  -[PKCurrencyAmount description](self->_currencyAmount, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), v4);

  PKAccountRewardRedemptionTypeToString(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v5);

  -[NSString description](self->_status, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("status: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("statusCode: '%lu'; "), self->_statusCode);
  -[PKPaymentTransactionRewards description](self->_rewards, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewards: '%@'; "), v7);

  -[NSSet description](self->_rewardsAddedIdentifiers, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsAddedIdentifier: '%@'; "), v8);

  -[NSSet description](self->_transactionIdentifiers, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionIdentifiers: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (PKPaymentTransactionRewards)rewards
{
  return self->_rewards;
}

- (void)setRewards:(id)a3
{
  objc_storeStrong((id *)&self->_rewards, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSSet)transactionIdentifiers
{
  return self->_transactionIdentifiers;
}

- (void)setTransactionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)rewardsAddedIdentifiers
{
  return self->_rewardsAddedIdentifiers;
}

- (void)setRewardsAddedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsAddedIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionIdentifiers, 0);
  objc_storeStrong((id *)&self->_rewards, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
