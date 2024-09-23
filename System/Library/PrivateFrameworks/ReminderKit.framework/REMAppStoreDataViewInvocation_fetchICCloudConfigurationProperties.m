@implementation REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties;
  return -[REMStoreInvocationValueStorage init](&v3, sel_init);
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
  v3.super_class = (Class)REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties;
  return -[REMStoreInvocationValueStorage hash](&v3, sel_hash);
}

@end
