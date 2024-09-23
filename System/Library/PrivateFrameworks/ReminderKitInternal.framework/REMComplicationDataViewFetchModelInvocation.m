@implementation REMComplicationDataViewFetchModelInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMComplicationDataViewFetchModelInvocation)initWithCoder:(id)a3
{
  return -[REMComplicationDataViewFetchModelInvocation init](self, sel_init, a3);
}

- (REMComplicationDataViewFetchModelInvocation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[REMStoreInvocationValueStorage init](&v3, sel_init);
}

@end
