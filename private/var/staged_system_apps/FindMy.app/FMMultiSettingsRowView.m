@implementation FMMultiSettingsRowView

- (_TtC6FindMy22FMMultiSettingsRowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100431FCC();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC6FindMy22FMMultiSettingsRowView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100430760();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6FindMy22FMMultiSettingsRowView *v11;

  v7 = sub_100006C5C(0, (unint64_t *)&qword_1005D3F00, UITouch_ptr);
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100431B88(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100431D64(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100431D64(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC6FindMy22FMMultiSettingsRowView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy22FMMultiSettingsRowView *result;

  result = (_TtC6FindMy22FMMultiSettingsRowView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMMultiSettingsRowView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_identifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_backgroundView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_secondaryLabel));

  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMMultiSettingsRowView_subtitleColor));
}

@end
