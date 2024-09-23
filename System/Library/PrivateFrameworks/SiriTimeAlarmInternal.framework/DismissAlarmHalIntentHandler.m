@implementation DismissAlarmHalIntentHandler

- (void)confirmDismissAlarmHal:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473763A0(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleDismissAlarmHal:(DismissAlarmHalIntent *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DismissAlarmHalIntent *v15;
  _TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257694AC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_24738A6B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_257695340;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_257694AD8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_247375E9C((uint64_t)v9, (uint64_t)&unk_257694AE0, (uint64_t)v14);
  swift_release();
}

- (_TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler)init
{
  _TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler *result;

  result = (_TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal28DismissAlarmHalIntentHandler_osLogObject));
}

@end
