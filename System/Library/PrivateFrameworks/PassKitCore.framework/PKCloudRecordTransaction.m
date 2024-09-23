@implementation PKCloudRecordTransaction

+ (id)dateFormatter
{
  if (qword_1EE1C56F0 != -1)
    dispatch_once(&qword_1EE1C56F0, &__block_literal_global_216);
  return (id)_MergedGlobals_1_8;
}

uint64_t __41__PKCloudRecordTransaction_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_1_8;
  _MergedGlobals_1_8 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_1_8, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
}

- (id)item
{
  return self->_transaction;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordTransaction)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordTransaction *v5;
  uint64_t v6;
  PKPaymentTransaction *transaction;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordTransaction;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transcation"));
    v6 = objc_claimAutoreleasedReturnValue();
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordTransaction;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, CFSTR("transcation"), v5.receiver, v5.super_class);

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PKCloudRecordTransaction transaction](self, "transaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transactionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transactionDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "compare:", v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordTransaction _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordTransaction;
  -[PKCloudRecordObject descriptionWithItem:](&v8, sel_descriptionWithItem_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v6);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PKCloudRecordTransaction _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordTransaction;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_transaction)
  {
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "dateFormatter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransaction transactionDate](self->_transaction, "transactionDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringFromDate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "appendFormat:", CFSTR("transaction: (%@)\n%@\n"), v9, self->_transaction);
    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated transaction in database\n"));
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKPaymentTransaction *v8;
  PKPaymentTransaction *transaction;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordTransaction;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_transaction)
    {
      objc_msgSend(v5, "transaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "transaction");
        v8 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
        transaction = self->_transaction;
        self->_transaction = v8;

      }
    }

  }
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
