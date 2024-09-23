@implementation DeviceQuery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceQuery)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (DeviceQuery *)DeviceQuery.init(identifier:display:pronunciationHint:)();
}

- (DeviceQuery)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DeviceQuery *)DeviceQuery.init(coder:)();
}

@end
