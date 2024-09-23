@implementation NowPlayingQueueCell.ArtworkContainerView

- (_TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView *)sub_37E14C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_37EA0C();
}

- (void)layoutSubviews
{
  _TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView *v2;

  v2 = self;
  sub_37E2CC();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView_cachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView_badgeArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication19NowPlayingQueueCellP33_0F1821F6C55683476BEDEE41C440918A20ArtworkContainerView_badgeArtworkView));
}

@end
