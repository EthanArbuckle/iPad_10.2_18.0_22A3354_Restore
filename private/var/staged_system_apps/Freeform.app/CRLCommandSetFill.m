@implementation CRLCommandSetFill

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CRLFill)fill
{
  return (CRLFill *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_fill));
}

- (_TtC8Freeform17CRLCommandSetFill)initWithId:(id)a3 fill:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform17CRLCommandSetFill *v10;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a4;
  v10 = (_TtC8Freeform17CRLCommandSetFill *)sub_100D6DE20((uint64_t)v8, a4);

  return v10;
}

- (_TtC8Freeform17CRLCommandSetFill)initWithShapeItem:(id)a3 fill:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(__n128);
  id v13;
  id v14;
  __n128 v15;
  Class isa;
  _TtC8Freeform17CRLCommandSetFill *v17;
  uint64_t v19;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v12 = *(void (**)(__n128))(*(_QWORD *)v11 + 256);
  v13 = a3;
  v14 = a4;
  v15 = swift_retain(v11);
  v12(v15);
  swift_release(v11);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17 = -[CRLCommandSetFill initWithId:fill:](self, "initWithId:fill:", isa, v14);

  return v17;
}

- (NSString)actionString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_actionString];
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_actionString);
  v6 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_actionString];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (_TtC8Freeform17CRLCommandSetFill)init
{
  _TtC8Freeform17CRLCommandSetFill *result;

  result = (_TtC8Freeform17CRLCommandSetFill *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetFill", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform17CRLCommandSetFill_actionString]);
}

@end
