@implementation Identity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Identity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2463C0618();
  sub_2463C0618();
  if (a5)
    sub_2463C0618();
  return (Identity *)Identity.init(identifier:display:pronunciationHint:)();
}

- (Identity)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (Identity *)Identity.init(coder:)();
}

@end
