@implementation NowPlayingQueueCell

- (_TtC16MusicApplication19NowPlayingQueueCell)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication19NowPlayingQueueCell *result;

  sub_37B8D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC16MusicApplication19NowPlayingQueueCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_37E6F0();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingQueueCell();
  v2 = v3.receiver;
  -[NowPlayingQueueCell layoutSubviews](&v3, "layoutSubviews");
  sub_37CD30();

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_badgeArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_explicitBadgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_lastSeenTitleText));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_artworkContainerViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_artworkContainerViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_titlesStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_titlesStackViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19NowPlayingQueueCell_titlesStackViewTrailingConstraint));
}

@end
