@implementation NowPlayingCollectionViewLayout

- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)init
{
  return (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout *)sub_95F4C();
}

- (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  id v5;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *result;

  self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_cellSwipeActionEnabled] = 1;
  *(_QWORD *)&self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_orientationWhenLastInvalidatedTableLayout] = 0;
  v4 = &self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout__lastBackgroundDecorationRect];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = a3;

  result = (_TtC12NowPlayingUI30NowPlayingCollectionViewLayout *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000183FF0, "NowPlayingUI/NowPlayingCollectionView.swift", 43, 2, 30, 0);
  __break(1u);
  return result;
}

- (double)_paddingAboveSectionHeaders
{
  return 0.0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *v7;
  unint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_960E4(x, y, width, height);

  if (v8)
  {
    sub_98060();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *v14;
  char *v15;
  __n128 v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  v15 = sub_96330(v11, v13);

  v16 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  objc_super v5;

  if (self->UICollectionViewTableLayout_opaque[OBJC_IVAR____TtC12NowPlayingUI30NowPlayingCollectionViewLayout_cellSwipeActionEnabled] != 1)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[NowPlayingCollectionViewLayout gestureRecognizerViewForSwipeActionController:](&v5, "gestureRecognizerViewForSwipeActionController:", a3);
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *v12;
  id v13;
  uint64_t v15;

  y = a4.y;
  x = a4.x;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = self;
  v13 = sub_967EC(x, y);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  char v13;
  char v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v6 = self;
  v7 = -[NowPlayingCollectionViewLayout collectionView](v6, "collectionView");
  if (!v7)
  {

LABEL_6:
    v14 = 1;
    return v14 & 1;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "bounds");
  if ((static CGSize.==~ infix(_:_:)(v9, v10, v11, width, height) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v8, "bounds");
  v13 = static CGFloat.==~ infix(_:_:)(v12, y);

  v14 = v13 ^ 1;
  return v14 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12NowPlayingUI30NowPlayingCollectionViewLayout *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_96F2C(x, y, width, height);

  return v8;
}

@end
