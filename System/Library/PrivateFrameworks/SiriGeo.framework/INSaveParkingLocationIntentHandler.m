@implementation INSaveParkingLocationIntentHandler

- (void)resolveParkingLocationForSaveParkingLocation:(INSaveParkingLocationIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  INSaveParkingLocationIntent *v15;
  _TtC7SiriGeo34INSaveParkingLocationIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in INSaveParkingLocationIntentHandler.resolveParkingLocation(for:);
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTATu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v14);
  swift_release();
}

- (void)handleSaveParkingLocation:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7SiriGeo34INSaveParkingLocationIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  INSaveParkingLocationIntentHandler.handle(intent:completion:)(v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> (), v7);

  swift_release();
}

- (_TtC7SiriGeo34INSaveParkingLocationIntentHandler)init
{
  uint64_t v3;
  _TtC7SiriGeo34INSaveParkingLocationIntentHandler *v4;
  _QWORD *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();
  v5 = (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion);
  *v5 = 0;
  v5[1] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for INSaveParkingLocationIntentHandler();
  return -[INSaveParkingLocationIntentHandler init](&v7, sel_init);
}

- (void).cxx_destruct
{

  outlined consume of (@escaping @callee_guaranteed (@guaranteed [EnhancedMSPSharedTripContact]) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SiriGeo34INSaveParkingLocationIntentHandler_completion));
}

@end
