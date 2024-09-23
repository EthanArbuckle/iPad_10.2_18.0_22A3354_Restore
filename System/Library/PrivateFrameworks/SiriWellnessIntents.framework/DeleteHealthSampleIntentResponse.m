@implementation DeleteHealthSampleIntentResponse

- (int64_t)code
{
  DeleteHealthSampleIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = DeleteHealthSampleIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  DeleteHealthSampleIntentResponse *v3;

  v3 = self;
  DeleteHealthSampleIntentResponse.code.setter(a3);

}

- (DeleteHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(code:userActivity:)(a3, a4);
}

- (DeleteHealthSampleIntentResponse)init
{
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init()();
}

- (DeleteHealthSampleIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(coder:)(a3);
}

- (DeleteHealthSampleIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(backingStore:)(a3);
}

- (DeleteHealthSampleIntentResponse)initWithPropertiesByName:(id)a3
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
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(propertiesByName:)(v6);
}

@end
