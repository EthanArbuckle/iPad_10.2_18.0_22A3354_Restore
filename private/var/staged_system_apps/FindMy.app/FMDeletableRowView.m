@implementation FMDeletableRowView

- (_TtC6FindMy18FMDeletableRowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100282ED8();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6FindMy18FMDeletableRowView *v11;

  v7 = sub_100006C5C(0, (unint64_t *)&qword_1005D3F00, UITouch_ptr);
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100282AE0(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100282C90(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100282C90(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC6FindMy18FMDeletableRowView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy18FMDeletableRowView *result;

  result = (_TtC6FindMy18FMDeletableRowView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMDeletableRowView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy18FMDeletableRowView_identifier]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy18FMDeletableRowView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy18FMDeletableRowView_subtitle]);

}

@end
