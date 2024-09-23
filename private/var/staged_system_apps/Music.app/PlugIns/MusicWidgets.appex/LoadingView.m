@implementation LoadingView

- (_TtC11MusicCoreUI11LoadingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003CDB5C();
}

- (void)layoutSubviews
{
  _TtC11MusicCoreUI11LoadingView *v2;

  v2 = self;
  LoadingView.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  _TtC11MusicCoreUI11LoadingView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = LoadingView.sizeThatFits(_:)(0.0, 0.0);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11MusicCoreUI11LoadingView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = LoadingView.sizeThatFits(_:)(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC11MusicCoreUI11LoadingView)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI11LoadingView *result;

  result = (_TtC11MusicCoreUI11LoadingView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.LoadingView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC11MusicCoreUI11LoadingView_title]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI11LoadingView_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI11LoadingView____lazy_storage___progressBar));
}

@end
