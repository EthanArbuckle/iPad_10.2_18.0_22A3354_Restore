@implementation FMLostModeSummaryTextView

- (_TtC6FindMy25FMLostModeSummaryTextView)init
{
  return (_TtC6FindMy25FMLostModeSummaryTextView *)sub_1002745CC();
}

- (_TtC6FindMy25FMLostModeSummaryTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100275C6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_contentTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_placeholderTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_lengthCounterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_headerStackView));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_delegate);
  sub_100071E5C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType), *(_QWORD *)&self->super.platter[OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType], self->super.footer[OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType]);
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC6FindMy25FMLostModeSummaryTextView *v5;

  v4 = a3;
  v5 = self;
  sub_100275DB8();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC6FindMy25FMLostModeSummaryTextView *v13;

  length = a4.length;
  location = a4.location;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_10027573C((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease(v11);
  return length & 1;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtC6FindMy25FMLostModeSummaryTextView *v5;

  v4 = a3;
  v5 = self;
  sub_100275F18();

}

@end
