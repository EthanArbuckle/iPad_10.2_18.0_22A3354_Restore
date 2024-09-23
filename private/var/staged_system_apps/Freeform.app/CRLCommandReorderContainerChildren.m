@implementation CRLCommandReorderContainerChildren

- (_TtC8Freeform16CRLContainerItem)container
{
  return (_TtC8Freeform16CRLContainerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                    + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_container));
}

- (NSArray)children
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_children);
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSIndexSet)indices
{
  id v2;

  IndexSet._bridgeToObjectiveC()((NSIndexSet *)OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_indices);
  return (NSIndexSet *)v2;
}

- (_TtC8Freeform34CRLCommandReorderContainerChildren)initWithParentContainer:(id)a3 childrenToMove:(id)a4 targetIndices:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC8Freeform34CRLCommandReorderContainerChildren *v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexSet(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CRLBoardItem(0);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = (_TtC8Freeform34CRLCommandReorderContainerChildren *)sub_10060E6FC(v13, v12, (uint64_t)v10);

  return v14;
}

- (NSString)actionString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_actionString];
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_actionString);
  v6 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_actionString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC8Freeform34CRLCommandReorderContainerChildren)init
{
  _TtC8Freeform34CRLCommandReorderContainerChildren *result;

  result = (_TtC8Freeform34CRLCommandReorderContainerChildren *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandReorderContainerChildren", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_container));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_children));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_indices;
  v4 = type metadata accessor for IndexSet(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform34CRLCommandReorderContainerChildren_actionString]);
}

@end
