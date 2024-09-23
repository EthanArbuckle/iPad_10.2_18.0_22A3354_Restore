@implementation SidebarButtonAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Settings19SidebarButtonAction *v6;
  id v7;

  v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC8Settings19SidebarButtonAction_action);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_1DB4A1620();
  objc_msgSend(v5, sel_encodeInteger_forKey_, v4, v7);

}

- (_TtC8Settings19SidebarButtonAction)initWithCoder:(id)a3
{
  id v3;
  _TtC8Settings19SidebarButtonAction *v4;

  v3 = a3;
  v4 = (_TtC8Settings19SidebarButtonAction *)sub_1DB4885B4(v3);

  return v4;
}

- (_TtC8Settings19SidebarButtonAction)init
{
  _TtC8Settings19SidebarButtonAction *result;

  result = (_TtC8Settings19SidebarButtonAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
