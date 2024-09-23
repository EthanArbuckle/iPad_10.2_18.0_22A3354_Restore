@implementation MapDiscreteStepView

- (_TtC11WeatherMaps19MapDiscreteStepView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF9725C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11WeatherMaps19MapDiscreteStepView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1DBF96DE4(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps19MapDiscreteStepView *v2;

  v2 = self;
  sub_1DBF973AC();

}

- (_TtC11WeatherMaps19MapDiscreteStepView)initWithFrame:(CGRect)a3
{
  sub_1DBF9756C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps19MapDiscreteStepView_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps19MapDiscreteStepView____lazy_storage___label));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
