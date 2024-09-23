@implementation CRLCommandSetStroke

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CRLStroke)stroke
{
  return (CRLStroke *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                              + OBJC_IVAR____TtC8Freeform19CRLCommandSetStroke_stroke));
}

- (_TtC8Freeform19CRLCommandSetStroke)initWithId:(id)a3 stroke:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform19CRLCommandSetStroke *v10;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a4;
  v10 = (_TtC8Freeform19CRLCommandSetStroke *)sub_100D42514((uint64_t)v8, a4);

  return v10;
}

- (_TtC8Freeform19CRLCommandSetStroke)initWithStyledItem:(id)a3 stroke:(id)a4
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
  _TtC8Freeform19CRLCommandSetStroke *v17;
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
  v17 = -[CRLCommandSetStroke initWithId:stroke:](self, "initWithId:stroke:", isa, v14);

  return v17;
}

- (_TtC8Freeform19CRLCommandSetStroke)init
{
  _TtC8Freeform19CRLCommandSetStroke *result;

  result = (_TtC8Freeform19CRLCommandSetStroke *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetStroke", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLCommandSetStroke_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
