@implementation ContainerDetailPlaybackIndicatorView.WaveformContainerView

- (_TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView_waveform) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[ContainerDetailPlaybackIndicatorView.WaveformContainerView initWithFrame:](&v5, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView)initWithCoder:(id)a3
{
  id v4;
  _TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView_waveform) = 0;
  v4 = a3;

  result = (_TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/ContainerDetailPlaybackIndicator.swift", 44, 2, 243, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v5.receiver;
  -[ContainerDetailPlaybackIndicatorView.WaveformContainerView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView_waveform];
  if (v3)
  {
    v4 = v3;
    CGRect.centeringAlong(axes:in:)(3, v2, 0.0, 0.0, 16.0, 16.0);
    objc_msgSend(v4, "setFrame:", v5.receiver, v5.super_class);

    v2 = v4;
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 16.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView)initWithFrame:(CGRect)a3
{
  _TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView *result;

  result = (_TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView *)_swift_stdlib_reportUnimplementedInitializer("Music.WaveformContainerView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV5Music36ContainerDetailPlaybackIndicatorView21WaveformContainerView_waveform));
}

@end
