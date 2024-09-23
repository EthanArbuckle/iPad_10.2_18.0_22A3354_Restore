@implementation LibraryDownloadingViewController

- (_TtC16MusicApplication32LibraryDownloadingViewController)init
{
  return (_TtC16MusicApplication32LibraryDownloadingViewController *)sub_AC1AA8();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication32LibraryDownloadingViewController *v2;

  v2 = self;
  sub_AC1D64();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16MusicApplication32LibraryDownloadingViewController *v4;

  v3 = a3;
  v4 = self;
  sub_AC2A58(v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[LibraryDownloadingViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  sub_AC2390();
  sub_9BF7D0(0);

  swift_release();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC16MusicApplication32LibraryDownloadingViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_AC4878(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _TtC16MusicApplication32LibraryDownloadingViewController *v18;
  void *v19;
  uint64_t v21;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = (char *)self + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController_headerRegistration;
  v14 = sub_4E684(0, (unint64_t *)&qword_14B5260, UICollectionViewCell_ptr);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = self;
  v19 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v13, v12, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication32LibraryDownloadingViewController *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = (void *)sub_AC3CC8((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC16MusicApplication32LibraryDownloadingViewController *v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController_sections);
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = IndexPath.section.getter(v14);
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v15 >= *(_QWORD *)(v11 + 16))
  {
LABEL_8:
    __break(1u);
    return v15;
  }
  v16 = 0xE90000000000006CLL;
  if ((*(_BYTE *)(v11 + v15 + 32) & 1) != 0)
  {
    v16 = 0xE900000000000073;
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64616F6C6E776F64, 0xE900000000000073, 0x6C416C65636E6163, 0xE90000000000006CLL, 0);
  }
  else
  {
    v17 = 1;
  }

  swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  LOBYTE(v15) = v17 & 1;
  return v15;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication32LibraryDownloadingViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_AC49DC((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC16MusicApplication32LibraryDownloadingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AC4B18();
}

- (_TtC16MusicApplication32LibraryDownloadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication32LibraryDownloadingViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication32LibraryDownloadingViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryDownloadingViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController_headerRegistration;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14B0F10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController____lazy_storage___actionCellRegistration, &qword_14F5360);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController____lazy_storage___listCellRegistration, &qword_14EA290);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32LibraryDownloadingViewController_prefetchingController));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
