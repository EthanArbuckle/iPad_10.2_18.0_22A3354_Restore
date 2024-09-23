@implementation LiveService

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LiveService)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D8524();
  return (LiveService *)LiveService.init(identifier:display:pronunciationHint:)();
}

- (LiveService)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LiveService *)LiveService.init(coder:)();
}

@end
