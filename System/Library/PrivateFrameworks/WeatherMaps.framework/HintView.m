@implementation HintView

- (_TtC11WeatherMaps8HintView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEEAB6C();
}

- (void)dismissTapped
{
  _TtC11WeatherMaps8HintView *v2;

  v2 = self;
  sub_1DBEEAE74();

}

- (void)layoutSubviews
{
  _TtC11WeatherMaps8HintView *v2;

  v2 = self;
  sub_1DBEEA004();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps8HintView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1DBEEB8C8();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps8HintView)initWithFrame:(CGRect)a3
{
  sub_1DBEEBF10();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_image);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_label);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_backgroundEffectView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_contentView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_subtitleLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_icon);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_dismissIcon);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_borderLayer);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps8HintView_maskLayer);
  sub_1DBECE368(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps8HintView_onDismissHandler));
}

@end
