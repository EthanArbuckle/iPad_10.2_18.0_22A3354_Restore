@implementation TrendDetailVO2MaxMeter

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 119.0;
  v3 = 10.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp22TrendDetailVO2MaxMeter *)sub_1002A681C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp22TrendDetailVO2MaxMeter)initWithCoder:(id)a3
{
  sub_1002A69FC(a3);
  return 0;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TrendDetailVO2MaxMeter();
  v2 = (char *)v4.receiver;
  -[TrendDetailVO2MaxMeter layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_opt_self(CATransaction);
  objc_msgSend(v3, "begin", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setDisableActions:", 1);
  sub_1002A6BF8(v2);
  objc_msgSend(v3, "commit");

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendDetailVO2MaxMeter_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendDetailVO2MaxMeter_shapeLayer));
}

@end
