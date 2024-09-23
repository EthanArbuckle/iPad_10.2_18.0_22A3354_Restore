@implementation GetMenstruationPredictionIntentResponse

- (int64_t)code
{
  GetMenstruationPredictionIntentResponse *v2;
  int64_t MenstruationPredictionIntent;

  v2 = self;
  MenstruationPredictionIntent = GetMenstruationPredictionIntentResponse.code.getter();

  return MenstruationPredictionIntent;
}

- (void)setCode:(int64_t)a3
{
  GetMenstruationPredictionIntentResponse *v3;

  v3 = self;
  GetMenstruationPredictionIntentResponse.code.setter(a3);

}

- (GetMenstruationPredictionIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetMenstruationPredictionIntentResponse *)GetMenstruationPredictionIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetMenstruationPredictionIntentResponse)init
{
  return (GetMenstruationPredictionIntentResponse *)GetMenstruationPredictionIntentResponse.init()();
}

- (GetMenstruationPredictionIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetMenstruationPredictionIntentResponse *)GetMenstruationPredictionIntentResponse.init(coder:)(a3);
}

- (GetMenstruationPredictionIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetMenstruationPredictionIntentResponse *)GetMenstruationPredictionIntentResponse.init(backingStore:)(a3);
}

- (GetMenstruationPredictionIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetMenstruationPredictionIntentResponse *)GetMenstruationPredictionIntentResponse.init(propertiesByName:)(v6);
}

@end
