@implementation REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](&v5, sel_initWithFetchResultTokenToDiffAgainst_, a3);
}

- (REMPermanentlyHiddenDataView_PermanentlyHiddenInvocation)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
