@implementation NowPlayingAutoPlayHeaderView

- (_TtC16MusicApplication28NowPlayingAutoPlayHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication28NowPlayingAutoPlayHeaderView *)sub_54ABEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication28NowPlayingAutoPlayHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_54C11C();
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
  objc_msgSend(v5, "setClipsToBounds:", sub_18DE58() & 1, v6.receiver, v6.super_class);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication28NowPlayingAutoPlayHeaderView *v2;

  v2 = self;
  sub_54BBB4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_backgroundGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_autoplayImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28NowPlayingAutoPlayHeaderView_subtitleLabel));
}

@end
