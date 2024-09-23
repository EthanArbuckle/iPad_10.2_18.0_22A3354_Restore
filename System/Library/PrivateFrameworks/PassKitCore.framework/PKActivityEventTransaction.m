@implementation PKActivityEventTransaction

- (PKActivityEventTransaction)initWithTransaction:(id)a3 unread:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKActivityEventTransaction *v12;
  PKActivityEventTransaction *v13;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("transaction-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PKActivityEventTransaction;
  v12 = -[PKActivityEvent initWithIdentifier:date:unread:](&v15, sel_initWithIdentifier_date_unread_, v10, v11, v4);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_transaction, a3);

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKActivityEventTransaction;
  v3 = -[PKActivityEvent hash](&v5, sel_hash);
  return -[PKPaymentTransaction hash](self->_transaction, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  id v4;
  _QWORD *v5;
  PKPaymentTransaction *transaction;
  PKPaymentTransaction *v7;
  BOOL v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)PKActivityEventTransaction;
    if (-[PKActivityEvent isEqualToActivityEvent:](&v11, sel_isEqualToActivityEvent_, v5))
    {
      transaction = self->_transaction;
      v7 = (PKPaymentTransaction *)v5[5];
      if (transaction)
        v8 = v7 == 0;
      else
        v8 = 1;
      if (v8)
        v9 = transaction == v7;
      else
        v9 = -[PKPaymentTransaction isEqual:](transaction, "isEqual:");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)eventType
{
  return CFSTR("merchantTransaction");
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
