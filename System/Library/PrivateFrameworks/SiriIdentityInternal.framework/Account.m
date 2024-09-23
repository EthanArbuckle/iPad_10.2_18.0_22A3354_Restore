@implementation Account

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Account)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2463C0618();
  sub_2463C0618();
  if (a5)
    sub_2463C0618();
  return (Account *)Account.init(identifier:display:pronunciationHint:)();
}

- (Account)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (Account *)Account.init(coder:)();
}

@end
