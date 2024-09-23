@implementation CRLCommandSetAccessibilityDescription

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSString)accessibilityDescription
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_accessibilityDescription];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithId:(id)a3 accessibilityDescription:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  objc_class *v17;
  _TtC8Freeform37CRLCommandSetAccessibilityDescription *v18;
  objc_super v20;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v15 = v14;
  (*(void (**)(char *, char *, uint64_t, __n128))(v8 + 16))((char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_id, v10, v7, v11);
  v16 = (Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_accessibilityDescription);
  *v16 = v13;
  v16[1] = v15;
  v17 = (objc_class *)type metadata accessor for CRLCommandSetAccessibilityDescription(0);
  v20.receiver = self;
  v20.super_class = v17;
  v18 = -[CRLCommand init](&v20, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v18;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)initWithBoardItem:(id)a3 accessibilityDescription:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);
  id v14;
  Class isa;
  NSString v16;
  _TtC8Freeform37CRLCommandSetAccessibilityDescription *v17;
  uint64_t v19;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = *(void (**)(void))((swift_isaMask & *(_QWORD *)a3) + 0x88);
  v14 = a3;
  v13();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  v17 = -[CRLCommandSetAccessibilityDescription initWithId:accessibilityDescription:](self, "initWithId:accessibilityDescription:", isa, v16);

  return v17;
}

- (_TtC8Freeform37CRLCommandSetAccessibilityDescription)init
{
  _TtC8Freeform37CRLCommandSetAccessibilityDescription *result;

  result = (_TtC8Freeform37CRLCommandSetAccessibilityDescription *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetAccessibilityDescription", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform37CRLCommandSetAccessibilityDescription_accessibilityDescription]);
}

@end
