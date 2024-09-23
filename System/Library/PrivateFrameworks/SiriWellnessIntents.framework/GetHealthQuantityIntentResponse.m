@implementation GetHealthQuantityIntentResponse

- (int64_t)code
{
  GetHealthQuantityIntentResponse *v2;
  int64_t HealthQuantityIntent;

  v2 = self;
  HealthQuantityIntent = GetHealthQuantityIntentResponse.code.getter();

  return HealthQuantityIntent;
}

- (void)setCode:(int64_t)a3
{
  GetHealthQuantityIntentResponse *v3;

  v3 = self;
  GetHealthQuantityIntentResponse.code.setter(a3);

}

- (GetHealthQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetHealthQuantityIntentResponse)init
{
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init()();
}

- (GetHealthQuantityIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(coder:)(a3);
}

- (GetHealthQuantityIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(backingStore:)(a3);
}

- (GetHealthQuantityIntentResponse)initWithPropertiesByName:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (a3)
  {
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(propertiesByName:)(v6);
}

@end
