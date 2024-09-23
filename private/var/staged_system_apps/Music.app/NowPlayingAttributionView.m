@implementation NowPlayingAttributionView

- (_TtC5Music25NowPlayingAttributionView)initWithFrame:(CGRect)a3
{
  return (_TtC5Music25NowPlayingAttributionView *)sub_10044D5F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music25NowPlayingAttributionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10044E184();
}

- (void)layoutSubviews
{
  _TtC5Music25NowPlayingAttributionView *v2;

  v2 = self;
  sub_10044DDC4();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC5Music25NowPlayingAttributionView_title]);

  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Music25NowPlayingAttributionView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25NowPlayingAttributionView____lazy_storage___titleLabel));
}

@end
