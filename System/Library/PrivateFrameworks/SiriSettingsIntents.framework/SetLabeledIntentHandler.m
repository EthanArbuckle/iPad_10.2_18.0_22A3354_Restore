@implementation SetLabeledIntentHandler

- (void)handleSetLabeledSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents23SetLabeledIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_2205F6CFC(a3, (void (*)(void))sub_220531CC4, v9);
  swift_release();

}

- (_TtC19SiriSettingsIntents23SetLabeledIntentHandler)init
{
  return (_TtC19SiriSettingsIntents23SetLabeledIntentHandler *)SetLabeledIntentHandler.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
