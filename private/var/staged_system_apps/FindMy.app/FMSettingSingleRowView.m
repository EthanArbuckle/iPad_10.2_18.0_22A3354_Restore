@implementation FMSettingSingleRowView

- (UIImage)accessibilityChevronImage
{
  return (UIImage *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_chevron), "image");
}

- (_TtC6FindMy22FMSettingSingleRowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002A8968();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC6FindMy22FMSettingSingleRowView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1002A7090();
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
  _TtC6FindMy22FMSettingSingleRowView *v11;

  v7 = sub_100006C5C(0, (unint64_t *)&qword_1005D3F00, UITouch_ptr);
  v8 = sub_1000B0798();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_1002A8500(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1002A86DC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1002A86DC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC6FindMy22FMSettingSingleRowView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy22FMSettingSingleRowView *result;

  result = (_TtC6FindMy22FMSettingSingleRowView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSettingSingleRowView", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_identifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_backgroundView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_secondaryDetailLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_secondaryLabelTrailingConstraint));
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_subDetailText]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_subtitleColor));
}

@end
