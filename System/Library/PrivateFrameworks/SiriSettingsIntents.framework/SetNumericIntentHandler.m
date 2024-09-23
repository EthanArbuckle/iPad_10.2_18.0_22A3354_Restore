@implementation SetNumericIntentHandler

- (void)handleSetNumericSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents23SetNumericIntentHandler *v6;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_2206C99D8(a3, (void (*)(void))sub_220531CC4, v9);
  swift_release();

}

- (void)confirmSetNumericSetting:(id)a3 completion:(id)a4
{
  id v5;
  _TtC19SiriSettingsIntents23SetNumericIntentHandler *v6;
  void *v8;

  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  sub_2206CA2CC(a3, (void (*)(void))sub_220531CC4);
  swift_release();

}

- (_TtC19SiriSettingsIntents23SetNumericIntentHandler)init
{
  return (_TtC19SiriSettingsIntents23SetNumericIntentHandler *)SetNumericIntentHandler.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
