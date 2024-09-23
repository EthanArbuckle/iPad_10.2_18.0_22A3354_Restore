@implementation CRLCommandInsertBoardItems

- (_TtC8Freeform16CRLContainerItem)container
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_container));
}

- (NSDictionary)boardItemsByIndex
{
  Class isa;

  swift_bridgeObjectRetain(*(Class *)((char *)&self->super.super.isa
                                    + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_boardItemsByIndex));
  sub_1004B804C(&qword_1013E7860);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItemsByIndex:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC8Freeform26CRLCommandInsertBoardItems *v11;
  uint64_t ObjectType;

  v7 = sub_1004B804C(&qword_1013E7860);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for Int, v7, &protocol witness table for Int);
  v9 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v10 = a3;
  v11 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_1008E4C80(v10, v8);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 48, 7);
  return v11;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4
{
  uint64_t v7;
  uint64_t inited;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _TtC8Freeform26CRLCommandInsertBoardItems *v18;
  uint64_t ObjectType;
  uint64_t v21;
  _BYTE v22[48];

  v7 = sub_1004B804C((uint64_t *)&unk_1013F02B0);
  inited = swift_initStackObject(v7, v22);
  *(_OWORD *)(inited + 16) = xmmword_100EF5E40;
  v9 = a3;
  v10 = a4;
  *(_QWORD *)(inited + 32) = NSNotFound.getter(v10);
  v11 = inited + 32;
  v12 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v13 = swift_allocObject(v12, 40, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100EEF400;
  *(_QWORD *)(v13 + 32) = v10;
  v21 = v13;
  specialized Array._endMutation()(v13);
  *(_QWORD *)(inited + 40) = v21;
  v14 = sub_1008E00A0((_QWORD *)inited);
  swift_setDeallocating(inited);
  v15 = v10;
  v16 = sub_1004B804C((uint64_t *)&unk_101406AF0);
  swift_arrayDestroy(v11, 1, v16);
  v17 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v18 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_1008E4C80(v9, v14);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 48, 7);
  return v18;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItem:(id)a4 index:(int64_t)a5
{
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _TtC8Freeform26CRLCommandInsertBoardItems *v18;
  uint64_t ObjectType;
  uint64_t v21;
  _BYTE v22[48];

  v9 = sub_1004B804C((uint64_t *)&unk_1013F02B0);
  inited = swift_initStackObject(v9, v22);
  *(_OWORD *)(inited + 16) = xmmword_100EF5E40;
  *(_QWORD *)(inited + 32) = a5;
  v11 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  v12 = swift_allocObject(v11, 40, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100EEF400;
  *(_QWORD *)(v12 + 32) = a4;
  v21 = v12;
  specialized Array._endMutation()(v12);
  *(_QWORD *)(inited + 40) = v21;
  v13 = sub_1008E00A0((_QWORD *)inited);
  swift_setDeallocating(inited);
  v14 = a4;
  v15 = a3;
  v16 = sub_1004B804C((uint64_t *)&unk_101406AF0);
  swift_arrayDestroy(inited + 32, 1, v16);
  v17 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v18 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_1008E4C80(v15, v13);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 48, 7);
  return v18;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  id v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  _TtC8Freeform26CRLCommandInsertBoardItems *v15;
  uint64_t ObjectType;
  uint64_t v18;

  v7 = type metadata accessor for CRLBoardItem(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = sub_1004B804C((uint64_t *)&unk_1013F02B0);
  inited = swift_initStackObject(v9, &v18);
  *(_OWORD *)(inited + 16) = xmmword_100EF5E40;
  v11 = a3;
  *(_QWORD *)(inited + 32) = NSNotFound.getter(v11);
  *(_QWORD *)(inited + 40) = v8;
  v12 = sub_1008E00A0((_QWORD *)inited);
  swift_setDeallocating(inited);
  v13 = sub_1004B804C((uint64_t *)&unk_101406AF0);
  swift_arrayDestroy(inited + 32, 1, v13);
  v14 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v15 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_1008E4C80(v11, v12);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 48, 7);
  return v15;
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)initWithParentContainer:(id)a3 boardItems:(id)a4 index:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  _TtC8Freeform26CRLCommandInsertBoardItems *v17;
  uint64_t ObjectType;
  uint64_t v20;

  v9 = type metadata accessor for CRLBoardItem(0);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  v11 = sub_1004B804C((uint64_t *)&unk_1013F02B0);
  inited = swift_initStackObject(v11, &v20);
  *(_OWORD *)(inited + 16) = xmmword_100EF5E40;
  *(_QWORD *)(inited + 32) = a5;
  *(_QWORD *)(inited + 40) = v10;
  v13 = sub_1008E00A0((_QWORD *)inited);
  swift_setDeallocating(inited);
  v14 = a3;
  v15 = sub_1004B804C((uint64_t *)&unk_101406AF0);
  swift_arrayDestroy(inited + 32, 1, v15);
  v16 = objc_allocWithZone((Class)type metadata accessor for CRLCommandInsertBoardItems());
  v17 = (_TtC8Freeform26CRLCommandInsertBoardItems *)sub_1008E4C80(v14, v13);

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 48, 7);
  return v17;
}

- (NSString)actionString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_actionString];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setActionString:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_actionString);
  v6 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_actionString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC8Freeform26CRLCommandInsertBoardItems)init
{
  _TtC8Freeform26CRLCommandInsertBoardItems *result;

  result = (_TtC8Freeform26CRLCommandInsertBoardItems *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandInsertBoardItems", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_boardItemsByIndex));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform26CRLCommandInsertBoardItems_actionString]);
}

@end
