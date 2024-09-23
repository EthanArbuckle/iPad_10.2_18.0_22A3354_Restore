@implementation REMAccountsDataViewInvocationREMObjectIDOnlyResult

- (REMAccountsDataViewInvocationREMObjectIDOnlyResult)initWithAccountIDs:(id)a3
{
  id v5;
  REMAccountsDataViewInvocationREMObjectIDOnlyResult *v6;
  REMAccountsDataViewInvocationREMObjectIDOnlyResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataViewInvocationREMObjectIDOnlyResult;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountIDs, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMAccountsDataViewInvocationREMObjectIDOnlyResult accountIDs](self, "accountIDs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountIDs"));

}

- (NSArray)accountIDs
{
  return self->_accountIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocationREMObjectIDOnlyResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REMAccountsDataViewInvocationREMObjectIDOnlyResult *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("accountIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[REMAccountsDataViewInvocationREMObjectIDOnlyResult initWithAccountIDs:](self, "initWithAccountIDs:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMAccountsDataViewInvocationREMObjectIDOnlyResult accountIDs](self, "accountIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountIDs");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMAccountsDataViewInvocationREMObjectIDOnlyResult accountIDs](self, "accountIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMAccountsDataViewInvocationREMObjectIDOnlyResult accountIDs](self, "accountIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
