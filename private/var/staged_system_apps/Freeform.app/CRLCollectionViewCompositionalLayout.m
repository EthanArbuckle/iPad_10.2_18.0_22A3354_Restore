@implementation CRLCollectionViewCompositionalLayout

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005B9784();
}

- (void)prepareLayout
{
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *v2;

  v2 = self;
  sub_1005B8898();

}

- (CGSize)collectionViewContentSize
{
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1005B89B8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1005B8A6C(x, y, width, height);

  return v8 & 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType(self);
  v7 = (char *)v17.receiver;
  v8 = -[CRLCollectionViewCompositionalLayout layoutAttributesForElementsInRect:](&v17, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (!v8)
  {

    goto LABEL_5;
  }
  v9 = v8;
  v10 = sub_1005B9748();
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  v12 = *(_QWORD *)&v7[OBJC_IVAR____TtC8Freeform36CRLCollectionViewCompositionalLayout_coreLayout];
  swift_retain(v12);
  sub_1005B9334(v11);
  v14 = v13;

  swift_release(v12);
  swift_bridgeObjectRelease(v11);
  if (!v14)
  {
LABEL_5:
    v15.super.isa = 0;
    return v15.super.isa;
  }
  v15.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  return v15.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *v13;
  void *v14;
  void *v15;
  __n128 v16;
  uint64_t v18;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = self;
  sub_1005B8CF8();
  v15 = v14;

  v16 = swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  id v3;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *result;

  v3 = a3;
  result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollectionViewCompositionalLayout", 45, "init(section:)", 14, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  id v6;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollectionViewCompositionalLayout", 45, "init(section:configuration:)", 28, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *result;

  v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollectionViewCompositionalLayout", 45, "init(sectionProvider:)", 22, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform36CRLCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  id v6;
  _TtC8Freeform36CRLCollectionViewCompositionalLayout *result;

  v5 = _Block_copy(a3);
  v6 = a4;
  _Block_release(v5);
  result = (_TtC8Freeform36CRLCollectionViewCompositionalLayout *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCollectionViewCompositionalLayout", 45, "init(sectionProvider:configuration:)", 36, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform36CRLCollectionViewCompositionalLayout_coreLayout));
}

@end
