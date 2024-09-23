@implementation SetTemporalIntentHandler

- (void)handleSetTemporalSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents24SetTemporalIntentHandler *v6;
  void *v8;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  sub_22054C8F8();
  swift_release();

}

- (_TtC19SiriSettingsIntents24SetTemporalIntentHandler)init
{
  return (_TtC19SiriSettingsIntents24SetTemporalIntentHandler *)SetTemporalIntentHandler.init()();
}

@end
