@implementation WeatherIntentResponse

- (int64_t)code
{
  return WeatherIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_100042984(a3);
}

- (WeatherIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (WeatherIntentResponse *)WeatherIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WeatherIntentResponse)init
{
  return (WeatherIntentResponse *)WeatherIntentResponse.init()();
}

- (WeatherIntentResponse)initWithCoder:(id)a3
{
  id v3;
  WeatherIntentResponse *result;

  v3 = a3;
  WeatherIntentResponse.init(coder:)();
  return result;
}

- (WeatherIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  WeatherIntentResponse *result;

  v3 = a3;
  WeatherIntentResponse.init(backingStore:)();
  return result;
}

- (WeatherIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  WeatherIntentResponse *result;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  else
    v3 = 0;
  WeatherIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
