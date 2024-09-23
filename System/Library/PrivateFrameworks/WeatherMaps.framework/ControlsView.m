@implementation ControlsView

- (_TtC11WeatherMaps12ControlsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEED430();
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps12ControlsView *v2;

  v2 = self;
  sub_1DBEEDDB0();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC11WeatherMaps12ControlsView *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1DBEEE544((uint64_t)a4, x, y);

  return v10;
}

- (NSArray)accessibilityElements
{
  _TtC11WeatherMaps12ControlsView *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = sub_1DBEEE6D0();

  if (v3)
  {
    v4 = (void *)sub_1DBFF8368();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  _TtC11WeatherMaps12ControlsView *v4;

  if (a3)
    sub_1DBFF8374();
  v4 = self;
  j__swift_bridgeObjectRelease();

}

- (_TtC11WeatherMaps12ControlsView)initWithFrame:(CGRect)a3
{
  sub_1DBEEE96C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DBEEEBCC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps12ControlsView_scaleModel), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11WeatherMaps12ControlsView_scaleModel));
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps12ControlsView_mapViewForZoomControl);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_menuDelegate);
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_actionDelegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps12ControlsView_scaleView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps12ControlsView_zoomControl);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps12ControlsView_windOverlayHintManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps12ControlsView_discoverWindHintView));
}

@end
