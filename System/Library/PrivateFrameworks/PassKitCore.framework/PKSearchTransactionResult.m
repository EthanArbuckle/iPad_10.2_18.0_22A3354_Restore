@implementation PKSearchTransactionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentTransaction *transaction;
  id v5;

  transaction = self->_transaction;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transaction, CFSTR("transaction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));

}

- (PKSearchTransactionResult)initWithCoder:(id)a3
{
  id v4;
  PKSearchTransactionResult *v5;
  uint64_t v6;
  PKPaymentTransaction *transaction;
  uint64_t v8;
  NSString *passUniqueIdentifier;

  v4 = a3;
  v5 = -[PKSearchTransactionResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionResult;
  -[PKSearchTransactionResult description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("transaction: '%@'; "), self->_transaction);
  objc_msgSend(v4, "appendFormat:", CFSTR("passUniqueIdentifier: '%@'; "), self->_passUniqueIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKPaymentTransaction *transaction;
  PKPaymentTransaction *v6;
  NSString *passUniqueIdentifier;
  NSString *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  transaction = self->_transaction;
  v6 = (PKPaymentTransaction *)v4[1];
  if (!transaction || !v6)
  {
    if (transaction == v6)
      goto LABEL_5;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!-[PKPaymentTransaction isEqual:](transaction, "isEqual:"))
    goto LABEL_9;
LABEL_5:
  passUniqueIdentifier = self->_passUniqueIdentifier;
  v8 = (NSString *)v4[2];
  if (passUniqueIdentifier && v8)
    v9 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
  else
    v9 = passUniqueIdentifier == v8;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_transaction);
  objc_msgSend(v3, "safelyAddObject:", self->_passUniqueIdentifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
