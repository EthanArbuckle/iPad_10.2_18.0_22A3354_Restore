@implementation LyricsSelectionViewController

- (void)viewDidLoad
{
  _TtC5Music29LyricsSelectionViewController *v2;

  v2 = self;
  sub_1002EE18C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Music29LyricsSelectionViewController *v4;

  v4 = self;
  sub_1002EED68(a3);

}

- (_TtC5Music29LyricsSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Music29LyricsSelectionViewController *)sub_1002F08EC(v5, v7, a4);
}

- (_TtC5Music29LyricsSelectionViewController)initWithCoder:(id)a3
{
  return (_TtC5Music29LyricsSelectionViewController *)sub_1002F0B3C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_activityIndicator));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29LyricsSelectionViewController____lazy_storage___collectionView));
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_pageProperties, type metadata accessor for MetricsPageProperties);
}

- (int64_t)accessibilityCharacterCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Music29LyricsSelectionViewController_selectionManager);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 64);
  result = v3 - v4;
  if (__OFSUB__(v3, v4))
    __break(1u);
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC5Music29LyricsSelectionViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1002F3ADC(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music29LyricsSelectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1002F0FA8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
