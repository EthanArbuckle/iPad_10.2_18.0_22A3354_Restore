@implementation DeviceGroup

- (NSString)description
{
  DeviceGroup *v2;
  void *v3;

  v2 = self;
  DeviceGroup.description.getter();

  v3 = (void *)sub_2249ECDB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceGroup)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (DeviceGroup *)DeviceGroup.init(identifier:display:pronunciationHint:)();
}

- (DeviceGroup)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DeviceGroup *)DeviceGroup.init(coder:)();
}

@end
