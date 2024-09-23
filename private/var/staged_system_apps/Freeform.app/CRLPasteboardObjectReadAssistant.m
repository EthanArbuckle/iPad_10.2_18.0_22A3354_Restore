@implementation CRLPasteboardObjectReadAssistant

- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject
{
  return (_TtC8Freeform19CRLPasteboardObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject));
}

- (void)setPasteboardObject:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject) = (Class)a3;
  v3 = a3;

}

+ (id)contentDescriptionFrom:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSDictionary v9;

  v4 = (void *)objc_opt_self(CRLPasteboardObjectReadAssistantHelper);
  v5 = a3;
  v6 = objc_msgSend(v4, "contentDescriptionFromPasteboard:", v5);
  if (v6)
  {
    v7 = v6;
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

    v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {

    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5
{
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *v6;
  uint64_t ObjectType;

  v6 = (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)sub_1006E2408((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 7);
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 80, 7);
  return v6;
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)initWithPasteboardNativeDataProvider:(id)a3 store:(id)a4 context:(id)a5
{
  return (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)sub_1006E198C(a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)readPasteboardObjectWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_101278BD0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_101278BF8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013EDA40;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_101278C20, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC8Freeform32CRLPasteboardObjectReadAssistant)init
{
  _TtC8Freeform32CRLPasteboardObjectReadAssistant *result;

  result = (_TtC8Freeform32CRLPasteboardObjectReadAssistant *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardObjectReadAssistant", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_channelProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLPasteboardObjectReadAssistant_pasteboardObject));
}

@end
