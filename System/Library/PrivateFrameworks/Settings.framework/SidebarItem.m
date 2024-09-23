@implementation SidebarItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1DB487D68(self, (uint64_t)a2, (void (*)(void))sub_1DB486D20);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings11SidebarItem *v5;

  v4 = a3;
  v5 = self;
  sub_1DB486F48(v4);

}

- (_TtC8Settings11SidebarItem)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings11SidebarItem *v4;

  v3 = a3;
  v4 = (_TtC8Settings11SidebarItem *)sub_1DB4889B8(v3);

  return v4;
}

- (_TtC8Settings11SidebarItem)init
{
  _TtC8Settings11SidebarItem *result;

  result = (_TtC8Settings11SidebarItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DB488998(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Settings11SidebarItem____lazy_storage___icon));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
