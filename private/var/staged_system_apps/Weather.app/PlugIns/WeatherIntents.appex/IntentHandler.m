@implementation IntentHandler

- (_TtC14WeatherIntents13IntentHandler)init
{
  return (_TtC14WeatherIntents13IntentHandler *)sub_10000A47C();
}

- (void).cxx_destruct
{
  sub_1000083AC((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager, &qword_100019778);
  sub_10000D510(OBJC_IVAR____TtC14WeatherIntents13IntentHandler_iCloudStatusProvider);
  sub_10000D510(OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager);
  sub_1000083AC((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory, &qword_1000197B0);
  sub_10000D510(OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager));
  sub_1000083AC((uint64_t)self + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader, &qword_1000197A0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations));

}

- (void)provideLocationOptionsCollectionForWeather:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC14WeatherIntents13IntentHandler *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_10000A678((uint64_t)v11, v9, (unint64_t)a4, v12, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(a4);
}

- (id)defaultLocationForWeather:(id)a3
{
  id v4;
  _TtC14WeatherIntents13IntentHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10000AFC8(v4);

  return v6;
}

- (id)handlerForIntent:(id)a3
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;

  sub_10000B518(v7);
  v3 = v8;
  v4 = sub_100008388(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_10000641C(v7);
  return v5;
}

- (void)resolveLocationForWeather:(id)a3 withCompletion:(id)a4
{
  sub_10000BE68(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10000B5A8);
}

- (void)handleWeather:(id)a3 completion:(id)a4
{
  sub_10000BE68(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10000B9C4);
}

@end
