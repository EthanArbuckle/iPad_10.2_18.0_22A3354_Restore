@implementation MapScrubberOverlayBar

- (_TtC11WeatherMaps21MapScrubberOverlayBar)init
{
  return (_TtC11WeatherMaps21MapScrubberOverlayBar *)sub_1DBFE7FA8();
}

- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBFE867C();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps21MapScrubberOverlayBar *v2;

  v2 = self;
  sub_1DBFE897C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC11WeatherMaps21MapScrubberOverlayBar *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_1DBFE94E0(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC11WeatherMaps21MapScrubberOverlayBar *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1DBFE9638((uint64_t)a4, x, y);

  return v10;
}

- (void)handleWithGesture:(id)a3
{
  id v4;
  _TtC11WeatherMaps21MapScrubberOverlayBar *v5;

  v4 = a3;
  v5 = self;
  sub_1DBFEAD30(v4);

}

- (_TtC11WeatherMaps21MapScrubberOverlayBar)initWithFrame:(CGRect)a3
{
  sub_1DBFEAE50();
}

- (void).cxx_destruct
{
  void *v3;
  char *v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_bar));
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_elapsedBar);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_control);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_nowTickMark));

  OUTLINED_FUNCTION_2_71();
  OUTLINED_FUNCTION_2_71();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar____lazy_storage___gestureRecognizer);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_accessibilityDateFormatter);
  sub_1DBE927A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_model, type metadata accessor for MapScrubberOverlayBar.ViewModel);
  v4 = (char *)self + OBJC_IVAR____TtC11WeatherMaps21MapScrubberOverlayBar_current;
  v5 = OUTLINED_FUNCTION_23();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

- (CGPoint)accessibilityActivationPoint
{
  _TtC11WeatherMaps21MapScrubberOverlayBar *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  sub_1DBFEB0B8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)accessibilityIncrement
{
  _TtC11WeatherMaps21MapScrubberOverlayBar *v2;

  v2 = self;
  sub_1DBFEB840((void (*)(char *))sub_1DBFEB0D4);

}

- (void)accessibilityDecrement
{
  _TtC11WeatherMaps21MapScrubberOverlayBar *v2;

  v2 = self;
  sub_1DBFEB840((void (*)(char *))sub_1DBFEB9B0);

}

@end
