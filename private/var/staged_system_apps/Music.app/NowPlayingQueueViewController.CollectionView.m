@implementation NowPlayingQueueViewController.CollectionView

- (void)dealloc
{
  _TtCC5Music29NowPlayingQueueViewController14CollectionView *v2;

  v2 = self;
  sub_1003FB30C();
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock), *(_QWORD *)&self->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock]);
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock), *(_QWORD *)&self->interactiveMovementDidBeginBlock[OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementCompletionHandlers));
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCC5Music29NowPlayingQueueViewController14CollectionView *v9;
  uint64_t v11;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  LOBYTE(a3) = sub_1003FB780();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (void)endInteractiveMovement
{
  _TtCC5Music29NowPlayingQueueViewController14CollectionView *v2;

  v2 = self;
  sub_1003FB8D0();

}

- (void)cancelInteractiveMovement
{
  _TtCC5Music29NowPlayingQueueViewController14CollectionView *v2;

  v2 = self;
  sub_1003FBB98();

}

- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
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
               + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidBeginBlock);
  *v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementDidEndBlock);
  *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_maxReorderingContentOffset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_interactiveMovementCompletionHandlers) = (Class)_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtCC5Music29NowPlayingQueueViewController14CollectionView_hasInteractiveMovement) = 0;
  v12.receiver = self;
  v12.super_class = (Class)_s14CollectionViewCMa();
  return -[NowPlayingQueueViewController.CollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtCC5Music29NowPlayingQueueViewController14CollectionView)initWithCoder:(id)a3
{
  return (_TtCC5Music29NowPlayingQueueViewController14CollectionView *)sub_1003FBD08(a3);
}

@end
