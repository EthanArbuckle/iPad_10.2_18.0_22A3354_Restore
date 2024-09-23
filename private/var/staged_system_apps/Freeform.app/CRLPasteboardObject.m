@implementation CRLPasteboardObject

- (_TtC8Freeform19CRLPasteboardObject)initWithContext:(id)a3
{
  uint64_t ObjectType;
  _TtC8Freeform19CRLPasteboardObject *v6;

  ObjectType = swift_getObjectType(self);
  v6 = (_TtC8Freeform19CRLPasteboardObject *)sub_1006A1DD0((uint64_t)a3, 0x1000000000000, 0x2000400000000, 0x1000000000000);
  swift_deallocPartialClassInstance(self, ObjectType, 32, 7);
  return v6;
}

- (BOOL)isSmartCopyPaste
{
  return (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData))[OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_isSmartCopyPaste];
}

- (void)setIsSmartCopyPaste:(BOOL)a3
{
  (*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData))[OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_isSmartCopyPaste] = a3;
}

- (NSArray)boardItems
{
  uint64_t v2;
  double *v3;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject__boardItems);
  if (v2)
    v3 = *(double **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject__boardItems);
  else
    v3 = _swiftEmptyArrayStorage;
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setBoardItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform19CRLPasteboardObject *v7;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_10069D2B8(v6);

}

- (void)copyTextFrom:(id)a3
{
  id v4;
  _TtC8Freeform19CRLPasteboardObject *v5;

  v4 = a3;
  v5 = self;
  sub_10069DB14((uint64_t)v4);

}

- (id)makeTextboxFromCopiedTextWith:(id)a3
{
  id v4;
  _TtC8Freeform19CRLPasteboardObject *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_10069DF00((uint64_t)v4);

  return v6;
}

- (BOOL)hasNativeText
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_1004B804C((uint64_t *)&unk_1013F1500);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData)
     + OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_textCRDT;
  swift_beginAccess(v6, v10, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1013F1500);
  v7 = type metadata accessor for CRLWPStorageCRDTData(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_1004CB800((uint64_t)v5, (uint64_t *)&unk_1013F1500);
  return (char)v6;
}

- (_TtC8Freeform19CRLPasteboardObject)init
{
  _TtC8Freeform19CRLPasteboardObject *result;

  result = (_TtC8Freeform19CRLPasteboardObject *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardObject", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject__boardItems));
}

- (NSString)description
{
  _TtC8Freeform19CRLPasteboardObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1006A05F8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end
