@implementation CircularProgressView

- (_TtC11MusicCoreUI20CircularProgressView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11MusicCoreUI20CircularProgressViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[CircularProgressView tintColorDidChange](&v3, "tintColorDidChange");
  sub_E669A0();

}

- (void)layoutSubviews
{
  _TtC11MusicCoreUI20CircularProgressView *v2;

  v2 = self;
  CircularProgressView.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  _BYTE v5[24];
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize, v5, 0, 0);
  v3 = *v2;
  v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double *v3;
  double v4;
  double v5;
  _BYTE v6[24];
  CGSize result;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize, v6, 0, 0);
  v4 = *v3;
  v5 = v3[1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)accessibilityProgressValue
{
  char *v2;
  double result;
  double v4;
  __int16 v5;

  v2 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView__state;
  result = 0.0;
  if ((self->preferredSize[OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView__state + 2] & 1) == 0)
  {
    v4 = *(double *)v2;
    v5 = *((_WORD *)v2 + 4);
    if ((v5 & 0x100) != 0)
    {
      if (!(*(_QWORD *)&v4 | v5))
        return 1.0;
    }
    else
    {
      result = v4;
      if ((v5 & 1) != 0)
        return 0.0;
    }
  }
  return result;
}

- (_TtC11MusicCoreUI20CircularProgressView)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI20CircularProgressView *result;

  result = (_TtC11MusicCoreUI20CircularProgressView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.CircularProgressView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_imageView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_spinAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_trackLayer));
}

@end
