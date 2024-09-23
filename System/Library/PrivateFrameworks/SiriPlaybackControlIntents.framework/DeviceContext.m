@implementation DeviceContext

- (DeviceContext)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    sub_2249ECDD4();
  sub_2249ECDD4();
  if (a5)
    sub_2249ECDD4();
  return (DeviceContext *)DeviceContext.init(identifier:display:pronunciationHint:)();
}

- (NSString)description
{
  DeviceContext *v2;
  void *v3;

  v2 = self;
  DeviceContext.description.getter();

  v3 = (void *)sub_2249ECDB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  DeviceContext *v4;
  DeviceContext *v5;
  char v6;
  char v7;
  _OWORD v9[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2249ED17C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v5 = self;
  }
  DeviceContext.isEqual(_:)((uint64_t)v9);
  v7 = v6;

  sub_224801DB4((uint64_t)v9, &qword_25579C590);
  return v7 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceContext)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DeviceContext *)DeviceContext.init(coder:)();
}

@end
