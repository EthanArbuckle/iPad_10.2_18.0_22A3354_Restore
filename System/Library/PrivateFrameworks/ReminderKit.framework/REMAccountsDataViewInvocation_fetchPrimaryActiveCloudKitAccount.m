@implementation REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount

- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithFetchREMObjectIDOnly:(BOOL)a3
{
  REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount;
  result = -[REMStoreInvocationValueStorage init](&v5, sel_init);
  if (result)
    result->_fetchREMObjectIDOnly = a3;
  return result;
}

- (id)name
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount;
  -[REMStoreInvocation name](&v9, sel_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount fetchREMObjectIDOnly](self, "fetchREMObjectIDOnly");
  v6 = &stru_1E67FB1F0;
  if (v5)
    v6 = CFSTR("(fetchREMObjectIDOnly)");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)fetchREMObjectIDOnly
{
  return self->_fetchREMObjectIDOnly;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount)initWithCoder:(id)a3
{
  return -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount initWithFetchREMObjectIDOnly:](self, "initWithFetchREMObjectIDOnly:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("fetchREMObjectIDOnly")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount fetchREMObjectIDOnly](self, "fetchREMObjectIDOnly"), CFSTR("fetchREMObjectIDOnly"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount fetchREMObjectIDOnly](self, "fetchREMObjectIDOnly");
    v6 = v5 ^ objc_msgSend(v4, "fetchREMObjectIDOnly") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount fetchREMObjectIDOnly](self, "fetchREMObjectIDOnly");
}

@end
