@implementation CreateTimerIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle)init
{
  objc_class *TimerIntentHandlerSingle;
  id v3;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  TimerIntentHandlerSingle = (objc_class *)type metadata accessor for CreateTimerIntentHandlerSingle();
  v3 = objc_allocWithZone(TimerIntentHandlerSingle);
  sub_24739E418((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = TimerIntentHandlerSingle;
  swift_retain();
  v4 = -[CreateTimerIntentHandlerSingle init](&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)handleCreateTimer:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473D16A4(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)resolveDurationNumberForCreateTimer:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473D1C5C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  void *ObjCClassFromMetadata;
  id v8;
  id v9;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v10;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  sub_2473A0738(0, &qword_25769E268);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v8 = a3;
  v10 = self;
  v9 = objc_msgSend(ObjCClassFromMetadata, sel_notRequired);
  v6[2](v6, v9);

  _Block_release(v6);
}

- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v9;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  type metadata accessor for SiriTimerTypeResolutionResult();
  v7 = a3;
  v9 = self;
  v8 = static SiriTimerTypeResolutionResult.success(with:)((uint64_t)objc_msgSend(v7, sel_type));
  v6[2](v6, v8);

  _Block_release(v6);
}

- (void)resolveAssociatedDeviceTargetForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4
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
  CreateTimerIntent *v16;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v17;
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
  v14[4] = &unk_25769E260;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25769D658;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2473E3DAC((uint64_t)v10, (uint64_t)&unk_25769D660, (uint64_t)v15);
  swift_release();
}

- (void)resolveAllAvailableTargetsForCreateTimer:(CreateTimerIntent *)a3 withCompletion:(id)a4
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
  CreateTimerIntent *v16;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v17;
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
  v14[4] = &unk_25769E250;
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

- (void)confirmCreateTimer:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473D1E10((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeTimerInternal30CreateTimerIntentHandlerSingle_siriTimerManager);
}

@end
