@implementation MapScaleLabelView

- (_TtC11WeatherMaps17MapScaleLabelView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFBB878();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps17MapScaleLabelView *v2;

  v2 = self;
  sub_1DBFBB934();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps17MapScaleLabelView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1DBFBB128();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps17MapScaleLabelView)initWithFrame:(CGRect)a3
{
  sub_1DBFBBA28();
}

- (void).cxx_destruct
{

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps17MapScaleLabelView_vibrancyEffectView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
