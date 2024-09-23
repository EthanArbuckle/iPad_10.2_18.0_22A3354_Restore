@implementation LibraryDownloadingViewController

- (_TtC5Music32LibraryDownloadingViewController)init
{
  return (_TtC5Music32LibraryDownloadingViewController *)sub_10027FF3C();
}

- (void)viewDidLoad
{
  _TtC5Music32LibraryDownloadingViewController *v2;

  v2 = self;
  sub_1002801F8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Music32LibraryDownloadingViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10028110C(v3);

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
  sub_100280A44();
  sub_1000D9300(0);

  swift_release();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_sections))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC5Music32LibraryDownloadingViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_100282ED4(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC5Music32LibraryDownloadingViewController *v15;
  void *v16;
  uint64_t v18;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v12 = (char *)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_headerRegistration;
  v13 = sub_10004A07C(0, (unint64_t *)&unk_1011A9B70, UICollectionViewCell_ptr);
  v14 = a3;
  v15 = self;
  v16 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v12, v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music32LibraryDownloadingViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100282358((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC5Music32LibraryDownloadingViewController *v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_sections);
  v12 = a3;
  v13 = self;
  v14 = IndexPath.section.getter();
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v14 >= *(_QWORD *)(v11 + 16))
  {
LABEL_8:
    __break(1u);
    return v14;
  }
  v15 = 0xE90000000000006CLL;
  if ((*(_BYTE *)(v11 + v14 + 32) & 1) != 0)
  {
    v15 = 0xE900000000000073;
    v16 = _stringCompareWithSmolCheck(_:_:expecting:)(0x64616F6C6E776F64, 0xE900000000000073, 0x6C416C65636E6163, 0xE90000000000006CLL, 0);
  }
  else
  {
    v16 = 1;
  }

  swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  LOBYTE(v14) = v16 & 1;
  return v14;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music32LibraryDownloadingViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100283038();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC5Music32LibraryDownloadingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100283174();
}

- (_TtC5Music32LibraryDownloadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Music32LibraryDownloadingViewController *result;

  v4 = a4;
  result = (_TtC5Music32LibraryDownloadingViewController *)_swift_stdlib_reportUnimplementedInitializer("Music.LibraryDownloadingViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_headerRegistration;
  v4 = sub_100007E8C(&qword_1011A37B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___actionCellRegistration, &qword_1011A9700);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___listCellRegistration, &qword_1011D12C0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_prefetchingController));
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music32LibraryDownloadingViewController_sections));
}

@end
