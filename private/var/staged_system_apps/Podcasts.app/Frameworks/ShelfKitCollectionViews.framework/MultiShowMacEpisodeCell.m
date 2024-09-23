@implementation MultiShowMacEpisodeCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MultiShowMacEpisodeCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *v4;

  v4 = self;
  sub_111560(a3);

}

- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *)sub_111844(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_113B04();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_112E60((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *v2;

  v2 = self;
  sub_1130AC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_episodeInfoView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_playControlsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_artworkPlusInfoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_internalArtworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell____lazy_storage___doubleClickToPlayGesture));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_recentlySearchedStorage));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_model));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_objectGraph));
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell_playControlsView);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for UICellConfigurationState(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1136E8();

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23ShelfKitCollectionViews23MultiShowMacEpisodeCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1137BC((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
