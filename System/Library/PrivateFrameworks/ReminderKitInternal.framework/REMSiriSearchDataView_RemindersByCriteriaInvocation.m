@implementation REMSiriSearchDataView_RemindersByCriteriaInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initWithFetchResultTokenToDiffAgainst:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithFetchResultTokenToDiffAgainst_, a3);
}

- (id)initWithCoder:(uint64_t)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

@end
