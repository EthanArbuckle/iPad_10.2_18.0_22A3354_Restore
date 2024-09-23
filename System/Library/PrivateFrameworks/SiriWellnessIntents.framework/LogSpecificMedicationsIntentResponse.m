@implementation LogSpecificMedicationsIntentResponse

- (int64_t)code
{
  LogSpecificMedicationsIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = LogSpecificMedicationsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  LogSpecificMedicationsIntentResponse *v3;

  v3 = self;
  LogSpecificMedicationsIntentResponse.code.setter(a3);

}

- (LogSpecificMedicationsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (LogSpecificMedicationsIntentResponse *)LogSpecificMedicationsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogSpecificMedicationsIntentResponse)init
{
  return (LogSpecificMedicationsIntentResponse *)LogSpecificMedicationsIntentResponse.init()();
}

- (LogSpecificMedicationsIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (LogSpecificMedicationsIntentResponse *)LogSpecificMedicationsIntentResponse.init(coder:)(a3);
}

- (LogSpecificMedicationsIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (LogSpecificMedicationsIntentResponse *)LogSpecificMedicationsIntentResponse.init(backingStore:)(a3);
}

- (LogSpecificMedicationsIntentResponse)initWithPropertiesByName:(id)a3
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
  return (LogSpecificMedicationsIntentResponse *)LogSpecificMedicationsIntentResponse.init(propertiesByName:)(v6);
}

@end
