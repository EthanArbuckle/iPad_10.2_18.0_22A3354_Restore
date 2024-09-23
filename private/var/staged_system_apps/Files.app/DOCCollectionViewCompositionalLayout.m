@implementation DOCCollectionViewCompositionalLayout

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
  _BYTE v17[48];
  _BYTE v18[24];
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)swift_getObjectType(self, a2);
  v7 = (char *)v19.receiver;
  v8 = -[DOCCollectionViewCompositionalLayout layoutAttributesForElementsInRect:](&v19, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (!v8)
  {

    goto LABEL_5;
  }
  v9 = v8;
  v10 = sub_100085700();
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  v12 = (uint64_t)&v7[OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_coreLayout];
  swift_beginAccess(&v7[OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_coreLayout], v18, 0, 0);
  sub_1000423F8(v12, (uint64_t)v17, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakCopyInit);
  sub_100066164(v11);
  v14 = v13;
  swift_bridgeObjectRelease(v11);
  sub_1000423BC((uint64_t)v17);

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

- (CGSize)collectionViewContentSize
{
  _TtC5Files36DOCCollectionViewCompositionalLayout *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  v4 = sub_1000422E8((uint64_t)v2, v3);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)prepareLayout
{
  uint64_t v2;
  _TtC5Files36DOCCollectionViewCompositionalLayout *v3;

  v3 = self;
  sub_1000214B8((uint64_t)v3, v2);

}

- (_TtC5Files36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_1005D1A90, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  return (_TtC5Files36DOCCollectionViewCompositionalLayout *)sub_10000454C((uint64_t)sub_1002000F4, v4);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5Files36DOCCollectionViewCompositionalLayout *v7;
  uint64_t v8;
  char v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v9 = sub_10008F74C(x, y, width, height, (uint64_t)v7, v8);

  return v9 & 1;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC5Files36DOCCollectionViewCompositionalLayout *v13;
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
  sub_1001FF6EC();
  v15 = v14;

  v16 = swift_bridgeObjectRelease(v12);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v16);
  return v15;
}

- (_TtC5Files36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  objc_class *ObjectType;
  _OWORD *v6;
  __int128 v7;
  char *v8;
  objc_super v10;
  _BYTE v11[8];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_footerViewHeight) = 0;
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_footerViewContentInsets);
  v7 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  *v6 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  v6[1] = v7;
  v8 = (char *)self + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_coreLayout;
  v11[0] = 0;
  v15[1] = 0;
  v13 = 0;
  v14 = 0;
  v12 = 0;
  swift_unknownObjectWeakInit(v15);
  sub_1000423F8((uint64_t)v11, (uint64_t)v8, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakTakeInit);
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DOCCollectionViewCompositionalLayout initWithSection:](&v10, "initWithSection:", a3);
}

- (_TtC5Files36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_class *ObjectType;
  _OWORD *v8;
  __int128 v9;
  char *v10;
  objc_super v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_footerViewHeight) = 0;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_footerViewContentInsets);
  v9 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  *v8 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  v8[1] = v9;
  v10 = (char *)self + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_coreLayout;
  v13[0] = 0;
  v17[1] = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  swift_unknownObjectWeakInit(v17);
  sub_1000423F8((uint64_t)v13, (uint64_t)v10, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakTakeInit);
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[DOCCollectionViewCompositionalLayout initWithSection:configuration:](&v12, "initWithSection:configuration:", a3, a4);
}

- (_TtC5Files36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_1005D1A40, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC5Files36DOCCollectionViewCompositionalLayout *)sub_1001FFB1C((uint64_t)sub_100087838, v6, a4);
}

- (_TtC5Files36DOCCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  return (_TtC5Files36DOCCollectionViewCompositionalLayout *)sub_1001FFCC0(a3);
}

- (void).cxx_destruct
{
  sub_1000423BC((uint64_t)self + OBJC_IVAR____TtC5Files36DOCCollectionViewCompositionalLayout_coreLayout);
}

@end
