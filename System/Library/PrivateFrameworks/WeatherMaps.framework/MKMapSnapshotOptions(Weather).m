@implementation MKMapSnapshotOptions(Weather)

- (uint64_t)configureForWeather
{
  return objc_msgSend(a1, "setMapType:", 109);
}

- (uint64_t)configureForWeatherWind
{
  return objc_msgSend(a1, "setMapType:", 110);
}

@end
