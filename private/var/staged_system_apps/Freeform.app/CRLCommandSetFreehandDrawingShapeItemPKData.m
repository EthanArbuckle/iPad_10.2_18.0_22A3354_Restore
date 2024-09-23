@implementation CRLCommandSetFreehandDrawingShapeItemPKData

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithId:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v13;
  uint64_t v15;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = a5;
  v13 = (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *)sub_1004C1E38((uint64_t)v10, a4, a5);

  return v13;
}

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)initWithFreehandDrawingShapeItem:(id)a3 strokePathCompactData:(id)a4 maskPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  Class isa;
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *v20;
  uint64_t v22;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v14 = *(void (**)(uint64_t))(*(_QWORD *)v13 + 256);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = swift_retain(v13);
  v14(v18);
  swift_release(v13);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = -[CRLCommandSetFreehandDrawingShapeItemPKData initWithId:strokePathCompactData:maskPath:](self, "initWithId:strokePathCompactData:maskPath:", isa, v16, v17);

  return v20;
}

- (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData)init
{
  _TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *result;

  result = (_TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetFreehandDrawingShapeItemPKData", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_strokePathCompactData));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLCommandSetFreehandDrawingShapeItemPKData_maskPath));
}

@end
