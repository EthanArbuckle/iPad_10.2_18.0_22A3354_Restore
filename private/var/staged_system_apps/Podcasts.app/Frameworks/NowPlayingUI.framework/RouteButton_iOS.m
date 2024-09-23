@implementation RouteButton_iOS

- (_TtC12NowPlayingUI15RouteButton_iOS)init
{
  return (_TtC12NowPlayingUI15RouteButton_iOS *)sub_9CE28();
}

- (_TtC12NowPlayingUI15RouteButton_iOS)initWithFrame:(CGRect)a3
{
  unsigned __int8 *v4;
  _TtC12NowPlayingUI15RouteButton_iOS *result;

  *(_QWORD *)&self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_controlsViewController] = 0;
  v4 = &self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate];
  *((_QWORD *)v4 + 1) = 0;
  swift_unknownObjectWeakInit(v4, 0);

  result = (_TtC12NowPlayingUI15RouteButton_iOS *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000001886D0, "NowPlayingUI/RouteButton_iOS.swift", 34, 2, 64, 0);
  __break(1u);
  return result;
}

- (_TtC12NowPlayingUI15RouteButton_iOS)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  id v6;
  _TtC12NowPlayingUI15RouteButton_iOS *result;

  *(_QWORD *)&self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_controlsViewController] = 0;
  v5 = &self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC12NowPlayingUI15RouteButton_iOS *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/RouteButton_iOS.swift", 34, 2, 68, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1EC0C((uint64_t)&self->MPRouteButton_opaque[OBJC_IVAR____TtC12NowPlayingUI15RouteButton_iOS_pickerDelegate]);
}

@end
