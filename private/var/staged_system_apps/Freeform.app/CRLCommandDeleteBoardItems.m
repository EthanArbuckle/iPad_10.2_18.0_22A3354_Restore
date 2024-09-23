@implementation CRLCommandDeleteBoardItems

- (NSSet)boardItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_boardItems);
  type metadata accessor for CRLBoardItem(0);
  sub_10058528C();
  swift_bridgeObjectRetain(v2);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (BOOL)canDeleteNewlyCreatedItems
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_canDeleteNewlyCreatedItems);
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  Class isa;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v8;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = sub_10058528C();
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  isa = Set._bridgeToObjectiveC()().super.isa;
  v8 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:](self, "initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:", isa, 0, swift_bridgeObjectRelease().n128_f64[0]);

  return v8;
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemsToDelete:(id)a3 canDeleteNewlyCreatedItems:(BOOL)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for CRLBoardItem(0);
  v7 = sub_10058528C();
  v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v6, v7);
  return (_TtC8Freeform26CRLCommandDeleteBoardItems *)sub_1007C0DE8(v8, a4);
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)initWithBoardItemToDelete:(id)a3
{
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  Class isa;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v13;
  uint64_t v15;
  _BYTE v16[40];

  v5 = sub_1004B804C((uint64_t *)&unk_1013E4180);
  inited = swift_initStackObject(v5, v16);
  *(_OWORD *)(inited + 16) = xmmword_100EEF400;
  *(_QWORD *)(inited + 32) = a3;
  v15 = inited;
  specialized Array._endMutation()(inited);
  if ((unint64_t)v15 >> 62)
  {
    if (v15 < 0)
      v9 = v15;
    else
      v9 = v15 & 0xFFFFFFFFFFFFFF8;
    v10 = a3;
    swift_bridgeObjectRetain(v15);
    v11 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease();
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = a3;
    if (v7)
LABEL_3:
      sub_1004B5FB0(v15);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for CRLBoardItem(0);
  sub_10058528C();
  isa = Set._bridgeToObjectiveC()().super.isa;
  v13 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:](self, "initWithBoardItemsToDelete:", isa, swift_bridgeObjectRelease().n128_f64[0]);

  return v13;
}

- (NSString)actionString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_actionString];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC8Freeform26CRLCommandDeleteBoardItems)init
{
  _TtC8Freeform26CRLCommandDeleteBoardItems *result;

  result = (_TtC8Freeform26CRLCommandDeleteBoardItems *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandDeleteBoardItems", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_boardItems));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform26CRLCommandDeleteBoardItems_actionString]);
}

@end
