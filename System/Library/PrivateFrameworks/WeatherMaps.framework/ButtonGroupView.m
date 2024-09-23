@implementation ButtonGroupView

- (_TtC11WeatherMaps15ButtonGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEEFCB0();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps15ButtonGroupView *v2;

  v2 = self;
  sub_1DBEEFD68();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11WeatherMaps15ButtonGroupView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1DBEEED94(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC11WeatherMaps15ButtonGroupView)initWithFrame:(CGRect)a3
{
  sub_1DBEF01E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_menuDelegate);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps15ButtonGroupView_backgroundEffectView));
}

@end
