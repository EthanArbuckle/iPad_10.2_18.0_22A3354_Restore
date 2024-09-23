@implementation SMTapToRadarManagerInternal

+ (void)fileRadarWithError:(NSError *)a3 conversationIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSError *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254415868);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_24558F8A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_257485048;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_257485050;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_24553CC8C((uint64_t)v11, (uint64_t)&unk_257485058, (uint64_t)v16);
  swift_release();
}

+ (void)fileRadarWithTitle:(NSString *)a3 description:(NSString *)a4 conversationIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254415868);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  v16 = sub_24558F8A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_257485008;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_257485018;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_24553CC8C((uint64_t)v13, (uint64_t)&unk_257485028, (uint64_t)v18);
  swift_release();
}

- (_TtC13SafetyMonitor27SMTapToRadarManagerInternal)init
{
  _TtC13SafetyMonitor27SMTapToRadarManagerInternal *result;

  result = (_TtC13SafetyMonitor27SMTapToRadarManagerInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13SafetyMonitor27SMTapToRadarManagerInternal_urlComponents;
  v3 = sub_24558F464();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
