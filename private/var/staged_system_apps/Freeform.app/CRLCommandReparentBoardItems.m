@implementation CRLCommandReparentBoardItems

- (_TtC8Freeform16CRLContainerItem)destinationContainer
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer));
}

- (NSArray)boardItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems);
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id v12;
  _TtC8Freeform28CRLCommandReparentBoardItems *v13;
  uint64_t ObjectType;
  objc_super v16;

  v7 = type metadata accessor for CRLBoardItem(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v8;
  *(_QWORD *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v11 = &v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v16.receiver = v10;
  v16.super_class = v9;
  v12 = a3;
  v13 = -[CRLCommand init](&v16, "init");
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 41, 7);
  return v13;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  id v14;
  _TtC8Freeform28CRLCommandReparentBoardItems *v15;
  uint64_t ObjectType;
  objc_super v18;

  v9 = type metadata accessor for CRLBoardItem(0);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v10;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v13 = &v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(_QWORD *)v13 = a5;
  v13[8] = 0;
  v18.receiver = v12;
  v18.super_class = v11;
  v14 = a3;
  v15 = -[CRLCommand init](&v18, "init");
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 41, 7);
  return v15;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  id v12;
  id v13;
  _TtC8Freeform28CRLCommandReparentBoardItems *v14;
  uint64_t ObjectType;
  objc_super v17;
  uint64_t v18;

  v7 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v8 = swift_allocObject(v7, 40, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100EEF400;
  *(_QWORD *)(v8 + 32) = a4;
  v18 = v8;
  specialized Array._endMutation()(v8);
  v9 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v18;
  *(_QWORD *)&v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v11 = &v10[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v17.receiver = v10;
  v17.super_class = v9;
  v12 = a3;
  v13 = a4;
  v14 = -[CRLCommand init](&v17, "init");
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 41, 7);
  return v14;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)initWithDestinationContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  id v14;
  id v15;
  _TtC8Freeform28CRLCommandReparentBoardItems *v16;
  uint64_t ObjectType;
  objc_super v19;
  uint64_t v20;

  v9 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100EEF400;
  *(_QWORD *)(v10 + 32) = a4;
  v20 = v10;
  specialized Array._endMutation()(v10);
  v11 = (objc_class *)type metadata accessor for CRLCommandReparentBoardItems();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems] = v20;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer] = a3;
  v13 = &v12[OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_index];
  *(_QWORD *)v13 = a5;
  v13[8] = 0;
  v19.receiver = v12;
  v19.super_class = v11;
  v14 = a3;
  v15 = a4;
  v16 = -[CRLCommand init](&v19, "init");
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 41, 7);
  return v16;
}

- (_TtC8Freeform28CRLCommandReparentBoardItems)init
{
  _TtC8Freeform28CRLCommandReparentBoardItems *result;

  result = (_TtC8Freeform28CRLCommandReparentBoardItems *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandReparentBoardItems", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_destinationContainer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLCommandReparentBoardItems_boardItems));
}

@end
