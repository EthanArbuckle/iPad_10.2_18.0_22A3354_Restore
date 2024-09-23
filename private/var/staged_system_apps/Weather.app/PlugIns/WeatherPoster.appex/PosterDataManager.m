@implementation PosterDataManager

- (_TtC13WeatherPoster17PosterDataManager)init
{
  sub_10003E5F8();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_cacheManager));
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_dataUpdater);
  sub_100041C5C(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager____lazy_storage___locationManager);
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkMonitor);
  sub_100041C5C(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_periodicTimer);
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_locationSessionExtender);
  sub_1000191B4(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_networkSessionExtender);
  sub_100041C5C(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_location);
  sub_100041C5C(OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_activeRequestLocation);
  sub_100013934((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_sessionExtenderDelegate);
  sub_100013934((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster17PosterDataManager_posterDataDelegate);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC13WeatherPoster17PosterDataManager *v10;

  v7 = sub_1000135E0(0, &qword_10005D958, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10003EA04(v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC13WeatherPoster17PosterDataManager *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10003FD8C((uint64_t)v7, (uint64_t)v8);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC13WeatherPoster17PosterDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_10003FFD0(v4);

}

@end
