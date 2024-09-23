@implementation CRLCommandFreehandDrawingProhibitClustering

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (BOOL)prohibitsClustering
{
  return *((_BYTE *)&self->super.super.isa
         + OBJC_IVAR____TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering_prohibitsClustering);
}

- (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering)initWithId:(id)a3 prohibitsClustering:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *v12;
  objc_super v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR____TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering_id, v10, v7);
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering_prohibitsClustering) = a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandFreehandDrawingProhibitClustering(0);
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[CRLCommand init](&v14, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

- (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering)initWithFreehandDrawingItem:(id)a3 prohibitsClustering:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  Class isa;
  _TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *v16;
  uint64_t v18;

  v4 = a4;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v12 = *(void (**)(uint64_t))(*(_QWORD *)v11 + 256);
  v13 = a3;
  v14 = swift_retain(v11);
  v12(v14);
  swift_release(v11);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v16 = -[CRLCommandFreehandDrawingProhibitClustering initWithId:prohibitsClustering:](self, "initWithId:prohibitsClustering:", isa, v4);

  return v16;
}

- (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering)init
{
  _TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *result;

  result = (_TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandFreehandDrawingProhibitClustering", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform43CRLCommandFreehandDrawingProhibitClustering_id;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
