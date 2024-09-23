@implementation BackgroundFetchManager

- (_TtC13TeaFoundation22BackgroundFetchManager)init
{
  return (_TtC13TeaFoundation22BackgroundFetchManager *)BackgroundFetchManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TeaFoundation22BackgroundFetchManager_backgroundTaskSchedulingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TeaFoundation22BackgroundFetchManager____lazy_storage___locationManager));
  swift_release();
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6;
  id v7;
  CLLocationManager v8;
  CLRegion v9;
  Class isa;

  v6 = a3;
  v7 = a4;
  v8.super.isa = (Class)self;
  isa = v8.super.isa;
  v8._internal = v7;
  BackgroundFetchManager.locationManager(_:didStartMonitoringFor:)(v8, v9);

}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC13TeaFoundation22BackgroundFetchManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  BackgroundFetchManager.locationManager(_:monitoringDidFailFor:withError:)((uint64_t)v10, a4);

}

@end
