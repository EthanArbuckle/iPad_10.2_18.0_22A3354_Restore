@implementation ModifyContactAttributeIntentResponse

- (int64_t)code
{
  return ModifyContactAttributeIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  ModifyContactAttributeIntentResponse.code.setter(a3);
}

- (ModifyContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (ModifyContactAttributeIntentResponse)init
{
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init()();
}

- (ModifyContactAttributeIntentResponse)initWithCoder:(id)a3
{
  id v3;
  ModifyContactAttributeIntentResponse *result;

  v3 = a3;
  ModifyContactAttributeIntentResponse.init(coder:)();
  return result;
}

- (ModifyContactAttributeIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  ModifyContactAttributeIntentResponse *result;

  v3 = a3;
  ModifyContactAttributeIntentResponse.init(backingStore:)();
  return result;
}

- (ModifyContactAttributeIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  ModifyContactAttributeIntentResponse *result;

  if (a3)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v3 = 0;
  ModifyContactAttributeIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
