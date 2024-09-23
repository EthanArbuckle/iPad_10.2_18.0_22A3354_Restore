@implementation NavigationModeGuidanceConfiguration

- (NSString)description
{
  _TtC4Maps35NavigationModeGuidanceConfiguration *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10003999C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return byte_101494390;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_101494390 = a3;
}

- (_TtC4Maps35NavigationModeGuidanceConfiguration)initWithCoder:(id)a3
{
  id v3;
  _TtC4Maps35NavigationModeGuidanceConfiguration *v4;

  v3 = a3;
  v4 = (_TtC4Maps35NavigationModeGuidanceConfiguration *)sub_10003C7D0(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Maps35NavigationModeGuidanceConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_100039CCC(v4);

}

- (_TtC4Maps35NavigationModeGuidanceConfiguration)init
{
  _TtC4Maps35NavigationModeGuidanceConfiguration *result;

  result = (_TtC4Maps35NavigationModeGuidanceConfiguration *)_swift_stdlib_reportUnimplementedInitializer("Maps.NavigationModeGuidanceConfiguration", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
