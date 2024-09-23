@implementation LogPeriodIntentResponse

- (int64_t)code
{
  LogPeriodIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = LogPeriodIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  LogPeriodIntentResponse *v3;

  v3 = self;
  LogPeriodIntentResponse.code.setter(a3);

}

- (LogPeriodIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (LogPeriodIntentResponse *)LogPeriodIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogPeriodIntentResponse)init
{
  return (LogPeriodIntentResponse *)LogPeriodIntentResponse.init()();
}

- (LogPeriodIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LogPeriodIntentResponse *)LogPeriodIntentResponse.init(coder:)(a3);
}

- (LogPeriodIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (LogPeriodIntentResponse *)LogPeriodIntentResponse.init(backingStore:)(a3);
}

- (LogPeriodIntentResponse)initWithPropertiesByName:(id)a3
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
  return (LogPeriodIntentResponse *)LogPeriodIntentResponse.init(propertiesByName:)(v6);
}

@end
