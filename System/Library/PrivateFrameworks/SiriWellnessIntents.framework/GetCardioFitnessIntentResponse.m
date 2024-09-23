@implementation GetCardioFitnessIntentResponse

- (int64_t)code
{
  GetCardioFitnessIntentResponse *v2;
  int64_t CardioFitnessIntent;

  v2 = self;
  CardioFitnessIntent = GetCardioFitnessIntentResponse.code.getter();

  return CardioFitnessIntent;
}

- (void)setCode:(int64_t)a3
{
  GetCardioFitnessIntentResponse *v3;

  v3 = self;
  GetCardioFitnessIntentResponse.code.setter(a3);

}

- (GetCardioFitnessIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetCardioFitnessIntentResponse *)GetCardioFitnessIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetCardioFitnessIntentResponse)init
{
  return (GetCardioFitnessIntentResponse *)GetCardioFitnessIntentResponse.init()();
}

- (GetCardioFitnessIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetCardioFitnessIntentResponse *)GetCardioFitnessIntentResponse.init(coder:)(a3);
}

- (GetCardioFitnessIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetCardioFitnessIntentResponse *)GetCardioFitnessIntentResponse.init(backingStore:)(a3);
}

- (GetCardioFitnessIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetCardioFitnessIntentResponse *)GetCardioFitnessIntentResponse.init(propertiesByName:)(v6);
}

@end
