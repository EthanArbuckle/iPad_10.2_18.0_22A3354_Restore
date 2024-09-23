@implementation REMGroceryDataView_SecondaryGroceryLocaleInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](&v5, sel_initWithFetchResultTokenToDiffAgainst_, a3);
}

- (REMGroceryDataView_SecondaryGroceryLocaleInvocation)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
