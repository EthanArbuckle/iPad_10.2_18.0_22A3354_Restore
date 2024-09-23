@implementation DeleteAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler *)DeleteAlarmIntentHandler.init()();
}

- (void)resolveAlarmsForDeleteAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24737EA18);
}

- (void)confirmDeleteAlarm:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_24737ED9C(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleDeleteAlarm:(id)a3 completion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24737F0CC);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal24DeleteAlarmIntentHandler_osLogObject));
}

@end
