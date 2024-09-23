@implementation UpdateAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler *)UpdateAlarmIntentHandler.init()();
}

- (void)resolveAlarmForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24734F614);
}

- (void)resolveProposedLabelForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734B0EC(self, (int)a2, a3, a4, (void (*)(id, void *))sub_24734FA80);
}

- (void)resolveProposedTimeForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734B0EC(self, (int)a2, a3, a4, (void (*)(id, void *))sub_24734FC44);
}

- (void)resolveProposedMeridiemSetByUserForUpdateAlarm:(id)a3 withCompletion:(id)a4
{
  sub_24734B0EC(self, (int)a2, a3, a4, (void (*)(id, void *))sub_247350268);
}

- (void)confirmUpdateAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  _TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler *v9;
  char *v10;
  char *v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone((Class)type metadata accessor for UpdateAlarmIntentResponse());
  v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___UpdateAlarmIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v11 = 1;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleUpdateAlarm:(id)a3 completion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24735199C);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal24UpdateAlarmIntentHandler_osLogObject));
}

@end
