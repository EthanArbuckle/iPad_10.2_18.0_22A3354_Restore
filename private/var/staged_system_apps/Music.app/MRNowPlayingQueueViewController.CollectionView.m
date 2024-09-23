@implementation MRNowPlayingQueueViewController.CollectionView

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCC5Music31MRNowPlayingQueueViewController14CollectionView *v9;
  Class isa;
  objc_class *v11;
  BOOL v12;
  void (*v13)(__n128);
  uint64_t v14;
  __n128 v15;
  objc_super v17;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for MRNowPlayingQueueViewController.CollectionView();
  v17.receiver = v9;
  v17.super_class = v11;
  v12 = -[MRNowPlayingQueueViewController.CollectionView beginInteractiveMovementForItemAtIndexPath:](&v17, "beginInteractiveMovementForItemAtIndexPath:", isa);

  *((_BYTE *)&v9->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_hasInteractiveMovement) = 1;
  v13 = *(void (**)(__n128))((char *)&v9->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock);
  if (v13)
  {
    v14 = *(_QWORD *)&v9->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock];
    v15 = swift_retain();
    v13(v15);
    sub_10004BA30((uint64_t)v13, v14);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

- (void)endInteractiveMovement
{
  _TtCC5Music31MRNowPlayingQueueViewController14CollectionView *v2;

  v2 = self;
  sub_100443608();

}

- (void)cancelInteractiveMovement
{
  _TtCC5Music31MRNowPlayingQueueViewController14CollectionView *v2;
  void (*v3)(__n128);
  uint64_t v4;
  __n128 v5;
  objc_super v6;

  v2 = self;
  sub_100443440(0);
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CollectionView();
  -[MRNowPlayingQueueViewController.CollectionView cancelInteractiveMovement](&v6, "cancelInteractiveMovement");
  v3 = *(void (**)(__n128))((char *)&v2->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock);
  if (v3)
  {
    v4 = *(_QWORD *)&v2->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock];
    v5 = swift_retain();
    v3(v5);
    sub_10004BA30((uint64_t)v3, v4);
  }

}

- (_TtCC5Music31MRNowPlayingQueueViewController14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v9;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock);
  *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_maxReorderingContentOffset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementCompletionHandlers) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_hasInteractiveMovement) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MRNowPlayingQueueViewController.CollectionView();
  return -[MRNowPlayingQueueViewController.CollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtCC5Music31MRNowPlayingQueueViewController14CollectionView)initWithCoder:(id)a3
{
  return (_TtCC5Music31MRNowPlayingQueueViewController14CollectionView *)sub_100443A90(a3);
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock), *(_QWORD *)&self->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock), *(_QWORD *)&self->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtCC5Music31MRNowPlayingQueueViewController14CollectionView_interactiveMovementCompletionHandlers));
}

@end
