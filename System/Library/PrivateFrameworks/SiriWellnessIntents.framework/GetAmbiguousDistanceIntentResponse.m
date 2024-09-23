@implementation GetAmbiguousDistanceIntentResponse

- (int64_t)code
{
  GetAmbiguousDistanceIntentResponse *v2;
  int64_t AmbiguousDistanceIntent;

  v2 = self;
  AmbiguousDistanceIntent = GetAmbiguousDistanceIntentResponse.code.getter();

  return AmbiguousDistanceIntent;
}

- (void)setCode:(int64_t)a3
{
  GetAmbiguousDistanceIntentResponse *v3;

  v3 = self;
  GetAmbiguousDistanceIntentResponse.code.setter(a3);

}

- (GetAmbiguousDistanceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetAmbiguousDistanceIntentResponse)init
{
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init()();
}

- (GetAmbiguousDistanceIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(coder:)(a3);
}

- (GetAmbiguousDistanceIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(backingStore:)(a3);
}

- (GetAmbiguousDistanceIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(propertiesByName:)(v6);
}

@end
