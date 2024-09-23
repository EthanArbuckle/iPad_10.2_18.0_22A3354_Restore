@implementation LogQuantityIntentResponse

- (int64_t)code
{
  LogQuantityIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = LogQuantityIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  LogQuantityIntentResponse *v3;

  v3 = self;
  LogQuantityIntentResponse.code.setter(a3);

}

- (LogQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogQuantityIntentResponse)init
{
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init()();
}

- (LogQuantityIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(coder:)(a3);
}

- (LogQuantityIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(backingStore:)(a3);
}

- (LogQuantityIntentResponse)initWithPropertiesByName:(id)a3
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
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(propertiesByName:)(v6);
}

@end
