@implementation REMAccountsDataViewInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocationResult)initWithStorages:(id)a3
{
  id v5;
  REMAccountsDataViewInvocationResult *v6;
  REMAccountsDataViewInvocationResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataViewInvocationResult;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountStorages, a3);

  return v7;
}

- (REMAccountsDataViewInvocationResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  REMAccountsDataViewInvocationResult *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("accountStorages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[REMAccountsDataViewInvocationResult initWithStorages:](self, "initWithStorages:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMAccountsDataViewInvocationResult accountStorages](self, "accountStorages");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountStorages"));

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
    -[REMAccountsDataViewInvocationResult accountStorages](self, "accountStorages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountStorages");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMAccountsDataViewInvocationResult accountStorages](self, "accountStorages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountStorages");
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

  -[REMAccountsDataViewInvocationResult accountStorages](self, "accountStorages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)accountStorages
{
  return self->_accountStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStorages, 0);
}

@end
