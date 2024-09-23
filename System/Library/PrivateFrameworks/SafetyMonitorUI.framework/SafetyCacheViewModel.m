@implementation SafetyCacheViewModel

- (void)dealloc
{
  _TtC15SafetyMonitorUI20SafetyCacheViewModel *v2;

  v2 = self;
  SafetyCacheViewModel.__deallocating_deinit();
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
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel_sessionID;
  v4 = sub_2456F9544();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_2455C6604(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel_containerVCHandler));
  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__safetyCache;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257489C28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__phoneCache;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748B0F8);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__watchCache, v8);
  v10 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__cacheExpiryDate;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748B118);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__cacheReleaseDate, v11);
  v13 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__receiverSessionStatus;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748B140);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

- (_TtC15SafetyMonitorUI20SafetyCacheViewModel)init
{
  _TtC15SafetyMonitorUI20SafetyCacheViewModel *result;

  result = (_TtC15SafetyMonitorUI20SafetyCacheViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
