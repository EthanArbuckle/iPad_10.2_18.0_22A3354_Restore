@implementation CRLBoardLibraryViewModelItemNode

- (NSArray)children
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLBoardLibraryViewModelItemNode_children);
  type metadata accessor for CRLBoardLibraryViewModelItemNode(0);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setChildren:(id)a3
{
  uint64_t v5;

  v5 = type metadata accessor for CRLBoardLibraryViewModelItemNode(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLBoardLibraryViewModelItemNode_children) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_bridgeObjectRelease();
}

- (BOOL)isLeaf
{
  _TtC8Freeform32CRLBoardLibraryViewModelItemNode *v2;
  char v3;

  v2 = self;
  v3 = sub_1007C267C();

  return v3 & 1;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform32CRLBoardLibraryViewModelItemNode *v5;
  uint64_t v6;
  _TtC8Freeform32CRLBoardLibraryViewModelItemNode *v7;
  char v8;
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
  v8 = sub_1007C338C((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8 & 1;
}

- (_TtC8Freeform32CRLBoardLibraryViewModelItemNode)init
{
  _TtC8Freeform32CRLBoardLibraryViewModelItemNode *result;

  result = (_TtC8Freeform32CRLBoardLibraryViewModelItemNode *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardLibraryViewModelItemNode", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLBoardLibraryViewModelItemNode_item, type metadata accessor for CRLBoardLibraryViewModel.Item);
  swift_bridgeObjectRelease();
}

@end
