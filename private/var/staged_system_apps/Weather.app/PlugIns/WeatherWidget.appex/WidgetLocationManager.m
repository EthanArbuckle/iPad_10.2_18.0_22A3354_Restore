@implementation WidgetLocationManager

- (_TtC13WeatherWidget21WidgetLocationManager)init
{
  sub_100069950();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_lock));
  swift_bridgeObjectRelease(*(_QWORD *)&self->lock[OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_didReceiveLocationAuthorization]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_timer));
  sub_100070FF0(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationQueue);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_savedLocationsReconciler));
  sub_100070FF0(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_defaultCityManager);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_savedLocationsReader);
  sub_100070FF0(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationManager);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationCacheManager);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_completionQueue));
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_geocodeManager);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_localSearchManager);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_iCloudStatusProvider);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_ubiquitousKeyValueStoreProvider);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_currentLocationUpdateTelemetryBackend);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationsOfInterestDataSource);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationDisplayContextReader);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_weatherLocationCoalescenceManager);
  sub_100070D50(OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationMatchHelper);
  _s13WeatherWidget29DailyForecastViewModelFactoryVwxx_0((Class *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_savedLocationFinder));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC13WeatherWidget21WidgetLocationManager *v10;

  v7 = sub_100070744(0, (unint64_t *)&unk_1001C0F00, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10006E574();

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC13WeatherWidget21WidgetLocationManager *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10006EBEC();

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC13WeatherWidget21WidgetLocationManager *v5;

  v4 = a3;
  v5 = self;
  sub_10006EE24();

}

@end
