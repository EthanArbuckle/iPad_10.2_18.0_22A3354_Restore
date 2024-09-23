@implementation Library.SongsView.SongsViewController

- (void)viewDidLoad
{
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v2;

  v2 = self;
  sub_100762578();

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4;
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10076454C();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1007645CC(a4);
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
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100763614((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  uint64_t v19;
  id v20;
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v21;
  void *v22;
  _BYTE v24[24];

  v8 = sub_100007E8C((uint64_t *)&unk_1011C7200);
  __chkstk_darwin(v8);
  v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = (char *)self
      + OBJC_IVAR____TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController_headerRegistration;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController_headerRegistration, v24, 0, 0);
  sub_10004A160((uint64_t)v15, (uint64_t)v10, (uint64_t *)&unk_1011C7200);
  v16 = sub_100007E8C(&qword_1011B5650);
  v17 = *(_QWORD *)(v16 - 8);
  result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v19 = sub_10004A07C(0, (unint64_t *)&unk_1011AE8C0, UICollectionViewListCell_ptr);
    v20 = a3;
    v21 = self;
    v22 = (void *)UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)(v10, v14, v19);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v10, v16);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return v22;
  }
  return result;
}

- (id)indexTitlesForCollectionView:(id)a3
{
  id v4;
  _TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *v5;
  _QWORD *v6;
  NSArray v7;

  v4 = a3;
  v5 = self;
  v6 = sub_100763D24();

  if (v6)
  {
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (id)collectionView:(id)a3 indexPathForIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  Class isa;
  uint64_t v12;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  IndexPath.init(item:section:)(0, a5);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return isa;
}

- (_TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *)sub_10076407C(v5, v7, a4);
}

- (_TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController)initWithCoder:(id)a3
{
  return (_TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController *)sub_1007641F8(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController____lazy_storage___collectionView));
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController_cellRegistration, (uint64_t *)&unk_1011B8D18);
  sub_10004FF60((uint64_t)self+ OBJC_IVAR____TtCVE5MusicO9MusicCore7Library9SongsViewP33_E3F5F7086ECA7634E91FC0DB0840FB7819SongsViewController_headerRegistration, (uint64_t *)&unk_1011C7200);
}

@end
