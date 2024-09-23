@implementation GetBloodPressureIntentResponse

- (int64_t)code
{
  GetBloodPressureIntentResponse *v2;
  int64_t BloodPressureIntent;

  v2 = self;
  BloodPressureIntent = GetBloodPressureIntentResponse.code.getter();

  return BloodPressureIntent;
}

- (void)setCode:(int64_t)a3
{
  GetBloodPressureIntentResponse *v3;

  v3 = self;
  GetBloodPressureIntentResponse.code.setter(a3);

}

- (GetBloodPressureIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetBloodPressureIntentResponse)init
{
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init()();
}

- (GetBloodPressureIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(coder:)(a3);
}

- (GetBloodPressureIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(backingStore:)(a3);
}

- (GetBloodPressureIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(propertiesByName:)(v6);
}

@end
