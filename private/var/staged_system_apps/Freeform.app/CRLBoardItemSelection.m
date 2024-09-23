@implementation CRLBoardItemSelection

- (NSSet)boardItems
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems);
  type metadata accessor for CRLBoardItem(0);
  sub_1005034A0((unint64_t *)&qword_1013E4190, 255, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  swift_bridgeObjectRetain(v2);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSSet *)isa;
}

- (void)setBoardItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = sub_1005034A0((unint64_t *)&qword_1013E4190, 255, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v7 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  v8 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems) = v7;
  swift_bridgeObjectRelease(v8);
}

- (_TtC8Freeform21CRLBoardItemSelection)initWithBoardItems:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for CRLBoardItem(0);
  v5 = sub_1005034A0((unint64_t *)&qword_1013E4190, 255, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v4, v5);
  return (_TtC8Freeform21CRLBoardItemSelection *)sub_100502168(v6);
}

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform21CRLBoardItemSelection *v5;
  uint64_t v6;
  _TtC8Freeform21CRLBoardItemSelection *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_10050239C((uint64_t)v10);

  sub_1004D28EC((uint64_t)v10);
  return v8 & 1;
}

- (int64_t)hash
{
  _TtC8Freeform21CRLBoardItemSelection *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_100502528();

  return v3;
}

- (int64_t)itemCount
{
  uint64_t v2;
  uint64_t v3;
  _TtC8Freeform21CRLBoardItemSelection *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems);
  if ((v2 & 0xC000000000000001) == 0)
    return *(_QWORD *)(v2 + 16);
  if (v2 < 0)
    v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems);
  else
    v3 = v2 & 0xFFFFFFFFFFFFFF8;
  v4 = self;
  swift_bridgeObjectRetain(v2);
  v5 = __CocoaSet.count.getter(v3);

  swift_bridgeObjectRelease(v2);
  return v5;
}

- (id)infosOfClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  _TtC8Freeform21CRLBoardItemSelection *v5;
  Swift::Int v6;
  Class isa;

  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  v5 = self;
  v6 = sub_1005028D4(ObjCClassMetadata);

  type metadata accessor for CRLBoardItem(0);
  sub_1005034A0((unint64_t *)&qword_1013E4190, 255, type metadata accessor for CRLBoardItem, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (BOOL)containsKindOfClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  _TtC8Freeform21CRLBoardItemSelection *v5;
  char v6;

  ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  v5 = self;
  sub_100502B84(ObjCClassMetadata);
  LOBYTE(ObjCClassMetadata) = v6;

  return ObjCClassMetadata & 1;
}

- (NSString)description
{
  _TtC8Freeform21CRLBoardItemSelection *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100502EF0();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC8Freeform21CRLBoardItemSelection)init
{
  _TtC8Freeform21CRLBoardItemSelection *result;

  result = (_TtC8Freeform21CRLBoardItemSelection *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardItemSelection", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC8Freeform21CRLBoardItemSelection_boardItems));
}

@end
