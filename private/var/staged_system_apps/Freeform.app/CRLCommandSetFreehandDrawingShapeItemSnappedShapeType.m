@implementation CRLCommandSetFreehandDrawingShapeItemSnappedShapeType

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithId:(id)a3 snappedShapeType:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v12;
  objc_super v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_id, v10, v7);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_snappedShapeType) = (Class)a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetFreehandDrawingShapeItemSnappedShapeType(0);
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[CRLCommand init](&v14, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)initWithFreehandDrawingShapeItem:(id)a3 snappedShapeType:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  Class isa;
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *v16;
  uint64_t v18;

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
  v16 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithId:snappedShapeType:](self, "initWithId:snappedShapeType:", isa, a4);

  return v16;
}

- (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType)init
{
  _TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *result;

  result = (_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetFreehandDrawingShapeItemSnappedShapeType", 62, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType_id;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
