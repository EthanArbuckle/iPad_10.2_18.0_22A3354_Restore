@implementation CompositeCollectionViewLayout

- (void)prepareLayout
{
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v2;

  v2 = self;
  sub_E89D0();

}

- (CGSize)collectionViewContentSize
{
  uint64_t v2;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  char v8;
  double v9;
  double v10;
  CGSize result;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_layoutData);
  if (v2)
  {
    v3 = self;
    swift_retain();
    sub_CE4AC();
    if ((v8 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v9 = v4;
      v10 = v5;

      swift_release(v2);
      v6 = v9;
      v7 = v10;
    }
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v7;
  _QWORD *v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_E8C9C(x, y, width, height);

  if (v8)
  {
    sub_F174(0, (unint64_t *)&qword_1FEAC0, UICollectionViewLayoutAttributes_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_E9994();
  v11 = v10;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
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
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v14;
  void *v15;
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
  v15 = sub_E9DC0(v11, v13, (uint64_t)v10);

  v16 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v14;
  void *v15;
  void *v16;
  __n128 v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_ED2B8((uint64_t)v10, 1, v11, v13, (uint64_t)v14, v11, v13, (SEL *)&selRef_layoutAttributesForSupplementaryViewOfKind_atIndexPath_);
  v16 = v15;

  v17 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v17);
  return v16;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v7;
  Class isa;
  uint64_t v9;
  objc_super v10;

  v5 = sub_F174(0, &qword_200F80, UICollectionViewUpdateItem_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for CompositeCollectionViewLayout();
  -[CompositeCollectionViewLayout prepareForCollectionViewUpdates:](&v10, "prepareForCollectionViewUpdates:", isa);

  v9 = *(uint64_t *)((char *)&v7->super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_currentCollectionViewUpdates);
  *(Class *)((char *)&v7->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_currentCollectionViewUpdates) = (Class)v6;

  swift_bridgeObjectRelease(v9);
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v6;
  uint64_t v7;
  Class isa;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  v7 = sub_EA294();

  swift_bridgeObjectRelease(v5);
  type metadata accessor for IndexPath(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CompositeCollectionViewLayout.InvalidationContext();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v5;

  v4 = a3;
  v5 = self;
  sub_EAA68(v4);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v7;
  unsigned __int8 v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_EB29C(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = (void *)sub_EB83C(x, y, width, height);

  return v8;
}

- (id)_decorationViewForLayoutAttributes:(id)a3
{
  id v4;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_EBD70(v4);

  return v6;
}

- (BOOL)canBeEdited
{
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_EC0BC();

  return v3 & 1;
}

- (BOOL)isEditing
{
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v2;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v3;
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)-[CompositeCollectionViewLayout collectionView](v2, "collectionView");
  if (v3)
  {
    v4 = v3;
    v5 = -[CompositeCollectionViewLayout mt_isEditing](v3, "mt_isEditing");

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setEditing:(BOOL)a3
{
  _TtC12NowPlayingUI29CompositeCollectionViewLayout *v4;

  v4 = self;
  sub_EC268(a3);

}

- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)init
{
  return (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)sub_ECCB4();
}

- (_TtC12NowPlayingUI29CompositeCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI29CompositeCollectionViewLayout *)sub_ECDB8(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_countData));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_layoutData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_decorationLayoutAttributes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_lastDecorationLayoutAttributes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI29CompositeCollectionViewLayout_currentCollectionViewUpdates));
}

@end
