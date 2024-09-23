@implementation CRLPasteboardObjectWriteAssistant

- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)initWithPasteboard:(id)a3 store:(id)a4 context:(id)a5
{
  objc_class *ObjectType;
  id v10;
  id v11;
  id v12;
  _TtC8Freeform33CRLPasteboardObjectWriteAssistant *v13;
  uint64_t v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (_TtC8Freeform33CRLPasteboardObjectWriteAssistant *)sub_1009F38C4((uint64_t)v10, (uint64_t)objc_msgSend(v10, "pasteboardItemMaxSize"), v11, v12, (char *)objc_allocWithZone(ObjectType));

  v14 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v14, 88, 7);
  return v13;
}

- (void)writePasteboardObject:(_TtC8Freeform19CRLPasteboardObject *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC8Freeform19CRLPasteboardObject *v15;
  _TtC8Freeform33CRLPasteboardObjectWriteAssistant *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1012902B0, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1012902D8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1014012A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101290300, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10140B7B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100C46C50((uint64_t)v9, (uint64_t)&unk_101405D50, (uint64_t)v14);
  swift_release(v17);
}

- (_TtC8Freeform33CRLPasteboardObjectWriteAssistant)init
{
  _TtC8Freeform33CRLPasteboardObjectWriteAssistant *result;

  result = (_TtC8Freeform33CRLPasteboardObjectWriteAssistant *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardObjectWriteAssistant", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.isa
                                                        + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_pasteboardDataManaging));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_metadataWriteChannel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLPasteboardObjectWriteAssistant_objectsWriteChannel));
}

@end
