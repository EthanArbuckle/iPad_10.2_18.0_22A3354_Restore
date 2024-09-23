@implementation SearchAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchAttributes)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D8524();
  return (SearchAttributes *)SearchAttributes.init(identifier:display:pronunciationHint:)();
}

- (SearchAttributes)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (SearchAttributes *)SearchAttributes.init(coder:)();
}

@end
