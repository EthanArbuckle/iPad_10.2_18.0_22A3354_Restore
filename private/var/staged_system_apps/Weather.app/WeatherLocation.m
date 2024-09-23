@implementation WeatherLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WeatherLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (a5)
    static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  return (WeatherLocation *)WeatherLocation.init(identifier:display:pronunciationHint:)();
}

- (WeatherLocation)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (WeatherLocation *)WeatherLocation.init(coder:)();
}

@end
