@implementation PKTransactionAmount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKTransactionAmount *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *amount;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *unitIdentifier;

  v5 = -[PKTransactionAmount init](+[PKTransactionAmount allocWithZone:](PKTransactionAmount, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v6;

  v8 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  label = v5->_label;
  v5->_label = (NSString *)v8;

  v5->_pending = self->_pending;
  v10 = -[NSString copyWithZone:](self->_unitIdentifier, "copyWithZone:", a3);
  unitIdentifier = v5->_unitIdentifier;
  v5->_unitIdentifier = (NSString *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pending, CFSTR("pending"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unitIdentifier, CFSTR("unitIdentifier"));

}

- (PKTransactionAmount)initWithCoder:(id)a3
{
  id v4;
  PKTransactionAmount *v5;
  uint64_t v6;
  PKCurrencyAmount *amount;
  uint64_t v8;
  NSString *label;
  uint64_t v10;
  NSString *unitIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionAmount;
  v5 = -[PKTransactionAmount init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v8;

    v5->_pending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pending"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unitIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    unitIdentifier = v5->_unitIdentifier;
    v5->_unitIdentifier = (NSString *)v10;

  }
  return v5;
}

- (PKTransactionAmount)initWithCurrencyAmount:(id)a3
{
  return -[PKTransactionAmount initWithCurrencyAmount:label:](self, "initWithCurrencyAmount:label:", a3, 0);
}

- (PKTransactionAmount)initWithCurrencyAmount:(id)a3 label:(id)a4
{
  id v7;
  id v8;
  PKTransactionAmount *v9;
  PKTransactionAmount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionAmount;
  v9 = -[PKTransactionAmount init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_amount, a3);
    objc_storeStrong((id *)&v10->_label, a4);
    v10->_pending = 0;
  }

  return v10;
}

- (PKTransactionAmount)initWithCurrencyAmount:(id)a3 label:(id)a4 unitIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKTransactionAmount *v12;
  PKTransactionAmount *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKTransactionAmount;
  v12 = -[PKTransactionAmount init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_amount, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    objc_storeStrong((id *)&v13->_unitIdentifier, a5);
    v13->_pending = 0;
  }

  return v13;
}

- (PKTransactionAmount)initWithPendingCurrencyAmount:(id)a3 unitIdentifier:(id)a4
{
  id v7;
  id v8;
  PKTransactionAmount *v9;
  PKTransactionAmount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTransactionAmount;
  v9 = -[PKTransactionAmount init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_amount, a3);
    v10->_pending = 1;
    objc_storeStrong((id *)&v10->_unitIdentifier, a4);
  }

  return v10;
}

- (PKTransactionAmount)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  PKCurrencyAmount *v11;
  PKCurrencyAmount *v12;
  void *v13;
  PKCurrencyAmount *v14;
  PKTransactionAmount *v15;
  PKTransactionAmount *v16;

  v4 = a3;
  objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "PKDecimalNumberForKey:", CFSTR("value"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("currency"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("exponent"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("pending"));
  objc_msgSend(v4, "PKStringForKey:", CFSTR("unitIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [PKCurrencyAmount alloc];
  v12 = v11;
  if (v9)
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTION_PENDING_AMOUNT"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKCurrencyAmount initWithAmount:exponent:preformattedString:](v12, "initWithAmount:exponent:preformattedString:", v5, v7, v13);

    v15 = -[PKTransactionAmount initWithPendingCurrencyAmount:unitIdentifier:](self, "initWithPendingCurrencyAmount:unitIdentifier:", v14, v10);
  }
  else
  {
    v14 = -[PKCurrencyAmount initWithAmount:currency:exponent:](v11, "initWithAmount:currency:exponent:", v5, v6, v7);
    v15 = -[PKTransactionAmount initWithCurrencyAmount:label:](self, "initWithCurrencyAmount:label:", v14, v8);
  }
  v16 = v15;

  return v16;
}

- (id)description
{
  void *v3;
  NSString *unitIdentifier;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_pending)
  {
    unitIdentifier = self->_unitIdentifier;
    -[PKCurrencyAmount formattedStringValue](self->_amount, "formattedStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Pending, Unit Identifier: %@, Amount: %@"), unitIdentifier, v5);
  }
  else
  {
    -[PKCurrencyAmount formattedStringValue](self->_amount, "formattedStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Amount: %@, Label: %@"), v5, self->_label);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *label;
  void *v8;
  void *v9;
  NSString *unitIdentifier;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKCurrencyAmount amount](self->_amount, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("amount"));

  -[PKCurrencyAmount currency](self->_amount, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("currency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKCurrencyAmount exponent](self->_amount, "exponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("exponent"));

  label = self->_label;
  if (label)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", label, CFSTR("label"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("label"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pending);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pending"));

  unitIdentifier = self->_unitIdentifier;
  if (unitIdentifier)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", unitIdentifier, CFSTR("unitIdentifier"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("unitIdentifier"));

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_label);
  objc_msgSend(v3, "safelyAddObject:", self->_unitIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_pending - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PKCurrencyAmount *amount;
  uint64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  NSString *label;
  void *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  _BOOL4 v16;
  NSString *unitIdentifier;
  uint64_t v18;
  int pending;

  v4 = a3;
  amount = self->_amount;
  objc_msgSend(v4, "amount");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (amount)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (amount == (PKCurrencyAmount *)v6)
      goto LABEL_9;
  }
  else if (-[PKCurrencyAmount isEqual:](amount, "isEqual:", v6))
  {
LABEL_9:
    label = self->_label;
    objc_msgSend(v4, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = label;
    v14 = v12;
    v15 = v14;
    if (v13 == v14)
    {

    }
    else
    {
      if (!v13 || !v14)
      {

        goto LABEL_21;
      }
      v16 = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

      if (!v16)
      {
        v9 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    unitIdentifier = self->_unitIdentifier;
    objc_msgSend(v4, "unitIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)v18;
    if (unitIdentifier && v18)
    {
      if ((-[NSString isEqual:](unitIdentifier, "isEqual:", v18) & 1) != 0)
        goto LABEL_22;
    }
    else if (unitIdentifier == (NSString *)v18)
    {
LABEL_22:
      pending = self->_pending;
      v9 = pending == objc_msgSend(v4, "isPending");
      goto LABEL_23;
    }
LABEL_21:
    v9 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v9 = 0;
LABEL_25:

  return v9;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (BOOL)isPending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSString)unitIdentifier
{
  return self->_unitIdentifier;
}

- (void)setUnitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitIdentifier, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
