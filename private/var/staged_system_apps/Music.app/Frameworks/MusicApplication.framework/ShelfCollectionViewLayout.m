@implementation ShelfCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_contentSize);
  v3 = *(double *)&self->scrollStyle[OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for ShelfCollectionViewLayout.InvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = (void *)ShelfCollectionViewLayout.invalidationContext(forBoundsChange:)(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v5;

  v4 = a3;
  v5 = self;
  ShelfCollectionViewLayout.invalidateLayout(with:)((UICollectionViewLayoutInvalidationContext)v4);

}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v7;
  Class isa;
  _QWORD *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = _swiftEmptyArrayStorage;
  v7 = self;
  sub_76CA64((char *)v7, v7, &v10, x, y, width, height);
  sub_76D194((char *)v7, v7, &v10, x, y, width, height);
  sub_76D408((char *)v7, v7, &v10, x, y, width, height);

  sub_4E684(0, (unint64_t *)&qword_14B5940, UICollectionViewLayoutAttributes_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v10;
  void *v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a3;
  v10 = self;
  v11 = (void *)ShelfCollectionViewLayout.layoutAttributesForItem(at:)((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v16;
  void *v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = (void *)ShelfCollectionViewLayout.layoutAttributesForSupplementaryView(ofKind:at:)(v11, v13, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();

  return v17;
}

- (void)prepareLayout
{
  _TtC16MusicApplication25ShelfCollectionViewLayout *v2;

  v2 = self;
  ShelfCollectionViewLayout.prepare()();

}

- (void)panGestureRecognizerStateDidChange:(id)a3
{
  id v4;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v5;

  v4 = a3;
  v5 = self;
  sub_753348(v4);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v7;
  unsigned __int8 v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = ShelfCollectionViewLayout.shouldInvalidateLayout(forBoundsChange:)(x, y, width, height);

  return v8 & 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat x;
  double y;
  CGFloat v6;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v7;
  int8x16_t v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  x = a4.x;
  y = a3.y;
  v6 = a3.x;
  v7 = self;
  *(CGFloat *)v8.i64 = x;
  v9 = ShelfCollectionViewLayout.targetContentOffset(forProposedContentOffset:withScrollingVelocity:)(v6, y, v8);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)music_collectionViewInheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShelfCollectionViewLayout(0);
  v2 = v3.receiver;
  -[ShelfCollectionViewLayout music_collectionViewInheritedLayoutInsetsDidChange](&v3, "music_collectionViewInheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "invalidateLayout", v3.receiver, v3.super_class);

}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (_TtC16MusicApplication25ShelfCollectionViewLayout)init
{
  return (_TtC16MusicApplication25ShelfCollectionViewLayout *)ShelfCollectionViewLayout.init()();
}

- (_TtC16MusicApplication25ShelfCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication25ShelfCollectionViewLayout *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication25ShelfCollectionViewLayout *)sub_76E018((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication25ShelfCollectionViewLayout_startingIndexPath, (uint64_t *)&unk_14AD540);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
