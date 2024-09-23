@implementation SwipableCollectionViewLayout

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  v4 = a3;
  v5 = v7.receiver;
  -[SwipableCollectionViewLayout invalidateLayoutWithContext:](&v7, "invalidateLayoutWithContext:", v4);
  if (objc_msgSend(v4, "invalidateEverything", v7.receiver, v7.super_class))
  {
    v6 = sub_100183488();
    objc_msgSend(v6, "resetSwipedItemAnimated:completion:", 0, 0);

    v4 = v5;
    v5 = v6;
  }

}

- (void)prepareForTransitionFromLayout:(id)a3
{
  sub_1001835B4(self, (uint64_t)a2, a3, 1);
}

- (void)prepareForTransitionToLayout:(id)a3
{
  sub_1001835B4(self, (uint64_t)a2, a3, 0);
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return -[SwipableCollectionViewLayout initWithSection:](&v6, "initWithSection:", a3);
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  char *v6;
  objc_super v8;

  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return -[SwipableCollectionViewLayout initWithSection:configuration:](&v8, "initWithSection:configuration:", a3, a4);
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v9;
  objc_super v11;
  _QWORD aBlock[5];
  uint64_t v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10026F870, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  aBlock[4] = sub_100184544;
  v13 = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BAEF0;
  aBlock[3] = &unk_10026F888;
  v7 = _Block_copy(aBlock);
  v8 = v13;
  swift_retain(v5);
  swift_release(v8);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  v9 = -[SwipableCollectionViewLayout initWithSectionProvider:](&v11, "initWithSectionProvider:", v7);
  swift_release(v5);
  _Block_release(v7);
  return v9;
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v12;
  objc_super v14;
  _QWORD aBlock[5];
  uint64_t v16;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_10026F820, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  aBlock[4] = sub_1001844F8;
  v16 = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001BAEF0;
  aBlock[3] = &unk_10026F838;
  v9 = _Block_copy(aBlock);
  v10 = v16;
  v11 = a4;
  swift_retain(v7);
  swift_release(v10);
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  v12 = -[SwipableCollectionViewLayout initWithSectionProvider:configuration:](&v14, "initWithSectionProvider:configuration:", v9, v11);
  swift_release(v7);

  _Block_release(v9);
  return v12;
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return -[SwipableCollectionViewLayout initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10000A020((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate, &qword_100296D68);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController));
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v12;
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
  sub_1001840C4();
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
  id v4;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v5;
  id v6;
  void *v7;
  id result;

  v4 = a3;
  v5 = self;
  v6 = -[SwipableCollectionViewLayout collectionView](v5, "collectionView");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "endEditing:", 1);

    return v7;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000024, 0x80000001001FCE70, "SequoiaTranslator/SwipableCollectionViewLayout.swift", 52, 2, 63, 0);
    __break(1u);
  }
  return result;
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v5;
  id v6;
  void *v7;
  id result;

  v4 = a3;
  v5 = self;
  v6 = -[SwipableCollectionViewLayout collectionView](v5, "collectionView");
  if (v6)
  {
    v7 = v6;

    return v7;
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000024, 0x80000001001FCE70, "SequoiaTranslator/SwipableCollectionViewLayout.swift", 52, 2, 71, 0);
    __break(1u);
  }
  return result;
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
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v13;
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
  sub_100183C98(v11, x, y);

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
  return sub_1000E6C58(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1001843D0);
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator28SwipableCollectionViewLayout *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int64_t result;

  v4 = a3;
  v5 = self;
  v6 = -[SwipableCollectionViewLayout collectionView](v5, "collectionView");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "traitCollection");
    v9 = objc_msgSend(v8, "layoutDirection");

    return (int64_t)v9;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000024, 0x80000001001FCE70, "SequoiaTranslator/SwipableCollectionViewLayout.swift", 52, 2, 102, 0);
    __break(1u);
  }
  return result;
}

@end
