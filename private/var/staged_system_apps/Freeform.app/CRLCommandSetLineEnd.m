@implementation CRLCommandSetLineEnd

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CRLLineEnd)lineEnd
{
  return (CRLLineEnd *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                               + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_lineEnd));
}

- (int64_t)chirality
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_chirality);
}

- (_TtC8Freeform20CRLCommandSetLineEnd)initWithId:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8Freeform20CRLCommandSetLineEnd *v12;
  uint64_t v14;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a4;
  v12 = (_TtC8Freeform20CRLCommandSetLineEnd *)sub_1004D5110((uint64_t)v10, a4, a5);

  return v12;
}

- (_TtC8Freeform20CRLCommandSetLineEnd)initWithShapeItem:(id)a3 lineEnd:(id)a4 chirality:(int64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  id v15;
  id v16;
  uint64_t v17;
  Class isa;
  _TtC8Freeform20CRLCommandSetLineEnd *v19;
  uint64_t v21;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v14 = *(void (**)(uint64_t))(*(_QWORD *)v13 + 256);
  v15 = a3;
  v16 = a4;
  v17 = swift_retain(v13);
  v14(v17);
  swift_release(v13);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = -[CRLCommandSetLineEnd initWithId:lineEnd:chirality:](self, "initWithId:lineEnd:chirality:", isa, v16, a5);

  return v19;
}

- (_TtC8Freeform20CRLCommandSetLineEnd)init
{
  _TtC8Freeform20CRLCommandSetLineEnd *result;

  result = (_TtC8Freeform20CRLCommandSetLineEnd *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetLineEnd", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLCommandSetLineEnd_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
