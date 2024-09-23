@implementation CRLCommandSetInfoGeometry

- (_TtC8Freeform25CRLCommandSetInfoGeometry)initWithId:(id)a3 geometry:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v10;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a4;
  v10 = (_TtC8Freeform25CRLCommandSetInfoGeometry *)sub_100BF5270((uint64_t)v8, v9);

  return v10;
}

- (_TtC8Freeform25CRLCommandSetInfoGeometry)initWithBoardItem:(id)a3 geometry:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(void);
  id v12;
  id v13;
  Class isa;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v15;
  uint64_t v17;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(void))((swift_isaMask & *(_QWORD *)a3) + 0x88);
  v12 = a3;
  v13 = a4;
  v11();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v15 = -[CRLCommandSetInfoGeometry initWithId:geometry:](self, "initWithId:geometry:", isa, v13);

  return v15;
}

- (_TtC8Freeform25CRLCommandSetInfoGeometry)init
{
  _TtC8Freeform25CRLCommandSetInfoGeometry *result;

  result = (_TtC8Freeform25CRLCommandSetInfoGeometry *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetInfoGeometry", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLCommandSetInfoGeometry_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
