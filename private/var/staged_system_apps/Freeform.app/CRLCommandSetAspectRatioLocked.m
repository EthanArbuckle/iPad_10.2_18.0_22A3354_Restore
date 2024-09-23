@implementation CRLCommandSetAspectRatioLocked

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (BOOL)aspectRatioLocked
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform30CRLCommandSetAspectRatioLocked_aspectRatioLocked);
}

- (_TtC8Freeform30CRLCommandSetAspectRatioLocked)initWithId:(id)a3 aspectRatioLocked:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  _TtC8Freeform30CRLCommandSetAspectRatioLocked *v12;
  objc_super v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR____TtC8Freeform30CRLCommandSetAspectRatioLocked_id, v10, v7);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform30CRLCommandSetAspectRatioLocked_aspectRatioLocked) = a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetAspectRatioLocked(0);
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[CRLCommand init](&v14, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

- (_TtC8Freeform30CRLCommandSetAspectRatioLocked)initWithBoardItem:(id)a3 aspectRatioLocked:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(void);
  id v12;
  Class isa;
  _TtC8Freeform30CRLCommandSetAspectRatioLocked *v14;
  uint64_t v16;

  v4 = a4;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(void))((swift_isaMask & *(_QWORD *)a3) + 0x88);
  v12 = a3;
  v11();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = -[CRLCommandSetAspectRatioLocked initWithId:aspectRatioLocked:](self, "initWithId:aspectRatioLocked:", isa, v4);

  return v14;
}

- (_TtC8Freeform30CRLCommandSetAspectRatioLocked)init
{
  _TtC8Freeform30CRLCommandSetAspectRatioLocked *result;

  result = (_TtC8Freeform30CRLCommandSetAspectRatioLocked *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetAspectRatioLocked", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform30CRLCommandSetAspectRatioLocked_id;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
