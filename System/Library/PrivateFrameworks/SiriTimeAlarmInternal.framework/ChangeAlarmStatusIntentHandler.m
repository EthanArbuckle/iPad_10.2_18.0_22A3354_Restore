@implementation ChangeAlarmStatusIntentHandler

- (_TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler)init
{
  return (_TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler *)ChangeAlarmStatusIntentHandler.init()();
}

- (void)resolveAlarmsForChangeAlarmStatus:(id)a3 withCompletion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24735AD94);
}

- (void)resolveHandleSilentlyForChangeAlarmStatus:(id)a3 withCompletion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler *v12;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = objc_msgSend(v7, sel_handleSilently);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_BOOLValue);

  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedValue_, v10);
  v6[2](v6, v11);

  _Block_release(v6);
}

- (void)confirmChangeAlarmStatus:(id)a3 completion:(id)a4
{
  void (**v6)(void *, id);
  id v7;
  id v8;
  _TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler *v9;
  char *v10;
  char *v11;

  v6 = (void (**)(void *, id))_Block_copy(a4);
  v7 = objc_allocWithZone((Class)type metadata accessor for ChangeAlarmStatusIntentResponse());
  v8 = a3;
  v9 = self;
  v10 = (char *)objc_msgSend(v7, sel_init);
  v11 = &v10[OBJC_IVAR___ChangeAlarmStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v11 = 4;
  objc_msgSend(v10, sel_setUserActivity_, 0);
  v6[2](v6, v10);

  _Block_release(v6);
}

- (void)handleChangeAlarmStatus:(id)a3 completion:(id)a4
{
  sub_24734BF04(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_24735D2DC);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler_siriAlarmManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriTimeAlarmInternal30ChangeAlarmStatusIntentHandler_osLogObject));
}

@end
