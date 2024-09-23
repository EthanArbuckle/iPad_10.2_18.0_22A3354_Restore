@implementation SCMLVisualGenerationHandling

- (id)initOnBehalfOf:(int64_t)a3 modelManagerServicesUseCaseID:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_245C8ED10();
  return SCMLVisualGenerationHandling.init(onBehalfOf:modelManagerServicesUseCaseID:)(a3, v6, v7);
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
  _TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling *v16;
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
  v13[4] = &unk_257515190;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_257515198;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_245C37D14((uint64_t)v9, (uint64_t)&unk_2575151A0, (uint64_t)v14);
  swift_release();
}

- (_TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling)init
{
  _TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling *result;

  result = (_TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML28SCMLVisualGenerationHandling_logger;
  v4 = sub_245C8EBE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
