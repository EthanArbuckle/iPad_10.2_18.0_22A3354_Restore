@implementation CRLGroupSelection

- (BOOL)hasSelectedItemsInNonGroupContainer
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer);
}

- (_TtC8Freeform17CRLGroupSelection)initWithGroupItem:(id)a3
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _TtC8Freeform17CRLGroupSelection *v13;
  uint64_t v15;
  _BYTE v16[40];

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer) = 0;
  v4 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  inited = swift_initStackObject(v4, v16);
  *(_OWORD *)(inited + 16) = xmmword_100EEF400;
  *(_QWORD *)(inited + 32) = a3;
  v15 = inited;
  specialized Array._endMutation()(inited);
  if ((unint64_t)v15 >> 62)
  {
    if (v15 < 0)
      v10 = v15;
    else
      v10 = v15 & 0xFFFFFFFFFFFFFF8;
    v11 = a3;
    swift_bridgeObjectRetain(v15);
    v12 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_3;
LABEL_8:
    v9 = &_swiftEmptySetSingleton;
    goto LABEL_9;
  }
  v6 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = a3;
  if (!v6)
    goto LABEL_8;
LABEL_3:
  sub_1004B5FB0(v15);
  v9 = v8;
LABEL_9:
  swift_bridgeObjectRelease();
  v13 = (_TtC8Freeform17CRLGroupSelection *)sub_100502168((uint64_t)v9);

  return v13;
}

- (_TtC8Freeform17CRLGroupSelection)initWithContainerGroups:(id)a3 hasSelectedItemsInNonGroupContainer:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = type metadata accessor for CRLGroupItem(0);
  v8 = sub_1005034A0(&qword_1013F48C8, 255, type metadata accessor for CRLGroupItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer) = a4;
  sub_100DC0998(v9);
  v11 = v10;
  swift_bridgeObjectRelease();
  return (_TtC8Freeform17CRLGroupSelection *)sub_100502168(v11);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform17CRLGroupSelection *v5;
  uint64_t v6;
  _TtC8Freeform17CRLGroupSelection *v7;
  unsigned __int8 v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1007FB480((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8 & 1;
}

- (NSArray)containerGroups
{
  _TtC8Freeform17CRLGroupSelection *v2;
  Class isa;

  v2 = self;
  sub_1007FB6B4();

  type metadata accessor for CRLGroupItem(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)isCrossContainerSelection
{
  _TtC8Freeform17CRLGroupSelection *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = self;
  v3 = (uint64_t)sub_1007FB6B4();
  if ((unint64_t)v3 >> 62)
  {
    if (v3 >= 0)
      v3 &= 0xFFFFFFFFFFFFFF8uLL;
    v4 = _CocoaArrayWrapper.endIndex.getter(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v4 <= 1)
    v5 = *((_BYTE *)&v2->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform17CRLGroupSelection_hasSelectedItemsInNonGroupContainer);
  else
    v5 = 1;

  return v5;
}

- (NSString)description
{
  _TtC8Freeform17CRLGroupSelection *v2;
  NSString v3;

  v2 = self;
  sub_1007FB9E8();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8Freeform17CRLGroupSelection)initWithBoardItems:(id)a3
{
  _TtC8Freeform17CRLGroupSelection *result;

  result = (_TtC8Freeform17CRLGroupSelection *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLGroupSelection", 26, "init(_:)", 8, 0);
  __break(1u);
  return result;
}

@end
