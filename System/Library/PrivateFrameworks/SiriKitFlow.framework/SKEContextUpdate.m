@implementation SKEContextUpdate

+ (BOOL)supportsSecureCoding
{
  return static ContextUpdate.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ContextUpdate.supportsSecureCoding.setter(a3);
}

- (SKEContextUpdate)initWithCoder:(id)a3
{
  return (SKEContextUpdate *)ContextUpdate.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKEContextUpdate *v5;

  v4 = a3;
  v5 = self;
  sub_1C2A0525C(v4);

}

- (SKEContextUpdate)init
{
  ContextUpdate.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
