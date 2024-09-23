@implementation REMEventKitBridgingDataViewInvocation_fetchLists

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMEventKitBridgingDataViewInvocation_fetchLists)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMEventKitBridgingDataViewInvocation_fetchLists;
  return -[REMStoreInvocationValueStorage init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (v3 != 0) & isKindOfClass;
}

@end
