@implementation PKCloudRecordAccount

- (id)item
{
  return self->_account;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordAccount)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordAccount *v5;
  uint64_t v6;
  PKAccount *account;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordAccount;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (PKAccount *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordAccount;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, CFSTR("account"), v5.receiver, v5.super_class);

}

- (int64_t)compare:(id)a3
{
  PKAccount *account;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  account = self->_account;
  v4 = a3;
  -[PKAccount accountIdentifier](account, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordAccount _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordAccount;
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

  -[PKCloudRecordAccount _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordAccount;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PKAccount *account;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  if (account)
  {
    if (v3)
    {
      -[PKAccount accountIdentifier](account, "accountIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKFeatureIdentifierToString(-[PKAccount feature](self->_account, "feature"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("account: id: %@, feature: %@\n"), v7, v8);

    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated account in database\n"));
  }
  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKAccount *v8;
  PKAccount *account;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordAccount;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_account)
    {
      objc_msgSend(v5, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "account");
        v8 = (PKAccount *)objc_claimAutoreleasedReturnValue();
        account = self->_account;
        self->_account = v8;

      }
    }

  }
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
