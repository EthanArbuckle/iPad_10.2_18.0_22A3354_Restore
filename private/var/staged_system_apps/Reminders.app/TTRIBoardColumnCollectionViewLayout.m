@implementation TTRIBoardColumnCollectionViewLayout

- (void)prepareLayout
{
  uint64_t v2;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v3;

  v3 = self;
  sub_1000588E0((uint64_t)v3, v2);

}

+ (Class)layoutAttributesClass
{
  uint64_t v2;

  v2 = type metadata accessor for TTRBoardColumnItemLayoutAttributes(0, a2);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (CGSize)collectionViewContentSize
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v9.receiver;
  v3 = -[TTRIBoardColumnCollectionViewLayout collectionViewContentSize](&v9, "collectionViewContentSize");
  v4 = TTRBoardColumnCollectionViewLayoutHelper.collectionViewContentSize(baseSize:)(v3);
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v10;
  Class isa;
  id v12;
  void *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v15.receiver = v10;
  v15.super_class = ObjectType;
  v12 = -[TTRIBoardColumnCollectionViewLayout layoutAttributesForItemAtIndexPath:](&v15, "layoutAttributesForItemAtIndexPath:", isa);

  if (v12)
  {
    v13 = (void *)TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForItem(at:baseAttributes:)(v9, v12);

  }
  else
  {

    v13 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v7;
  uint64_t v8;
  Class isa;
  _QWORD v11[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11[2] = self;
  v7 = self;
  v8 = TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForElements(in:baseLayoutAttributesForElementsInRect:)(sub_100059734, v11, x, y, width, height);

  sub_1000596CC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v7;
  uint64_t v8;
  Class isa;
  _QWORD v11[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11[2] = self;
  v7 = self;
  v8 = TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForElements(in:baseLayoutAttributesForElementsInRect:)(sub_1000596C4, v11, x, y, width, height);

  sub_1000596CC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v9;
  double v10;
  double v11;
  uint64_t v12;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = OBJC_IVAR____TtC9Reminders35TTRIBoardColumnCollectionViewLayout_helper;
  v7 = qword_10063D8A8;
  v8 = a3;
  v9 = self;
  if (v7 != -1)
    swift_once(&qword_10063D8A8, sub_1005016B0);
  v10 = *(double *)&qword_100673A58;
  if (qword_10063D8B0 != -1)
    swift_once(&qword_10063D8B0, sub_1005016C0);
  v11 = *(double *)&qword_100673A60;
  v12 = type metadata accessor for TTRBoardColumnCollectionViewLayoutHelper(0);
  swift_allocObject(v12, 40, 7);
  *(Class *)((char *)&v9->super.super.super.isa + v6) = (Class)TTRBoardColumnCollectionViewLayoutHelper.init(topLevelItemSpacing:subtaskSpacing:)(v10, v11);

  v15.receiver = v9;
  v15.super_class = ObjectType;
  v13 = -[TTRIBoardColumnCollectionViewLayout initWithSection:](&v15, "initWithSection:", v8);

  return v13;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v12;
  double v13;
  double v14;
  uint64_t v15;
  _TtC9Reminders35TTRIBoardColumnCollectionViewLayout *v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8 = OBJC_IVAR____TtC9Reminders35TTRIBoardColumnCollectionViewLayout_helper;
  v9 = qword_10063D8A8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  if (v9 != -1)
    swift_once(&qword_10063D8A8, sub_1005016B0);
  v13 = *(double *)&qword_100673A58;
  if (qword_10063D8B0 != -1)
    swift_once(&qword_10063D8B0, sub_1005016C0);
  v14 = *(double *)&qword_100673A60;
  v15 = type metadata accessor for TTRBoardColumnCollectionViewLayoutHelper(0);
  swift_allocObject(v15, 40, 7);
  *(Class *)((char *)&v12->super.super.super.isa + v8) = (Class)TTRBoardColumnCollectionViewLayoutHelper.init(topLevelItemSpacing:subtaskSpacing:)(v13, v14);

  v18.receiver = v12;
  v18.super_class = ObjectType;
  v16 = -[TTRIBoardColumnCollectionViewLayout initWithSection:configuration:](&v18, "initWithSection:configuration:", v10, v11);

  return v16;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_1005ECA38, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_100059178((uint64_t)sub_100059744, v4);
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a3);
  v6 = swift_allocObject(&unk_1005EC9E8, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_100059338((uint64_t)sub_10005969C, v6, a4);
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_10005951C(v3, v4);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders35TTRIBoardColumnCollectionViewLayout_helper));
}

@end
