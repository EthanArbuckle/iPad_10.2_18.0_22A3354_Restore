@implementation OpenIntentHandler

- (void)handleOpenSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents17OpenIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_22052EFF0(a3, (void (*)(void))sub_220531CC4, v9);
  swift_release();

}

- (_TtC19SiriSettingsIntents17OpenIntentHandler)init
{
  return (_TtC19SiriSettingsIntents17OpenIntentHandler *)OpenIntentHandler.init()();
}

- (void).cxx_destruct
{
  sub_2204A1FA8((uint64_t)self + OBJC_IVAR____TtC19SiriSettingsIntents17OpenIntentHandler_deviceState);
}

@end
