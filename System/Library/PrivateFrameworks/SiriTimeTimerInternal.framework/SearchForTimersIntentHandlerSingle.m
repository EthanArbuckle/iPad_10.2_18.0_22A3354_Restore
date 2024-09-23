@implementation SearchForTimersIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle)init
{
  objc_class *v2;
  id v3;
  _TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  v2 = (objc_class *)type metadata accessor for SearchForTimersIntentHandlerSingle();
  v3 = objc_allocWithZone(v2);
  sub_24739E418((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = v2;
  swift_retain();
  v4 = -[SearchForTimersIntentHandlerSingle init](&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)confirmSearchTimer:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  _TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle *v9;
  char *v10;
  char *v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone((Class)type metadata accessor for SearchTimerIntentResponse());
  v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___SearchTimerIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v11 = 4;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)resolveAssociatedDeviceTargetForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  SearchTimerIntent *v16;
  _TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25769CD00);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_2473EE578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25769CD30;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25769CD38;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2473E3DAC((uint64_t)v10, (uint64_t)&unk_25769CD40, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForSearchTimer:(SearchTimerIntent *)a3 withCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  SearchTimerIntent *v16;
  _TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle *v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25769CD00);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  v13 = sub_2473EE578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25769CD10;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25769CD18;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2473E3DAC((uint64_t)v10, (uint64_t)&unk_25769CD20, (uint64_t)v15);
  swift_release();
}

- (void)handleSearchTimer:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_2473AE834(v8, (uint64_t)sub_2473AF5EC, v7);

  swift_release();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeTimerInternal34SearchForTimersIntentHandlerSingle_siriTimerManager);
}

@end
