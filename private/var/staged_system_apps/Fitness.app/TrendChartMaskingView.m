@implementation TrendChartMaskingView

- (_TtC10FitnessApp21TrendChartMaskingView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp21TrendChartMaskingView *)sub_100167CE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp21TrendChartMaskingView)initWithCoder:(id)a3
{
  sub_100167F7C(a3);
  return 0;
}

- (void)layoutSubviews
{
  _TtC10FitnessApp21TrendChartMaskingView *v2;

  v2 = self;
  sub_1001680BC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_leftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_centerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendChartMaskingView_rightView));
}

@end
