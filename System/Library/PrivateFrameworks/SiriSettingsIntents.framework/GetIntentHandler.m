@implementation GetIntentHandler

- (_TtC19SiriSettingsIntents16GetIntentHandler)init
{
  return (_TtC19SiriSettingsIntents16GetIntentHandler *)sub_220551CDC();
}

- (void)handleGetSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents16GetIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_220552078(a3, (void (*)(void))sub_220531CC4, v9);
  swift_release();

}

- (void)confirmGetSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents16GetIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_220552AF4(a3, (uint64_t)sub_220531CC4, v9);
  swift_release();

}

- (void).cxx_destruct
{
  swift_release();
  sub_22045F510();
}

@end
