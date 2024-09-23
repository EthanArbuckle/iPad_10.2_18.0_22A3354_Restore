@implementation NowPlayingIndicatorView

- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicMessagesApp23NowPlayingIndicatorView *)sub_100005BB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicMessagesApp23NowPlayingIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100007940();
}

- (void)tintColorDidChange
{
  _TtC16MusicMessagesApp23NowPlayingIndicatorView *v2;

  v2 = self;
  sub_100006040();

}

- (void)layoutSubviews
{
  _TtC16MusicMessagesApp23NowPlayingIndicatorView *v2;

  v2 = self;
  sub_1000061A0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  uint64_t v4;
  _TtC16MusicMessagesApp23NowPlayingIndicatorView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC16MusicMessagesApp23NowPlayingIndicatorView_levelWidth);
  v4 = qword_1004B6E00;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_1004B6E00, sub_100005B4C);
  v6 = v3 * 5.0 + *(double *)&qword_1004B7080 * 4.0;
  v7 = *(double *)((char *)&v5->super.super.super.isa
                 + OBJC_IVAR____TtC16MusicMessagesApp23NowPlayingIndicatorView_maximumLevelHeight);

  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicMessagesApp23NowPlayingIndicatorView *v6;

  v5 = a3;
  v6 = self;
  sub_1000064EC(a3);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicMessagesApp23NowPlayingIndicatorView_levelViews));
}

@end
