@implementation GetSleepAnalysisIntentResponse

- (int64_t)code
{
  GetSleepAnalysisIntentResponse *v2;
  int64_t SleepAnalysisIntent;

  v2 = self;
  SleepAnalysisIntent = GetSleepAnalysisIntentResponse.code.getter();

  return SleepAnalysisIntent;
}

- (void)setCode:(int64_t)a3
{
  GetSleepAnalysisIntentResponse *v3;

  v3 = self;
  GetSleepAnalysisIntentResponse.code.setter(a3);

}

- (GetSleepAnalysisIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetSleepAnalysisIntentResponse)init
{
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init()();
}

- (GetSleepAnalysisIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(coder:)(a3);
}

- (GetSleepAnalysisIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(backingStore:)(a3);
}

- (GetSleepAnalysisIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(propertiesByName:)(v6);
}

@end
