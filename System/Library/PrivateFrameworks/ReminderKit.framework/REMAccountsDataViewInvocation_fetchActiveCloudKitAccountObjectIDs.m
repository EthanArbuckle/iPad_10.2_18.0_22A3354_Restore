@implementation REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithFetchOption:(int64_t)a3
{
  REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs;
  result = -[REMStoreInvocationValueStorage init](&v5, sel_init);
  if (result)
    result->_fetchOption = a3;
  return result;
}

- (REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs)initWithCoder:(id)a3
{
  return -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs initWithFetchOption:](self, "initWithFetchOption:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("fetchOption")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs fetchOption](self, "fetchOption"), CFSTR("fetchOption"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs fetchOption](self, "fetchOption");
    v6 = v5 == objc_msgSend(v4, "fetchOption");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs;
  -[REMStoreInvocation name](&v8, sel_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs fetchOption](self, "fetchOption"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(fetchOption=%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)fetchOption
{
  return self->_fetchOption;
}

@end
