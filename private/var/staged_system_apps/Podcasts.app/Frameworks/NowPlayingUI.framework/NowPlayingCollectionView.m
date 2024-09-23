@implementation NowPlayingCollectionView

- (_TtC12NowPlayingUI24NowPlayingCollectionView)init
{
  return (_TtC12NowPlayingUI24NowPlayingCollectionView *)sub_978EC();
}

- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithCoder:(id)a3
{
  id v4;
  _TtC12NowPlayingUI24NowPlayingCollectionView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_interactiveMovementCompletionHandlers) = (Class)&_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_hasInteractiveMovement) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_scrollAndSwipeInteractionsEnabled) = 1;
  v4 = a3;

  result = (_TtC12NowPlayingUI24NowPlayingCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/NowPlayingCollectionView.swift", 43, 2, 252, 0);
  __break(1u);
  return result;
}

- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)beginInteractiveMovementForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12NowPlayingUI24NowPlayingCollectionView *v9;
  Class isa;
  objc_class *v11;
  BOOL v12;
  objc_super v14;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for NowPlayingCollectionView();
  v14.receiver = v9;
  v14.super_class = v11;
  v12 = -[NowPlayingCollectionView beginInteractiveMovementForItemAtIndexPath:](&v14, "beginInteractiveMovementForItemAtIndexPath:", isa);

  *((_BYTE *)&v9->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_hasInteractiveMovement) = 1;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

- (void)endInteractiveMovement
{
  _TtC12NowPlayingUI24NowPlayingCollectionView *v2;

  v2 = self;
  sub_97D14((SEL *)&selRef_endInteractiveMovement);

}

- (void)cancelInteractiveMovement
{
  _TtC12NowPlayingUI24NowPlayingCollectionView *v2;

  v2 = self;
  sub_97D14((SEL *)&selRef_cancelInteractiveMovement);

}

- (_TtC12NowPlayingUI24NowPlayingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC12NowPlayingUI24NowPlayingCollectionView *result;

  v4 = a4;
  result = (_TtC12NowPlayingUI24NowPlayingCollectionView *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingCollectionView", 37, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingCollectionView_interactiveMovementCompletionHandlers));
}

@end
