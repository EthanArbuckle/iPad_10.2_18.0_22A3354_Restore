@implementation BurnBarSummary

- (_TtC9SeymourUI14BurnBarSummary)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14BurnBarSummary *)sub_22BA67208(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14BurnBarSummary)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA6A4A4();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI14BurnBarSummary *v2;

  v2 = self;
  sub_22BA68EC4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC9SeymourUI14BurnBarSummary *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_22BA69728();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B4E31C0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_stringBuilder));
  swift_release();
  sub_22BA6A2EC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_scoreMetric);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14BurnBarSummary_burnBarHeightConstraint));
}

@end
