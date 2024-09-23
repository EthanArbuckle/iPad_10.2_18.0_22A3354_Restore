@implementation SafetyCacheDetailViewModel

- (_TtC15SafetyMonitorUI26SafetyCacheDetailViewModel)init
{
  _TtC15SafetyMonitorUI26SafetyCacheDetailViewModel *result;

  result = (_TtC15SafetyMonitorUI26SafetyCacheDetailViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__safetyCache;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257489C28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__navigationPath;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748E070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__startLocationInfoViewModel;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748E078);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__destinationInfoViewModel, v8);
  v10 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__sessionStartTime;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748B118);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__sessionEndTime, v11);
  sub_2455C6BC0((uint64_t)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel_callFunctionProvider, &qword_257489C30);

  swift_bridgeObjectRelease();
}

@end
