@implementation PlaylistDetailDataSource

- (void)dealloc
{
  uint64_t v3;
  _TtC16MusicApplication24PlaylistDetailDataSource *v4;
  objc_super v5;

  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_asyncSetupTask);
  v4 = self;
  if (v3)
  {
    swift_retain(v3);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD690);
    Task.cancel()();
    swift_release(v3);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaylistDetailDataSource(0);
  -[PlaylistDetailDataSource dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_prefetchingController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___headerRegistration, (uint64_t *)&unk_14EA360);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___searchHeaderRegistration, &qword_14EA340);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_waveformPlayer));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___trackCellRegistration, &qword_14EA2E0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___temporaryTrackCellRegistration, &qword_14EA290);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___noContentCellRegistration, &qword_14C8600);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___emptyTrackCellRegistration, &qword_14EA230);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___addMusicCellRegistration, &qword_14EA230);
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_detailCellRegistration;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14EA3A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___suggestedSongsCellRegistration, &qword_14EA1F0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___relatedContentCellRegistration, &qword_14EA1E8);
  v5 = (char *)self
     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14EA1A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, &qword_14EA1B8);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_wrappedViewController, &qword_14E9C98);
  swift_bridgeObjectRelease();
  sub_955CE8(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___dragDropController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_14AD540);
  sub_953020(*(unint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_presentedLoadingState), *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_presentedLoadingState], *(_QWORD *)&self->waveformPlayer[OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_presentedLoadingState]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_artwork, (uint64_t *)&unk_14AD650);
  sub_955CE8(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___relatedContentProvider));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_playlist, (uint64_t *)&unk_14AE790);
  v7 = (char *)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_source;
  v8 = type metadata accessor for MusicPropertySource(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_sortingController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_sourceURL, &qword_14AED20);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_actionableStateController));
  sub_9548C4(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_autoupdatingResponse));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_autoupdatingResponseSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_catalogEntriesAutoupdatingResponse));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_catalogEntriesAutoupdatingResponseSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_asyncSetupTask));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_collaborationDetails, &qword_14E9F88);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___collaborationBarButton));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___collaborationControl));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_collaborationURL, &qword_14AED20);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___reactionController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_collaborationAutoupdatingResponse));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_collaborationAutoupdatingResponseSubscription));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_paginationTask));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_catalogPlaylist, (uint64_t *)&unk_14AE790);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_catalogEntries, &qword_14E9C90);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_largestPrefetchIndexPath, (uint64_t *)&unk_14AD540);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_containerDetailLink));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_attributionItem, &qword_14E9C88);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___headerConfiguration));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___searchHeaderConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_presentingEntries, &qword_14E9C90);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_staticEntries, &qword_14E9C90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_tracklistFooterViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_suggestedSongsCell));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_suggestedSongsDataSource));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_suggestedSongsViewModel));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_hasNetworkConnectivityDidChangeNotificationObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___filterKeyCommand));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource____lazy_storage___searchController));
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication24PlaylistDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication24PlaylistDetailDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_953698(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24PlaylistDetailDataSource *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_919108((uint64_t)v11, (uint64_t)v10);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(void *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = a1;
  LOBYTE(a1) = sub_953A30((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication24PlaylistDetailDataSource *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_91A4E4(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication24PlaylistDetailDataSource *v12;
  id v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = sub_9562C0(v9);
  swift_bridgeObjectRelease();

  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication24PlaylistDetailDataSource *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  v11 = sub_949FB8();
  objc_msgSend(v11, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication24PlaylistDetailDataSource *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_956800(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC16MusicApplication24PlaylistDetailDataSource *v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD540);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - v11;
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    v13 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  }
  v14 = a3;
  v15 = self;
  sub_91C594((uint64_t)v12);

  sub_56024((uint64_t)v9, (uint64_t *)&unk_14AD540);
  type metadata accessor for IndexPath(0);
  v16 = *(_QWORD *)(v13 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v13) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v13);
  }
  return isa;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  _TtC16MusicApplication24PlaylistDetailDataSource *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_956CFC(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication24PlaylistDetailDataSource *v10;
  id v11;

  v7 = type metadata accessor for IndexPath(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v11 = a3;
  v9 = a4;
  v10 = self;
  sub_91CB58(v11, v8);
  swift_bridgeObjectRelease();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  _TtC16MusicApplication24PlaylistDetailDataSource *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_91CF74(v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication24PlaylistDetailDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_91D0A0(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double y;
  double v12;
  double v13;
  _TtC16MusicApplication24PlaylistDetailDataSource *v14;

  v7 = a3;
  v14 = self;
  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  objc_msgSend(v7, "adjustedContentInset");
  if (v9 != -v10)
  {
    y = a5->y;
    objc_msgSend(v7, "safeAreaInsets");
    if (y < -v12)
    {
      objc_msgSend(v7, "safeAreaInsets");
      a5->y = -v13;
    }
  }

}

- (_TtC16MusicApplication24PlaylistDetailDataSource)init
{
  _TtC16MusicApplication24PlaylistDetailDataSource *result;

  result = (_TtC16MusicApplication24PlaylistDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PlaylistDetailDataSource", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
