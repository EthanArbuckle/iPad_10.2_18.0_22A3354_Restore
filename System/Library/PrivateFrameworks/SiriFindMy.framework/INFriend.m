@implementation INFriend

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INFriend)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A9C();
  return (INFriend *)INFriend.init(identifier:display:pronunciationHint:)();
}

- (INFriend)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (INFriend *)INFriend.init(coder:)();
}

@end
