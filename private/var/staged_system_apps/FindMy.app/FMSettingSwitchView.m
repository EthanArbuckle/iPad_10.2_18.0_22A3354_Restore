@implementation FMSettingSwitchView

- (_TtC6FindMy19FMSettingSwitchView)init
{
  return (_TtC6FindMy19FMSettingSwitchView *)sub_100115E64();
}

- (_TtC6FindMy19FMSettingSwitchView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100117224();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityValue
{
  NSString v2;

  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE100000000000000);
  return (NSString *)v2;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC6FindMy19FMSettingSwitchView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (unint64_t)accessibilityTraits
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_settingSwitch), "accessibilityTraits");
}

- (BOOL)accessibilityActivate
{
  _TtC6FindMy19FMSettingSwitchView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10011618C();

  return v3 & 1;
}

- (void)switchChanged
{
  _TtC6FindMy19FMSettingSwitchView *v2;

  v2 = self;
  sub_100116FA8();

}

- (void)subtitleLabelSelected
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_delegate);
  if (Strong)
  {
    v5 = Strong;
    v6 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(_TtC6FindMy19FMSettingSwitchView *, uint64_t, uint64_t))(v6 + 16))(self, ObjectType, v6);
    swift_unknownObjectRelease(v5);
  }
}

- (_TtC6FindMy19FMSettingSwitchView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy19FMSettingSwitchView *result;

  result = (_TtC6FindMy19FMSettingSwitchView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSettingSwitchView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_subtitleShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_subtitleHiddenConstraints));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->titleLabel[OBJC_IVAR____TtC6FindMy19FMSettingSwitchView_subtitle]);
}

@end
