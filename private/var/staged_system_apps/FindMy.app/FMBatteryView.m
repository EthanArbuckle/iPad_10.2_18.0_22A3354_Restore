@implementation FMBatteryView

- (void).cxx_destruct
{

}

- (void)layoutSubviews
{
  _TtC6FindMy13FMBatteryView *v2;

  v2 = self;
  sub_100026A7C();

}

- (_TtC6FindMy13FMBatteryView)init
{
  return (_TtC6FindMy13FMBatteryView *)sub_10003C594();
}

- (_TtC6FindMy13FMBatteryView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy13FMBatteryView *result;

  sub_10003C768(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[FMBatteryView bounds](self, "bounds");
  v3 = v2;
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[FMBatteryView bounds](self, "bounds", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC6FindMy13FMBatteryView)initWithCoder:(id)a3
{
  _TtC6FindMy13FMBatteryView *result;

  sub_100383774(a3);
  return result;
}

@end
