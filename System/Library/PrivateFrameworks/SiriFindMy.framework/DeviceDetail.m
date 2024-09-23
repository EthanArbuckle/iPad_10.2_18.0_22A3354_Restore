@implementation DeviceDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceDetail)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_1CCCF2A9C();
  sub_1CCCF2A9C();
  if (a5)
    sub_1CCCF2A9C();
  return (DeviceDetail *)DeviceDetail.init(identifier:display:pronunciationHint:)();
}

- (DeviceDetail)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DeviceDetail *)DeviceDetail.init(coder:)();
}

@end
