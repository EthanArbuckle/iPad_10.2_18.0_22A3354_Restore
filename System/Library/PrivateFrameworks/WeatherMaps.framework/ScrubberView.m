@implementation ScrubberView

- (_TtC11WeatherMaps12ScrubberView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF60F80();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps12ScrubberView *v2;

  v2 = self;
  sub_1DBF6103C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps12ScrubberView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1DBF611F4();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps12ScrubberView)initWithFrame:(CGRect)a3
{
  sub_1DBF61334();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps12ScrubberView_backgroundEffectView));

}

@end
