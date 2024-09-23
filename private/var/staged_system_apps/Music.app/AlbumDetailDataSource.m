@implementation AlbumDetailDataSource

- (void)dealloc
{
  _TtC5Music21AlbumDetailDataSource *v3;
  _TtC5Music21AlbumDetailDataSource *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_asyncSetupTask))
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
  v5.super_class = (Class)type metadata accessor for AlbumDetailDataSource(0);
  -[AlbumDetailDataSource dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___headerRegistration, (uint64_t *)&unk_1011B6E90);
  v3 = (char *)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_bannerRegistration;
  v4 = sub_100007E8C(&qword_1011B6CE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___trackCellRegistration, &qword_1011B6E08);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___noContentCellRegistration, (uint64_t *)&unk_1011A3E40);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___detailCellRegistration, (uint64_t *)&unk_1011B6DB0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___showCompleteAlbumCellRegistration, (uint64_t *)&unk_1011A3E40);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___storeNavigationCellRegistration, (uint64_t *)&unk_1011A3E40);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___relatedContentCellRegistration, (uint64_t *)&unk_1011B6D20);
  v5 = (char *)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  v6 = sub_100007E8C((uint64_t *)&unk_1011B6CD0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, (uint64_t *)&unk_1011B6CF0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_wrappedViewController, (uint64_t *)&unk_1011B6910);
  swift_bridgeObjectRelease();
  sub_1004CB930(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___dragDropController));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_1011A3D50);
  sub_1004C826C(*(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_presentedLoadingState), *(_QWORD *)&self->waveformPlayer[OBJC_IVAR____TtC5Music21AlbumDetailDataSource_presentedLoadingState], *(_QWORD *)&self->wrappedViewController[OBJC_IVAR____TtC5Music21AlbumDetailDataSource_presentedLoadingState]);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_artwork, &qword_1011A1440);
  sub_1004CB930(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___relatedContentProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music21AlbumDetailDataSource____lazy_storage___openInClassicalBarButtonItem));
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_album, &qword_1011A8FA0);
  v7 = (char *)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_source;
  v8 = type metadata accessor for MusicPropertySource(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_catalogLoadingSource, &qword_1011B68F0);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_scope, (uint64_t *)&unk_1011D0B60);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_sourceURL, &qword_10119E460);
  swift_release();
  swift_release();
  sub_1004CA0BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_autoupdatingResponse));
  swift_release();
  swift_bridgeObjectRelease();

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_attributionItem, &qword_1011B6938);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_tracks, &qword_1011B1F10);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_prominentTrackSource, (uint64_t *)&unk_1011A3D70);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_catalogAlbum, &qword_1011A8FA0);
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC5Music21AlbumDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music21AlbumDetailDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1004C8C78(a4);
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
  _TtC5Music21AlbumDetailDataSource *v12;
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
  sub_1004A1790((uint64_t)v11, (uint64_t)v10);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  _BOOL8 v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  v13 = IndexPath.section.getter(v12);
  v14 = sub_1004A72EC(2u);
  v16 = v15;

  v18 = (v16 & 1) == 0 && v13 == v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v18;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music21AlbumDetailDataSource *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1004A275C(v11, v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC5Music21AlbumDetailDataSource *v11;
  void *v12;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1004C8FD4(v9);
  swift_bridgeObjectRelease();

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music21AlbumDetailDataSource *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1004C9684(v14, (uint64_t)v12);

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
  _TtC5Music21AlbumDetailDataSource *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1004C97B8((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Music21AlbumDetailDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1004A441C(v4);

}

- (_TtC5Music21AlbumDetailDataSource)init
{
  _TtC5Music21AlbumDetailDataSource *result;

  result = (_TtC5Music21AlbumDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer("Music.AlbumDetailDataSource", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
