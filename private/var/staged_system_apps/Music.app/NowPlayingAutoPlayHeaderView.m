@implementation NowPlayingAutoPlayHeaderView

- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music28NowPlayingAutoPlayHeaderView *)sub_100571A24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music28NowPlayingAutoPlayHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100572F58();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingAutoPlayHeaderView();
  v4 = a3;
  v5 = v6.receiver;
  -[NowPlayingAutoPlayHeaderView applyLayoutAttributes:](&v6, "applyLayoutAttributes:", v4);
  objc_msgSend(v5, "setClipsToBounds:", sub_100574A18() & 1, v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  _TtC5Music28NowPlayingAutoPlayHeaderView *v2;

  v2 = self;
  sub_1005729F0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_backgroundGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_autoplayImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music28NowPlayingAutoPlayHeaderView_subtitleLabel));
}

@end
