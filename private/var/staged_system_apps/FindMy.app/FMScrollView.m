@implementation FMScrollView

- (_TtC6FindMy12FMScrollView)init
{
  return (_TtC6FindMy12FMScrollView *)sub_100049E84();
}

- (void).cxx_destruct
{

}

- (_TtC6FindMy12FMScrollView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy12FMScrollView *result;

  v5 = OBJC_IVAR____TtC6FindMy12FMScrollView_content;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy12FMScrollView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMScrollView.swift", 25, 2, 21, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy12FMScrollView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy12FMScrollView *result;

  result = (_TtC6FindMy12FMScrollView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMScrollView", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
