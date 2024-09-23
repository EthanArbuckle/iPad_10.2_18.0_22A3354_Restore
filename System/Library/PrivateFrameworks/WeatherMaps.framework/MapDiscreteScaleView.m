@implementation MapDiscreteScaleView

- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBE94E7C();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps20MapDiscreteScaleView *v2;

  v2 = self;
  sub_1DBE94F28();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC11WeatherMaps20MapDiscreteScaleView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1DBE95104(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC11WeatherMaps20MapDiscreteScaleView)initWithFrame:(CGRect)a3
{
  sub_1DBE952E8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_0();
  swift_bridgeObjectRelease();
}

@end
