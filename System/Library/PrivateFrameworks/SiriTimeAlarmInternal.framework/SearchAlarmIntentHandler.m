@implementation SearchAlarmIntentHandler

- (_TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler *)SearchAlarmIntentHandler.init()();
}

- (void)resolveAlarmsForSearchAlarm:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  SearchAlarmIntentHandler.resolveAlarms(for:with:)(v8, (uint64_t)sub_2473497FC, v7);

  swift_release();
}

- (void)confirmSearchAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  _TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler *v9;
  char *v10;
  char *v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone((Class)type metadata accessor for SearchAlarmIntentResponse());
  v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___SearchAlarmIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v11 = 1;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleSearchAlarm:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_247349690((uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal24SearchAlarmIntentHandler_osLogObject));
}

@end
