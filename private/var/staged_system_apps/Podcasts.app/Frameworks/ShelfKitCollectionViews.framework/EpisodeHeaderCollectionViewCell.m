@implementation EpisodeHeaderCollectionViewCell

- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell *)sub_25F5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_27FBC();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  objc_class *v6;
  _TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];
  objc_super v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D0A58);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (objc_class *)type metadata accessor for EpisodeHeaderCollectionViewCell(0);
  v13.receiver = self;
  v13.super_class = v6;
  v7 = self;
  -[EpisodeHeaderCollectionViewCell prepareForReuse](&v13, "prepareForReuse");
  v8 = *(uint64_t *)((char *)&v7->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkSubscription);
  *(Class *)((char *)&v7->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkSubscription) = 0;
  swift_release(v8);
  v9 = type metadata accessor for ArtworkModel(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  v10 = (uint64_t)v7 + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_subscribedArtwork;
  swift_beginAccess((char *)v7 + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_subscribedArtwork, v12, 33, 0);
  sub_1EB00((uint64_t)v5, v10, &qword_3D0A58);
  swift_endAccess(v12);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_objectGraph));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_imageProvider, &qword_3D1230);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkWidthConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodePlayStateController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_libraryDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_verticalStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_artworkSubscription));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_subscribedArtwork, &qword_3D0A58);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell____lazy_storage___titleLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderSubtitlePresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderSubtitle));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderEntitlementDisplayPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_episodeHeaderEntitlementDisplay));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell_showButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell____lazy_storage___playButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31EpisodeHeaderCollectionViewCell__playButtonController));
}

@end
