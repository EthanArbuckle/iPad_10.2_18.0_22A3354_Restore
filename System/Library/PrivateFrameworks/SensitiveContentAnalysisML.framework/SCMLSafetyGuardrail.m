@implementation SCMLSafetyGuardrail

- (NSString)bundleID
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_245C8ED04();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)initWithBackend:(unint64_t)a3 onBehalfOf:(int64_t)a4 modelManagerServicesUseCaseID:(id)a5 lowerCasePrompt:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  uint64_t v10;
  char *v11;

  v7 = a6;
  v10 = sub_245C8ED10();
  return (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *)SCMLSafetyGuardrail.init(backend:onBehalfOf:modelManagerServicesUseCaseID:lowerCasePrompt:)(a3, a4, v10, v11, v7);
}

- (void)predictWithText:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257514DB0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_245C8EE48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_257514DC0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_257514DD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_245C37D14((uint64_t)v9, (uint64_t)&unk_257514DE0, (uint64_t)v14);
  swift_release();
}

+ (id)normalizeText:(id)a3 locale:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = sub_245C8E92C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245C8ED10();
  v11 = v10;
  sub_245C8E920();
  sub_245C3A07C(v9, v11, (uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  v12 = (void *)sub_245C8ED04();
  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)init
{
  _TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *result;

  result = (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail_systemPrompt;
  v4 = sub_245C8ECB0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail_logger;
  v6 = sub_245C8EBE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
