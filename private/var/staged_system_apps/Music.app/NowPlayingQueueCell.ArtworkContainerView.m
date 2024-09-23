@implementation NowPlayingQueueCell.ArtworkContainerView

- (_TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView *)sub_100564D20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005655E4();
}

- (void)layoutSubviews
{
  _TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView *v2;

  v2 = self;
  sub_100564EA0();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView_cachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView_badgeArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19NowPlayingQueueCellP33_30B386DF66C9CA3B1688A89B8614D8A420ArtworkContainerView_badgeArtworkView));
}

@end
