@implementation NowPlayingAttributionView

- (_TtC16MusicApplication25NowPlayingAttributionView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication25NowPlayingAttributionView *)sub_3063AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication25NowPlayingAttributionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_306F90();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication25NowPlayingAttributionView *v2;

  v2 = self;
  sub_306BD0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView_title]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView_artwork));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView____lazy_storage___artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25NowPlayingAttributionView____lazy_storage___titleLabel));
}

@end
