@implementation ResumeTimerIntentHandlerSingle

- (_TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle)init
{
  objc_class *v2;
  id v3;
  _TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle *v4;
  objc_super v6;
  _QWORD v7[5];

  v7[3] = type metadata accessor for SiriTimerManagerImpl();
  v7[4] = &protocol witness table for SiriTimerManagerImpl;
  v7[0] = swift_allocObject();
  v2 = (objc_class *)type metadata accessor for ResumeTimerIntentHandlerSingle();
  v3 = objc_allocWithZone(v2);
  sub_24739E418((uint64_t)v7, (uint64_t)v3 + OBJC_IVAR____TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle_siriTimerManager);
  v6.receiver = v3;
  v6.super_class = v2;
  swift_retain();
  v4 = -[ResumeTimerIntentHandlerSingle init](&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)confirmResumeTimer:(ResumeTimerIntent *)a3 completion:(id)a4
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
  ResumeTimerIntent *v16;
  _TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle *v17;
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
  v14[4] = &unk_25769ECF0;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_25769CE38;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_2473E3DAC((uint64_t)v10, (uint64_t)&unk_25769CE40, (uint64_t)v15);
  swift_release();
}

- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4
{
  sub_2473BBA20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2473E0C94);
}

- (void)resolveAssociatedDeviceTargetForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4
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
  ResumeTimerIntent *v16;
  _TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle *v17;
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
  v14[4] = &unk_25769ECE0;
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

- (void)resolveAllAvailableTargetsForResumeTimer:(ResumeTimerIntent *)a3 withCompletion:(id)a4
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
  ResumeTimerIntent *v16;
  _TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle *v17;
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
  v14[4] = &unk_25769ECD0;
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

- (void)handleResumeTimer:(id)a3 completion:(id)a4
{
  sub_2473BBA20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_2473E0FC8);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeTimerInternal30ResumeTimerIntentHandlerSingle_siriTimerManager);
}

@end
