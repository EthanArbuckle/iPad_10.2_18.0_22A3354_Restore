@implementation AlbumDetailDataSource

- (void)dealloc
{
  _TtC16MusicApplication21AlbumDetailDataSource *v3;
  _TtC16MusicApplication21AlbumDetailDataSource *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_asyncSetupTask))
  {
    v3 = self;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD690);
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

  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___headerRegistration, &qword_14F96B8);
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_bannerRegistration;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14F95B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___trackCellRegistration, &qword_14F9648);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___noContentCellRegistration, &qword_14F95D0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___detailCellRegistration, (uint64_t *)&unk_14F95F0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___showCompleteAlbumCellRegistration, &qword_14F95D0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___storeNavigationCellRegistration, &qword_14F95D0);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___relatedContentCellRegistration, &qword_14EA1E8);
  v5 = (char *)self
     + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_symphonyRelatedContentSpacingCellRegistration;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14EA1A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___symphonyRelatedContentCellRegistration, &qword_14EA1B8);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_wrappedViewController, &qword_14E9C98);
  swift_bridgeObjectRelease();
  sub_955CE8(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___dragDropController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_prominentItemIndexPath, (uint64_t *)&unk_14AD540);
  sub_953020(*(unint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_presentedLoadingState), *(_QWORD *)&self->waveformPlayer[OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_presentedLoadingState], *(_QWORD *)&self->wrappedViewController[OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_presentedLoadingState]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_artwork, (uint64_t *)&unk_14AD650);
  sub_955CE8(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___relatedContentProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_openInClassicalButton));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource____lazy_storage___openInClassicalBarButtonItem));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_album, (uint64_t *)&unk_14BB520);
  v7 = (char *)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_source;
  v8 = type metadata accessor for MusicPropertySource(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_catalogLoadingSource, &qword_14F91A8);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_scope, &qword_14F9180);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_sourceURL, &qword_14AED20);
  swift_release();
  swift_release();
  sub_9548C4(*(uint64_t *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_autoupdatingResponse));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_containerDetailLink));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_attributionItem, &qword_14E9C88);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_tracks, (uint64_t *)&unk_14B70C0);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_prominentTrackSource, (uint64_t *)&unk_14BB510);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_catalogAlbum, (uint64_t *)&unk_14BB520);
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication21AlbumDetailDataSource *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_B91F00(a4);
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
  _TtC16MusicApplication21AlbumDetailDataSource *v13;
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
  sub_B658EC((uint64_t)v11, (uint64_t)v10);
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (BOOL)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(void *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  _BOOL8 v19;
  uint64_t v21;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = a1;
  v14 = IndexPath.section.getter(v13);
  v15 = sub_B6B56C(2u);
  v17 = v16;

  v19 = (v17 & 1) == 0 && v14 == v15;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v19;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication21AlbumDetailDataSource *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_B66908(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC16MusicApplication21AlbumDetailDataSource *v12;
  void *v13;

  v8 = type metadata accessor for IndexPath(0);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  v10 = a3;
  v11 = a4;
  v12 = self;
  v13 = (void *)sub_B9225C(v9);

  swift_bridgeObjectRelease();
  return v13;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC16MusicApplication21AlbumDetailDataSource *v17;
  unint64_t v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication21AlbumDetailDataSource_sections);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = IndexPath.section.getter(v17);
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v18 >= *(_QWORD *)(v13 + 16))
  {
LABEL_7:
    __break(1u);
    return;
  }
  if (!*(_BYTE *)(v13 + v18 + 32))
    sub_B793F4();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication21AlbumDetailDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_B68850(v4);

}

- (_TtC16MusicApplication21AlbumDetailDataSource)init
{
  _TtC16MusicApplication21AlbumDetailDataSource *result;

  result = (_TtC16MusicApplication21AlbumDetailDataSource *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.AlbumDetailDataSource", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
