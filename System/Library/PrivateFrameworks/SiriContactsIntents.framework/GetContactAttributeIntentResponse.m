@implementation GetContactAttributeIntentResponse

- (int64_t)code
{
  return GetContactAttributeIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  GetContactAttributeIntentResponse.code.setter(a3);
}

- (GetContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetContactAttributeIntentResponse)init
{
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init()();
}

- (GetContactAttributeIntentResponse)initWithCoder:(id)a3
{
  id v3;
  GetContactAttributeIntentResponse *result;

  v3 = a3;
  GetContactAttributeIntentResponse.init(coder:)();
  return result;
}

- (GetContactAttributeIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  GetContactAttributeIntentResponse *result;

  v3 = a3;
  GetContactAttributeIntentResponse.init(backingStore:)();
  return result;
}

- (GetContactAttributeIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  GetContactAttributeIntentResponse *result;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v3 = 0;
  GetContactAttributeIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
