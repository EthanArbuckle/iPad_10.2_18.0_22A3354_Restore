@implementation LyricsSelectionViewController

- (void)viewDidLoad
{
  _TtC16MusicApplication29LyricsSelectionViewController *v2;

  v2 = self;
  sub_5FA7B0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication29LyricsSelectionViewController *v4;

  v4 = self;
  sub_5FB374(a3);

}

- (_TtC16MusicApplication29LyricsSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication29LyricsSelectionViewController *v9;

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
  v9 = (_TtC16MusicApplication29LyricsSelectionViewController *)sub_5FFD98(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication29LyricsSelectionViewController)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication29LyricsSelectionViewController *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication29LyricsSelectionViewController *)sub_5FFF88((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_selectionManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_activityIndicator));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_displayActivityIndicatorWorkItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController____lazy_storage___collectionView));
  sub_5C0DC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_pageProperties, type metadata accessor for MetricsPageProperties);
}

- (int64_t)accessibilityCharacterCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t result;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication29LyricsSelectionViewController_selectionManager);
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
  id v15;
  _TtC16MusicApplication29LyricsSelectionViewController *v16;
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
  sub_600134(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC16MusicApplication29LyricsSelectionViewController *v13;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_5FD1F8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
