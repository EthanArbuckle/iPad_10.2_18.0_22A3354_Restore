@implementation SidebarSection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1DB487D68(self, (uint64_t)a2, (void (*)(void))sub_1DB487DC0);
}

- (_TtC8Settings14SidebarSection)initWithCoder:(id)a3
{
  return (_TtC8Settings14SidebarSection *)SidebarSection.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Settings14SidebarSection *v5;

  v4 = a3;
  v5 = self;
  sub_1DB4882DC(v4);

}

- (_TtC8Settings14SidebarSection)init
{
  _TtC8Settings14SidebarSection *result;

  result = (_TtC8Settings14SidebarSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
