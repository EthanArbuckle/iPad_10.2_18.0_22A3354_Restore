@implementation PlaylistDetailDataSource

- (void)dealloc
{
  _TtC5Music24PlaylistDetailDataSource *v3;
  _TtC5Music24PlaylistDetailDataSource *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_asyncSetupTask))
  {
    v3 = self;
    swift_retain();
    sub_100007E8C(&qword_1011A14B0);
    Task.cancel()();
    swift_release();
  }
  else
  {
    v4 = self;
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

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___headerRegistration, &qword_1011D1398);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___searchHeaderRegistration, &qword_1011D1378);
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___trackCellRegistration, &qword_1011D1300);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___temporaryTrackCellRegistration, &qword_1011D12C0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___noContentCellRegistration, &qword_1011B5740);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___emptyTrackCellRegistration, &qword_1011D1260);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___addMusicCellRegistration, &qword_1011D1260);
  v3 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_detailCellRegistration;
  v4 = sub_100007E8C((uint64_t *)&unk_1011B6670);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___suggestedSongsCellRegistration, &qword_1011D1228);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___relatedContentCellRegistration, (uint64_t *)&unk_1011B6D20);
  v5 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  v6 = sub_100007E8C((uint64_t *)&unk_1011B6CD0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, (uint64_t *)&unk_1011B6CF0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_wrappedViewController, (uint64_t *)&unk_1011B6910);
  swift_bridgeObjectRelease();
  sub_1004CB930(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___dragDropController));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_1011A3D50);
  sub_1004C826C(*(unint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentedLoadingState), *(_QWORD *)&self->prefetchingController[OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentedLoadingState], *(_QWORD *)&self->waveformPlayer[OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentedLoadingState]);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_artwork, &qword_1011A1440);
  sub_1004CB930(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___relatedContentProvider));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_playlist, &qword_1011A30F0);
  v7 = (char *)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_source;
  v8 = type metadata accessor for MusicPropertySource(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_sourceURL, &qword_10119E460);
  swift_release();
  sub_1004CA0BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_autoupdatingResponse));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_collaborationDetails, &qword_1011D0F40);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___collaborationBarButton));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___collaborationControl));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_collaborationURL, &qword_10119E460);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_catalogPlaylist, &qword_1011A30F0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_catalogEntries, (uint64_t *)&unk_1011D0BB0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_largestPrefetchIndexPath, (uint64_t *)&unk_1011A3D50);
  swift_bridgeObjectRelease();

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_attributionItem, &qword_1011B6938);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_presentingEntries, (uint64_t *)&unk_1011D0BB0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_staticEntries, (uint64_t *)&unk_1011D0BB0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___filterKeyCommand));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource____lazy_storage___searchController));
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC5Music24PlaylistDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music24PlaylistDetailDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_100970DAC(a4);
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
  _TtC5Music24PlaylistDetailDataSource *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100931CB0((uint64_t)v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  LOBYTE(a1) = sub_100971144((uint64_t)v10);

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
  _TtC5Music24PlaylistDetailDataSource *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10093305C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music24PlaylistDetailDataSource *v11;
  id v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = sub_100972188(v9);
  swift_bridgeObjectRelease();

  return v12;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music24PlaylistDetailDataSource *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  v12 = sub_100961C30();
  objc_msgSend(v12, "resignFirstResponder");

  swift_unknownObjectRelease(a5);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Music24PlaylistDetailDataSource *v11;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5, v10);
  v11 = self;
  sub_1009726C8(v9, a5);

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
  _TtC5Music24PlaylistDetailDataSource *v15;
  uint64_t v16;
  Class isa;
  uint64_t v19;

  v7 = sub_100007E8C((uint64_t *)&unk_1011A3D50);
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
  sub_100935078((uint64_t)v12);

  sub_10004FF60((uint64_t)v9, (uint64_t *)&unk_1011A3D50);
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
  _TtC5Music24PlaylistDetailDataSource *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100972BC4(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music24PlaylistDetailDataSource *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100972E80((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _TtC5Music24PlaylistDetailDataSource *v9;
  id v10;

  v7 = type metadata accessor for IndexPath(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v10 = a3;
  v9 = self;
  sub_1009356F8(v10, v8);
  swift_bridgeObjectRelease();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  _TtC5Music24PlaylistDetailDataSource *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_100935B08(v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Music24PlaylistDetailDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_100935C34(v4);

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
  _TtC5Music24PlaylistDetailDataSource *v14;

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

- (_TtC5Music24PlaylistDetailDataSource)init
{
  _TtC5Music24PlaylistDetailDataSource *result;

  result = (_TtC5Music24PlaylistDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer("Music.PlaylistDetailDataSource", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
