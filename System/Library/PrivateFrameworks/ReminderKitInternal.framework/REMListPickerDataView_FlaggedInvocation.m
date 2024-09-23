@implementation REMListPickerDataView_FlaggedInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListPickerDataView_FlaggedInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](&v5, sel_initWithFetchResultTokenToDiffAgainst_, a3);
}

- (REMListPickerDataView_FlaggedInvocation)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMStoreSwiftInvocation initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
