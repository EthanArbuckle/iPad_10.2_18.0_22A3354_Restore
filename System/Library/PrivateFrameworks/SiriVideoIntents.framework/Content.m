@implementation Content

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Content)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D8524();
  return (Content *)Content.init(identifier:display:pronunciationHint:)();
}

- (Content)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (Content *)Content.init(coder:)();
}

@end
