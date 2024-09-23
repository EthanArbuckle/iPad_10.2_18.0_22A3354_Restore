@implementation MapScaleOverlayUIView

- (CGRect)bounds
{
  _TtC11WeatherMaps21MapScaleOverlayUIView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_1DBFB4B40();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC11WeatherMaps21MapScaleOverlayUIView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1DBFB4BD4(x, y, width, height);

}

- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFB5840();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps21MapScaleOverlayUIView *v2;

  v2 = self;
  sub_1DBFB5994();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC11WeatherMaps21MapScaleOverlayUIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1DBFB410C(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)handleInvertColorsStatusDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC11WeatherMaps21MapScaleOverlayUIView *v5;

  v4 = a3;
  v5 = self;
  sub_1DBFB6024();

}

- (_TtC11WeatherMaps21MapScaleOverlayUIView)initWithFrame:(CGRect)a3
{
  sub_1DBFB6074();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___separatorView);
  swift_release();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___backdropLayerVibrancy);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___titleVibrancyEffectView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView_titleLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView_subtitleLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___continuousScaleView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScaleOverlayUIView____lazy_storage___discreteScaleView));
}

@end
