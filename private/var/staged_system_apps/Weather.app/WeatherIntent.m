@implementation WeatherIntent

- (WeatherIntent)init
{
  return (WeatherIntent *)WeatherIntent.init()();
}

- (WeatherIntent)initWithCoder:(id)a3
{
  id v3;
  WeatherIntent *result;

  v3 = a3;
  WeatherIntent.init(coder:)();
  return result;
}

- (WeatherIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  WeatherIntent *result;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  WeatherIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (WeatherIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (a5)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  return (WeatherIntent *)WeatherIntent.init(domain:verb:parametersByName:)();
}

@end
