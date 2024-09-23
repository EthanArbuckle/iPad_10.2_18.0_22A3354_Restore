@implementation SessionSingleMetricView

- (_TtC9SeymourUI23SessionSingleMetricView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23SessionSingleMetricView *)sub_22B5DCFB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC9SeymourUI23SessionSingleMetricView *v2;

  v2 = self;
  sub_22B5DD590();

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC9SeymourUI23SessionSingleMetricView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_valueLabel);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  objc_msgSend(*(id *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_unitLabel), sel_intrinsicContentSize);
  v7 = v5 + v6 + 2.0;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SessionSingleMetricView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI23SessionSingleMetricView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s9SeymourUI23SessionSingleMetricViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionSingleMetricView_unitLabel));
}

@end
