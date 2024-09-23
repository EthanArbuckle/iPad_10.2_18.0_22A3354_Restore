@implementation NavigationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings15NavigationToken *v5;

  v4 = a3;
  v5 = self;
  sub_1DB45F824(v4);

}

- (_TtC8Settings15NavigationToken)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings15NavigationToken *v4;

  v3 = a3;
  v4 = (_TtC8Settings15NavigationToken *)sub_1DB4601E0();

  return v4;
}

- (_TtC8Settings15NavigationToken)init
{
  _TtC8Settings15NavigationToken *result;

  result = (_TtC8Settings15NavigationToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
