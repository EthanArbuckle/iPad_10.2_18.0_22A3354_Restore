@implementation REMReminderPredicateDescriptor_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderPredicateDescriptor_Codable)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMReminderPredicateDescriptor initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (REMReminderPredicateDescriptor_Codable)initWithType:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[REMReminderPredicateDescriptor initWithType:](&v5, sel_initWithType_, a3);
}

- (REMReminderPredicateDescriptor_Codable)initWithReminderPredicateDescriptor:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor_Codable *result;

  v3 = a3;
  result = (REMReminderPredicateDescriptor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
