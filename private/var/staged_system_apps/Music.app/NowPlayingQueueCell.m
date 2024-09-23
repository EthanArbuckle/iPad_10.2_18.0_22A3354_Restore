@implementation NowPlayingQueueCell

- (_TtC5Music19NowPlayingQueueCell)initWithFrame:(CGRect)a3
{
  _TtC5Music19NowPlayingQueueCell *result;

  sub_1005624D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music19NowPlayingQueueCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005652C4();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingQueueCell();
  v2 = v3.receiver;
  -[NowPlayingQueueCell layoutSubviews](&v3, "layoutSubviews");
  sub_100563914();

}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC5Music19NowPlayingQueueCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC5Music19NowPlayingQueueCell_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_badgeArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_explicitBadgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_lastSeenTitleText));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_artworkContainerViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19NowPlayingQueueCell_titlesStackViewTrailingConstraint));
}

@end
