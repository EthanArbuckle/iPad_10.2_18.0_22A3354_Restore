@implementation CRLPasteboardObjectItemProviderReadAssistant

- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)initWithStore:(id)a3 context:(id)a4
{
  objc_class *ObjectType;
  char *v8;
  uint64_t Assistant;
  _QWORD *v10;
  id v11;
  id v12;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v13;
  uint64_t v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v8 = (char *)objc_allocWithZone(ObjectType);
  Assistant = type metadata accessor for CRLItemProviderReadAssistant();
  v10 = (_QWORD *)swift_allocObject(Assistant, 40, 7);
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = 7;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant_readAssistant] = v10;
  v16.receiver = v8;
  v16.super_class = ObjectType;
  v11 = a3;
  v12 = a4;
  v13 = -[CRLPasteboardObjectItemProviderReadAssistant init](&v16, "init");
  v14 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v14, 16, 7);
  return v13;
}

- (id)readPasteboardObjectFrom:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v9;
  id v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_101283128, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_100874C14(v8, (uint64_t)sub_100874FF8, v7);

  swift_release(v7);
  return v10;
}

- (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant)init
{
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *result;

  result = (_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLPasteboardObjectItemProviderReadAssistant", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant_readAssistant));
}

@end
