@implementation ResultEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ResultEntity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_21E9D8524();
  sub_21E9D8524();
  if (a5)
    sub_21E9D8524();
  return (ResultEntity *)ResultEntity.init(identifier:display:pronunciationHint:)();
}

- (ResultEntity)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (ResultEntity *)ResultEntity.init(coder:)();
}

@end
