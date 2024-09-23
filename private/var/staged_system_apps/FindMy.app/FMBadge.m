@implementation FMBadge

- (_TtC6FindMy7FMBadge)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC6FindMy7FMBadge *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy7FMBadge_color) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy7FMBadge_strokeColor) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC6FindMy7FMBadge_insets);
  *v4 = xmmword_100486DD0;
  v4[1] = xmmword_100486DD0;
  v5 = a3;

  result = (_TtC6FindMy7FMBadge *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMBadge.swift", 20, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  _TtC6FindMy7FMBadge *v3;

  v3 = self;
  sub_1001D8B9C();

}

- (CGSize)intrinsicContentSize
{
  _TtC6FindMy7FMBadge *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1001D8A6C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC6FindMy7FMBadge)initWithFrame:(CGRect)a3
{
  _TtC6FindMy7FMBadge *result;

  result = (_TtC6FindMy7FMBadge *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMBadge", 14, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
