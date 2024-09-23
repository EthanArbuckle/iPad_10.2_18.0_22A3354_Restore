@implementation MapScrubberOverlayUIView

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)init
{
  return (_TtC11WeatherMaps24MapScrubberOverlayUIView *)sub_1DBE8DF98();
}

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBE8E83C();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v2;

  v2 = self;
  sub_1DBE8EA9C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1DBE8FAA4();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)barValueChanged:(id)a3
{
  id v4;
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v5;

  v4 = a3;
  v5 = self;
  sub_1DBE905C8((uint64_t)v4);

}

- (void)barTouched:(id)a3
{
  id v4;
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v5;

  v4 = a3;
  v5 = self;
  sub_1DBE9070C();

}

- (void)playPauseTapped
{
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v2;

  v2 = self;
  sub_1DBE90894();

}

- (void)didReceiveMenuAction:(id)a3
{
  id v4;
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v5;

  v4 = a3;
  v5 = self;
  sub_1DBE90944();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v6;
  _TtC11WeatherMaps24MapScrubberOverlayUIView *v7;
  id v8;

  v6 = a4;
  v7 = self;
  v8 = sub_1DBE91460((uint64_t)a4);

  return v8;
}

- (_TtC11WeatherMaps24MapScrubberOverlayUIView)initWithFrame:(CGRect)a3
{
  sub_1DBE91638();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleDateContainer));
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_dateLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_playPauseButton);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_bar);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_affordanceActionIcon);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_titleButton);
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_calendar;
  v4 = sub_1DBFF6A84();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_delegate);
  sub_1DBE927A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapScrubberOverlayUIView_model, type metadata accessor for MapScrubberOverlayViewModel);
}

@end
