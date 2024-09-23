@implementation MapContinuousScaleView

- (_TtC11WeatherMaps22MapContinuousScaleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF17C50();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps22MapContinuousScaleView *v2;

  v2 = self;
  sub_1DBF17D34();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps22MapContinuousScaleView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1DBF18080();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps22MapContinuousScaleView)initWithFrame:(CGRect)a3
{
  sub_1DBF184AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22MapContinuousScaleView_gradient));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
