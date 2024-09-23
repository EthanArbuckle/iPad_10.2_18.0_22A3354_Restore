@implementation InvertedCollectionViewLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17SequoiaTranslator28InvertedCollectionViewLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1000E5900(x, y, width, height);

  if (v8)
  {
    sub_10000A05C(0, (unint64_t *)&qword_10028B088, UICollectionViewLayoutAttributes_ptr);
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
  _TtC17SequoiaTranslator28InvertedCollectionViewLayout *v9;
  id v10;
  uint64_t v12;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  v10 = sub_1000E5D80((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  v4 = a3;
  v5 = v7.receiver;
  -[InvertedCollectionViewLayout invalidateLayoutWithContext:](&v7, "invalidateLayoutWithContext:", v4);
  if (objc_msgSend(v4, "invalidateEverything", v7.receiver, v7.super_class))
  {
    v6 = sub_1000E5888();
    objc_msgSend(v6, "resetSwipedItemAnimated:completion:", 0, 0);

    v4 = v5;
    v5 = v6;
  }

}

- (void)prepareForTransitionFromLayout:(id)a3
{
  sub_1000E6250(self, (uint64_t)a2, a3, 1);
}

- (void)prepareForTransitionToLayout:(id)a3
{
  sub_1000E6250(self, (uint64_t)a2, a3, 0);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3
{
  char *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return -[InvertedCollectionViewLayout initWithSection:](&v6, "initWithSection:", a3);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  char *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return -[InvertedCollectionViewLayout initWithSection:configuration:](&v8, "initWithSection:configuration:", a3, a4);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_10026A5E0, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  return (_TtC17SequoiaTranslator28InvertedCollectionViewLayout *)sub_1000E63E8((uint64_t)sub_10001769C, v4);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_10026A590, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC17SequoiaTranslator28InvertedCollectionViewLayout *)sub_1000E6520((uint64_t)sub_1000175F8, v6, a4);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return -[InvertedCollectionViewLayout initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes));
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate, (uint64_t *)&unk_10028C0A0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController));
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC17SequoiaTranslator28InvertedCollectionViewLayout *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  UIEdgeInsets result;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1000E6E5C();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  return sub_1000E688C(self, (uint64_t)a2, a3, 137);
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  return sub_1000E688C(self, (uint64_t)a2, a3, 144);
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  return sub_1000E6C58(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1000E7020);
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC17SequoiaTranslator28InvertedCollectionViewLayout *v13;
  Class isa;
  uint64_t v16;

  y = a4.y;
  x = a4.x;
  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a3;
  v13 = self;
  sub_1000E6948((uint64_t)v11, x, y);

  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return isa;
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  return sub_1000E6C58(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1000E70F0);
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator28InvertedCollectionViewLayout *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int64_t result;

  v4 = a3;
  v5 = self;
  v6 = -[InvertedCollectionViewLayout collectionView](v5, "collectionView");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "traitCollection");
    v9 = objc_msgSend(v8, "layoutDirection");

    return (int64_t)v9;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000024, 0x80000001001FCE70, "SequoiaTranslator/InvertedCollectionViewLayout.swift", 52, 2, 175, 0);
    __break(1u);
  }
  return result;
}

@end
