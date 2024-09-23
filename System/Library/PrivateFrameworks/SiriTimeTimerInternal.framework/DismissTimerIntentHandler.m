@implementation DismissTimerIntentHandler

- (void)confirmDismissTimer:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeTimerInternal25DismissTimerIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473C1CB0(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleDismissTimer:(DismissTimerIntent *)a3 completion:(id)a4
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
  DismissTimerIntent *v16;
  _TtC21SiriTimeTimerInternal25DismissTimerIntentHandler *v17;
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
  v14[4] = &unk_25769DAD0;
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

- (_TtC21SiriTimeTimerInternal25DismissTimerIntentHandler)init
{
  _TtC21SiriTimeTimerInternal25DismissTimerIntentHandler *result;

  result = (_TtC21SiriTimeTimerInternal25DismissTimerIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeTimerInternal25DismissTimerIntentHandler_siriTimerManager);
}

@end
