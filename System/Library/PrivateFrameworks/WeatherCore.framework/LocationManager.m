@implementation LocationManager

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  objc_class *v4;
  CLLocationManager v5;
  id internal;

  v4 = (objc_class *)a3;
  v5._internal = self;
  internal = v5._internal;
  v5.super.isa = v4;
  LocationManager.locationManagerDidChangeAuthorization(_:)(v5);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v6;
  objc_class *v7;
  _TtC11WeatherCore15LocationManager *v8;
  CLLocationManager v9;
  Swift::OpaquePointer v10;

  sub_1B00F07C0(0, (unint64_t *)&qword_1ED1FFE10);
  v6 = (void *)sub_1B02685CC();
  v7 = (objc_class *)a3;
  v8 = self;
  v9.super.isa = v7;
  v9._internal = v6;
  LocationManager.locationManager(_:didUpdateLocations:)(v9, v10);

  swift_bridgeObjectRelease();
}

- (_TtC11WeatherCore15LocationManager)init
{
  LocationManager.init()();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_26_8();
  OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC11WeatherCore15LocationManager_logger);
  OUTLINED_FUNCTION_26_8();
  OUTLINED_FUNCTION_26_8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_26_8();
  OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC11WeatherCore15LocationManager_notifyQueue);
  OUTLINED_FUNCTION_69_0(OBJC_IVAR____TtC11WeatherCore15LocationManager_locationActivityQueue);
  OUTLINED_FUNCTION_26_8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore15LocationManager_locationCacheManager);
  OUTLINED_FUNCTION_26_8();
  OUTLINED_FUNCTION_11_9();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC11WeatherCore15LocationManager *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  LocationManager.locationManager(_:didFailWithError:)();

}

@end
