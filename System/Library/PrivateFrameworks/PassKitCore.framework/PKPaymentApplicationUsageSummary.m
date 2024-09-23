@implementation PKPaymentApplicationUsageSummary

- (PKPaymentApplicationUsageSummary)init
{

  return 0;
}

- (id)_databaseInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentApplicationUsageSummary;
  return -[PKPaymentApplicationUsageSummary init](&v3, sel_init);
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5
{
  return -[PKPaymentApplicationUsageSummary initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:lastUsedTransaction:](self, "initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:lastUsedTransaction:", a3, a4, a5, 0);
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsedTransaction:(id)a5
{
  return -[PKPaymentApplicationUsageSummary initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:lastUsedTransaction:](self, "initWithPassUniqueIdentifier:paymentApplicationIdentifier:lastUsed:lastUsedTransaction:", a3, a4, 0, a5);
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5 lastUsedTransaction:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPaymentApplicationUsageSummary *v15;
  PKPaymentApplicationUsageSummary *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentApplicationUsageSummary;
  v15 = -[PKPaymentApplicationUsageSummary init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_passUniqueIdentifier, a3);
    objc_storeStrong((id *)&v16->_paymentApplicationIdentifier, a4);
    objc_storeStrong((id *)&v16->_lastUsed, a5);
    objc_storeStrong((id *)&v16->_lastUsedTransaction, a6);
  }

  return v16;
}

- (void)updateWithSummary:(id)a3
{
  void *v4;
  NSDate *lastUsed;
  void *v6;
  void *v7;
  NSDate *lastUsedTransaction;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "lastUsed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    lastUsed = self->_lastUsed;
    if (lastUsed)
    {
      -[NSDate laterDate:](lastUsed, "laterDate:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentApplicationUsageSummary setLastUsed:](self, "setLastUsed:", v6);

    }
    else
    {
      -[PKPaymentApplicationUsageSummary setLastUsed:](self, "setLastUsed:", v4);
    }
  }
  objc_msgSend(v10, "lastUsedTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    lastUsedTransaction = self->_lastUsedTransaction;
    if (lastUsedTransaction)
    {
      -[NSDate laterDate:](lastUsedTransaction, "laterDate:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentApplicationUsageSummary setLastUsedTransaction:](self, "setLastUsedTransaction:", v9);

    }
    else
    {
      -[PKPaymentApplicationUsageSummary setLastUsedTransaction:](self, "setLastUsedTransaction:", v7);
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *passUniqueIdentifier;
  id v5;

  passUniqueIdentifier = self->_passUniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentApplicationIdentifier, CFSTR("paymentApplicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUsed, CFSTR("lastUsed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUsedTransaction, CFSTR("lastUsedTransaction"));

}

- (PKPaymentApplicationUsageSummary)initWithCoder:(id)a3
{
  id v4;
  PKPaymentApplicationUsageSummary *v5;
  uint64_t v6;
  NSString *passUniqueIdentifier;
  uint64_t v8;
  NSString *paymentApplicationIdentifier;
  uint64_t v10;
  NSDate *lastUsed;
  uint64_t v12;
  NSDate *lastUsedTransaction;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentApplicationUsageSummary;
  v5 = -[PKPaymentApplicationUsageSummary init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentApplicationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentApplicationIdentifier = v5->_paymentApplicationIdentifier;
    v5->_paymentApplicationIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsed"));
    v10 = objc_claimAutoreleasedReturnValue();
    lastUsed = v5->_lastUsed;
    v5->_lastUsed = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsedTransaction"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastUsedTransaction = v5->_lastUsedTransaction;
    v5->_lastUsedTransaction = (NSDate *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("passUniqueIdentifier: '%@'; "), self->_passUniqueIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("paymentApplicationIdentifier: '%@'; "), self->_paymentApplicationIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("lastUsed: '%@'; "), self->_lastUsed);
  objc_msgSend(v6, "appendFormat:", CFSTR("lastUsedTransaction: '%@'; "), self->_lastUsedTransaction);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, a3);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsed, a3);
}

- (NSDate)lastUsedTransaction
{
  return self->_lastUsedTransaction;
}

- (void)setLastUsedTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTransaction, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
