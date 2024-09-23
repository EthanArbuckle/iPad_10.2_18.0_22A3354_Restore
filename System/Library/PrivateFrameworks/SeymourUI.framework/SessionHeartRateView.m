@implementation SessionHeartRateView

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI20SessionHeartRateView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_heartView), sel_sizeThatFits_, 0.0, 0.0);
  v7 = v5 + v6 + 2.0;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI20SessionHeartRateView *v2;

  v2 = self;
  sub_22B5343E4();

}

- (_TtC9SeymourUI20SessionHeartRateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B535554();
}

- (_TtC9SeymourUI20SessionHeartRateView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI20SessionHeartRateView *result;

  result = (_TtC9SeymourUI20SessionHeartRateView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_22B119E2C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20SessionHeartRateView_state, type metadata accessor for SessionHeartRateView.State);
  swift_unknownObjectRelease();

}

@end
