@implementation CRLWPReplaceTextCommand

- (_TtC8Freeform14CRLWPShapeItem)shapeItem
{
  return (_TtC8Freeform14CRLWPShapeItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                  + OBJC_IVAR____TtC8Freeform23CRLWPReplaceTextCommand_shapeItem));
}

- (_TtC8Freeform23CRLWPReplaceTextCommand)initWithShapeItem:(id)a3 range:(_NSRange)a4 text:(id)a5
{
  NSUInteger length;
  _TtC8Freeform23CRLWPReplaceTextCommand *location;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _TtC8Freeform23CRLWPReplaceTextCommand *result;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _TtC8Freeform23CRLWPReplaceTextCommand *v26;
  uint64_t ObjectType;
  uint64_t v28;

  length = a4.length;
  location = (_TtC8Freeform23CRLWPReplaceTextCommand *)a4.location;
  v10 = sub_1004B804C((uint64_t *)&unk_1013F3DC0);
  __chkstk_darwin(v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1004B804C((uint64_t *)&unk_1013EFCF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v18 = v17;
  v19 = a3;
  result = (_TtC8Freeform23CRLWPReplaceTextCommand *)NSNotFound.getter(v19);
  if (location == result)
  {
    __break(1u);
  }
  else
  {
    v21 = __OFADD__(location, length);
    v22 = (uint64_t)location + length;
    if (!v21)
    {
      v23 = sub_1004B804C((uint64_t *)&unk_1013EFC60);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
      v24 = sub_1004B804C(&qword_1013F3D40);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v12, 1, 1, v24);
      v25 = objc_allocWithZone((Class)type metadata accessor for CRLWPReplaceTextCommand(0));
      v26 = (_TtC8Freeform23CRLWPReplaceTextCommand *)sub_1006BEFE0((uint64_t)v19, (uint64_t)location, v22, v16, v18, 0, (uint64_t)v15, (uint64_t)v12);
      ObjectType = swift_getObjectType(self);
      swift_deallocPartialClassInstance(self, ObjectType, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.isa) + 0x34));
      return v26;
    }
  }
  __break(1u);
  return result;
}

- (BOOL)canCoalesce
{
  return 1;
}

- (BOOL)wantsToCoalesceWith:(id)a3
{
  id v4;
  _TtC8Freeform23CRLWPReplaceTextCommand *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1006C0A40((uint64_t)v4);

  return self & 1;
}

- (NSString)actionString
{
  void *v3;
  _TtC8Freeform23CRLWPReplaceTextCommand *v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (_TtC8Freeform23CRLWPReplaceTextCommand)init
{
  _TtC8Freeform23CRLWPReplaceTextCommand *result;

  result = (_TtC8Freeform23CRLWPReplaceTextCommand *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLWPReplaceTextCommand", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform23CRLWPReplaceTextCommand_coalescingData, &qword_1013EC7F0);

  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform23CRLWPReplaceTextCommand_replacement, &qword_1013EC7E8);
}

@end
