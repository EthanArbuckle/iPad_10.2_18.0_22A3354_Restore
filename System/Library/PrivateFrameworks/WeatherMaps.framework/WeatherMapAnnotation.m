@implementation WeatherMapAnnotation

- (NSString)title
{
  _TtC11WeatherMaps20WeatherMapAnnotation *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DBFF5AA8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DBFF8170();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (CLLocationCoordinate2D)coordinate
{
  _TtC11WeatherMaps20WeatherMapAnnotation *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CLLocationCoordinate2D result;

  v2 = self;
  v3 = sub_1DBFF5B80();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.longitude = v7;
  result.latitude = v6;
  return result;
}

- (_TtC11WeatherMaps20WeatherMapAnnotation)init
{
  sub_1DBFF5CB8();
}

- (void).cxx_destruct
{
  sub_1DBE9ADF8((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps20WeatherMapAnnotation_annotatedLocation, type metadata accessor for WeatherMapAnnotatedLocationData);
}

@end
