@implementation WaveformPlayIndicator

- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11MusicCoreUI21WaveformPlayIndicatorC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  _TtC11MusicCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  WaveformPlayIndicator.tintColorDidChange()();

}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[WaveformPlayIndicator layoutSubviews](&v3, "layoutSubviews");
  if (!*(_QWORD *)&v2[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation])
    sub_100393960();

}

- (void)didMoveToWindow
{
  _TtC11MusicCoreUI21WaveformPlayIndicator *v2;

  v2 = self;
  WaveformPlayIndicator.didMoveToWindow()();

}

- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI21WaveformPlayIndicator *result;

  result = (_TtC11MusicCoreUI21WaveformPlayIndicator *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.WaveformPlayIndicator", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette);
  v4 = *(void **)&self->mode[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  v5 = *(void **)&self->colorPalette[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette + 7];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_pulseTask));
  v6 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator__isVisible;
  v7 = sub_1000057B4(&qword_1004C9F40);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_cannedAnimationAsset));
}

@end
