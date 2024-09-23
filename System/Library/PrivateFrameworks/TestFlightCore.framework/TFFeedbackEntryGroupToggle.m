@implementation TFFeedbackEntryGroupToggle

- (TFFeedbackEntryGroupToggle)initWithGroupIdentifier:(id)a3 title:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TFFeedbackEntryGroupToggle;
  return -[TFFeedbackEntry initWithType:identifier:title:](&v5, sel_initWithType_identifier_title_, 2, a3, a4);
}

@end
