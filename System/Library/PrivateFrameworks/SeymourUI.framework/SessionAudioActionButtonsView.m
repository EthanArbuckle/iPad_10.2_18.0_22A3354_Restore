@implementation SessionAudioActionButtonsView

- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI29SessionAudioActionButtonsView *)sub_22B6A1030(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI29SessionAudioActionButtonsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6A279C();
}

- (void)onRouteButtonTappedDown:(id)a3
{
  sub_22B6A232C(self, (uint64_t)a2, a3, (SEL *)&selRef_startPrewarming);
}

- (void)onRouteButtonTappedUp:(id)a3
{
  sub_22B6A232C(self, (uint64_t)a2, a3, (SEL *)&selRef_stopPrewarming);
}

- (void)onRouteButtonTapped:(id)a3
{
  sub_22B6A232C(self, (uint64_t)a2, a3, (SEL *)&selRef_present);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_alignmentRouteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_stackView));
  objc_release(*(id *)((char *)&self->super._window
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView_styleProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29SessionAudioActionButtonsView____lazy_storage___mediaControls));
}

@end
