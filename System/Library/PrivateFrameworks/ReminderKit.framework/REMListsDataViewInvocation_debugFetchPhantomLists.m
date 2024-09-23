@implementation REMListsDataViewInvocation_debugFetchPhantomLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMListsDataViewInvocation_debugFetchPhantomLists;
  return -[REMStoreInvocationValueStorage hash](&v3, sel_hash);
}

@end
