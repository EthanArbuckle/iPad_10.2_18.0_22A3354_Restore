@implementation TrendArrowIndicatorView

- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp23TrendArrowIndicatorView *)sub_10047E930(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp23TrendArrowIndicatorView)initWithCoder:(id)a3
{
  sub_10047EF58(a3);
  return 0;
}

- (void)layoutSubviews
{
  _TtC10FitnessApp23TrendArrowIndicatorView *v2;

  v2 = self;
  sub_100480390();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_arrowContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_gradientColors));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp23TrendArrowIndicatorView_circleColor));
}

@end
