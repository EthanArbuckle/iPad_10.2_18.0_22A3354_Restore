@implementation FMMapSettingsView

- (void)handleModeTap
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC6FindMy17FMMapSettingsView *v8;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(v6 + 8);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (void)handleUnitTap
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  _TtC6FindMy17FMMapSettingsView *v8;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    swift_getObjectType(Strong);
    v7 = *(void (**)(void))(v6 + 16);
    v8 = self;
    v7();

    swift_unknownObjectRelease(v5);
  }
}

- (_TtC6FindMy17FMMapSettingsView)init
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  _TtC6FindMy17FMMapSettingsView *v6;
  uint64_t v7;
  id v8;
  char *v9;
  objc_super v11;

  v3 = OBJC_IVAR____TtC6FindMy17FMMapSettingsView_modeSettingRow;
  v4 = (objc_class *)type metadata accessor for FMSettingRowView();
  v5 = objc_allocWithZone(v4);
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_10044402C(1, 0.0);
  v7 = OBJC_IVAR____TtC6FindMy17FMMapSettingsView_unitSettingRow;
  v8 = objc_allocWithZone(v4);
  *(Class *)((char *)&v6->super.super.super.super.isa + v7) = (Class)sub_10044402C(1, 0.0);
  v9 = (char *)v6 + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9);

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for FMMapSettingsView();
  return -[FMPlatterGroupView init](&v11, "init");
}

- (_TtC6FindMy17FMMapSettingsView)initWithCoder:(id)a3
{
  return (_TtC6FindMy17FMMapSettingsView *)sub_100369E64(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_modeSettingRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_unitSettingRow));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate);
}

@end
