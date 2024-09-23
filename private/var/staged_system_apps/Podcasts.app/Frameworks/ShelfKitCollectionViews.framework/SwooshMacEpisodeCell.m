@implementation SwooshMacEpisodeCell

- (_TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell *)sub_2AA560(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2ACD20();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_2ABE9C((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell *v2;

  v2 = self;
  sub_2AC0FC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_episodeInfoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_pinEpisodeInfoToArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_pinEpisodeInfoToOrdinal));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_playControlsForProgressPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_playControlsForProgressView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_playControlsForBadgesPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_playControlsForBadgesView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell____lazy_storage___badgesGradient));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_internalArtworkContainer));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_objectGraph));
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20SwooshMacEpisodeCell_playControlsForBadgesView);
}

@end
