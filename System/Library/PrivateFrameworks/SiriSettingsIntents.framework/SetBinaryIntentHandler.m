@implementation SetBinaryIntentHandler

- (void)handleSetBinarySetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents22SetBinaryIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_220546C2C(a3, (void (*)(void))sub_220531CC4, v9);
  swift_release();

}

- (void)confirmSetBinarySetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents22SetBinaryIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_2205473B8(a3, (uint64_t)sub_220531CC4, v9);
  swift_release();

}

- (void)resolveTemporalEventTriggerForSetBinarySetting:(INSetBinarySettingIntent *)a3 withCompletion:(id)a4
{
  INSetBinarySettingIntent *v4;
  _TtC19SiriSettingsIntents22SetBinaryIntentHandler *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  sub_2205482D4((uint64_t)&unk_2555DFD10, (uint64_t)v6);
}

- (_TtC19SiriSettingsIntents22SetBinaryIntentHandler)init
{
  return (_TtC19SiriSettingsIntents22SetBinaryIntentHandler *)SetBinaryIntentHandler.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19SiriSettingsIntents22SetBinaryIntentHandler_settingsFeatureFlags);
  sub_2204A1FA8((uint64_t)self + OBJC_IVAR____TtC19SiriSettingsIntents22SetBinaryIntentHandler_deviceState);
}

@end
