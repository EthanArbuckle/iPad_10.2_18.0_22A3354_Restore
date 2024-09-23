@implementation GetContactIntentResponse

- (int64_t)code
{
  return GetContactIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  GetContactIntentResponse.code.setter(a3);
}

- (GetContactIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (GetContactIntentResponse *)GetContactIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetContactIntentResponse)init
{
  return (GetContactIntentResponse *)GetContactIntentResponse.init()();
}

- (GetContactIntentResponse)initWithCoder:(id)a3
{
  id v3;
  GetContactIntentResponse *result;

  v3 = a3;
  GetContactIntentResponse.init(coder:)();
  return result;
}

- (GetContactIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  GetContactIntentResponse *result;

  v3 = a3;
  GetContactIntentResponse.init(backingStore:)();
  return result;
}

- (GetContactIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  GetContactIntentResponse *result;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v3 = 0;
  GetContactIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
