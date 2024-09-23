@implementation ScaleView

- (_TtC11WeatherMaps9ScaleView)initWithCoder:(id)a3
{
  sub_1DBF68204();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps9ScaleView *v2;

  v2 = self;
  sub_1DBF68268();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC11WeatherMaps9ScaleView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1DBF67E38(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC11WeatherMaps9ScaleView)initWithFrame:(CGRect)a3
{
  sub_1DBF683AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps9ScaleView_backgroundEffectView));

}

@end
