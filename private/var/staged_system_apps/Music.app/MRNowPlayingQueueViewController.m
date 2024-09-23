@implementation MRNowPlayingQueueViewController

- (void)viewDidLoad
{
  _TtC5Music31MRNowPlayingQueueViewController *v2;

  v2 = self;
  sub_10043C01C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController(0);
  v4 = v5.receiver;
  -[MRNowPlayingQueueViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_currentSection] = 1;
  v4[OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_didAppearOnce] = 1;

}

- (void)handleLongPress:(id)a3
{
  id v4;
  _TtC5Music31MRNowPlayingQueueViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004414C8(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC5Music31MRNowPlayingQueueViewController *v8;

  v4 = a3;
  v8 = self;
  objc_msgSend(v4, "setDecelerationRate:", UIScrollViewDecelerationRateNormal);
  objc_msgSend(v4, "contentOffset");
  v5 = (Class *)((char *)&v8->super.super.super.isa
               + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_initialDraggingOffset);
  *v5 = v6;
  v5[1] = v7;
  *((_BYTE *)&v8->super.super.super.isa
  + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_shouldPlayHapticFeedback) = 1;

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC5Music31MRNowPlayingQueueViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1004418BC(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v8;
  double v9;
  _TtC5Music31MRNowPlayingQueueViewController *v10;

  y = a4.y;
  v8 = a3;
  v10 = self;
  sub_100441B04(v8, &a5->x, v9, y);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  objc_msgSend(a3, "setDecelerationRate:", UIScrollViewDecelerationRateNormal);
}

- (_TtC5Music31MRNowPlayingQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Music31MRNowPlayingQueueViewController *)sub_1004426B8(v5, v7, a4);
}

- (_TtC5Music31MRNowPlayingQueueViewController)initWithCoder:(id)a3
{
  return (_TtC5Music31MRNowPlayingQueueViewController *)sub_100442908(a3);
}

- (void).cxx_destruct
{
  uint64_t *v3;
  char *v4;
  uint64_t v5;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController__data);
  sub_100445F78(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController__data), v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9], v3[10], v3[11], v3[12], v3[13]);
  sub_10005B748((uint64_t)self + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_updateContext, type metadata accessor for MRNowPlayingQueueViewController.UpdateContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController____lazy_storage___collectionView));
  v4 = (char *)self + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_cellRegistration;
  v5 = sub_100007E8C((uint64_t *)&unk_1011B42E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_feedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_headerSizingView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Music31MRNowPlayingQueueViewController_bindings));
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC5Music31MRNowPlayingQueueViewController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = sub_100442D70(v7, x, y);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)_collectionView:(id)a3 indexPathOfReferenceItemToPreserveContentOffsetWithProposedReference:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v5 = sub_100007E8C((uint64_t *)&unk_1011A3D50);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - v9;
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 1, v11);
  }
  else
  {
    v11 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  }
  type metadata accessor for IndexPath(0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  sub_10004FF60((uint64_t)v7, (uint64_t *)&unk_1011A3D50);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  return isa;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC5Music31MRNowPlayingQueueViewController *v20;
  void (*v21)(char *, uint64_t);
  Class isa;
  uint64_t v24;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v24 - v14;
  __chkstk_darwin(v16);
  v18 = (char *)&v24 - v17;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = a3;
  v20 = self;
  sub_1004430A4(v19, (uint64_t)v12, (uint64_t)v18);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v12, v9);
  v21(v15, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v21(v18, v9);
  return isa;
}

- (uint64_t)collectionView:(void *)a3 shouldHighlightItemAtIndexPath:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = a1;
  sub_100445A9C((uint64_t)v10);
  LOBYTE(a1) = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return a1 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5Music31MRNowPlayingQueueViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100445BA8((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
