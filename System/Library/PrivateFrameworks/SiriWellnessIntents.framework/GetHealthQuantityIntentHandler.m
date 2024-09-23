@implementation GetHealthQuantityIntentHandler

- (void)handleGetHealthQuantity:(GetHealthQuantityIntent *)a3 completion:(id)a4
{
  GetHealthQuantityIntent *v4;
  _TtC19SiriWellnessIntents30GetHealthQuantityIntentHandler *v5;
  _QWORD *v6;
  void *v9;

  v4 = a3;
  v9 = _Block_copy(a4);
  v5 = self;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a3;
  v6[3] = v9;
  v6[4] = self;
  _runTaskForBridgedAsyncMethod(_:)((uint64_t)&async function pointer to partial apply for @objc closure #1 in GetHealthQuantityIntentHandler.handle(intent:), (uint64_t)v6);
}

- (_TtC19SiriWellnessIntents30GetHealthQuantityIntentHandler)init
{
  return (_TtC19SiriWellnessIntents30GetHealthQuantityIntentHandler *)GetHealthQuantityIntentHandler.init()();
}

- (void).cxx_destruct
{
  outlined destroy of QuantityPersisting?((uint64_t)self + OBJC_IVAR____TtC19SiriWellnessIntents30GetHealthQuantityIntentHandler_storage);
}

@end
