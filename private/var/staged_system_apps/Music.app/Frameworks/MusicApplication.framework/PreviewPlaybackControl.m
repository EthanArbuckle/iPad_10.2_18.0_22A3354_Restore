@implementation PreviewPlaybackControl

- (_TtC16MusicApplication22PreviewPlaybackControl)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22PreviewPlaybackControl *)sub_737270(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22PreviewPlaybackControl)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC16MusicApplication22PreviewPlaybackControl *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MusicApplication22PreviewPlaybackControl_stopMode) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication22PreviewPlaybackControl_playbackState;
  *(_QWORD *)v5 = 0;
  v5[8] = 2;
  v6 = OBJC_IVAR____TtC16MusicApplication22PreviewPlaybackControl_progressView;
  v7 = objc_allocWithZone((Class)type metadata accessor for CircularProgressView());
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)CircularProgressView.init(size:)(0.0, 0.0);

  result = (_TtC16MusicApplication22PreviewPlaybackControl *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/PreviewPlaybackControl.swift", 45, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PreviewPlaybackControl();
  v2 = (char *)v4.receiver;
  -[PreviewPlaybackControl layoutSubviews](&v4, "layoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC16MusicApplication22PreviewPlaybackControl_progressView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC16MusicApplication22PreviewPlaybackControl *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  v4 = -[PreviewPlaybackControl traitCollection](v3, "traitCollection");
  v5 = objc_msgSend((id)objc_opt_self(UIFontMetrics), "defaultMetrics");
  v6 = (void *)static UIContentSizeCategory.default.getter();
  v7 = UIFontMetrics.scaledValue(for:traitCollection:noSmallerThan:noLargerThan:where:)(v4, v6, 26.0);

  v8 = v7;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22PreviewPlaybackControl_progressView));
}

@end
