@implementation CarPlayNowPlayingIndicatorView

- (_TtC5Music30CarPlayNowPlayingIndicatorView)init
{
  return (_TtC5Music30CarPlayNowPlayingIndicatorView *)sub_1001EBDD0();
}

- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _TtC5Music30CarPlayNowPlayingIndicatorView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isHighlighted) = 0;
  v4 = OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform;
  v5 = qword_10119C278;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_10119C278, sub_10058F8BC);
  v7 = (void *)qword_10124D348;
  v8 = objc_allocWithZone((Class)type metadata accessor for WaveformPlayIndicator(0));
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)WaveformPlayIndicator.init(settings:)(v7);

  result = (_TtC5Music30CarPlayNowPlayingIndicatorView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/CarPlayNowPlayingIndicatorView.swift", 42, 2, 31, 0);
  __break(1u);
  return result;
}

- (BOOL)isPlaying
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v4;
  _TtC5Music30CarPlayNowPlayingIndicatorView *v5;

  v3 = a3;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying) = a3;
  v5 = self;
  if (v3)
    v4 = 3;
  else
    v4 = 1;
  WaveformPlayIndicator.mode.setter(v4);

}

- (BOOL)isHighlighted
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isHighlighted);
}

- (void)setIsHighlighted:(BOOL)a3
{
  _TtC5Music30CarPlayNowPlayingIndicatorView *v4;

  v4 = self;
  sub_1001EC180(a3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 24.0;
  v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[CarPlayNowPlayingIndicatorView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 24.0;
  v4 = 24.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC5Music30CarPlayNowPlayingIndicatorView *result;

  result = (_TtC5Music30CarPlayNowPlayingIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("Music.CarPlayNowPlayingIndicatorView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform));
}

@end
