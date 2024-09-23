@implementation CreateAlarmIntentHandler

- (void)resolveTimeForCreateAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734B0EC(self, (int)a2, a3, a4, (void (*)(id, void *))sub_24733F64C);
}

- (void)confirmCreateAlarm:(id)a3 completion:(id)a4
{
  sub_24734B0EC(self, (int)a2, a3, a4, (void (*)(id, void *))sub_247373568);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler_osLogObject));
}

- (void)handleCreateAlarm:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_2473737A8(v7, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24CreateAlarmIntentHandler *)CreateAlarmIntentHandler.init()();
}

@end
