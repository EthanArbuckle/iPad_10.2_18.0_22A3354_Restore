@implementation SidebarConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings20SidebarConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_1DB4862B0(v4);

}

- (_TtC8Settings20SidebarConfiguration)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings20SidebarConfiguration *v4;

  v3 = a3;
  v4 = (_TtC8Settings20SidebarConfiguration *)sub_1DB488678(v3);

  return v4;
}

- (_TtC8Settings20SidebarConfiguration)init
{
  _TtC8Settings20SidebarConfiguration *result;

  result = (_TtC8Settings20SidebarConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
