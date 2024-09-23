@implementation TitlebarConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings21TitlebarConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1DB44DA18(v4);

}

- (_TtC8Settings21TitlebarConfiguration)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings21TitlebarConfiguration *v4;

  v3 = a3;
  v4 = (_TtC8Settings21TitlebarConfiguration *)sub_1DB44E368(v3);

  return v4;
}

- (_TtC8Settings21TitlebarConfiguration)init
{
  _TtC8Settings21TitlebarConfiguration *result;

  result = (_TtC8Settings21TitlebarConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
