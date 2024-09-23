@implementation SwitchProfileIntentResponse

- (int64_t)code
{
  return SwitchProfileIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_2463BE734(a3);
}

- (SwitchProfileIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SwitchProfileIntentResponse)init
{
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init()();
}

- (SwitchProfileIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SwitchProfileIntentResponse *result;

  v3 = a3;
  SwitchProfileIntentResponse.init(coder:)();
  return result;
}

- (SwitchProfileIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SwitchProfileIntentResponse *result;

  v3 = a3;
  SwitchProfileIntentResponse.init(backingStore:)();
  return result;
}

- (SwitchProfileIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SwitchProfileIntentResponse *result;

  if (a3)
    v3 = sub_2463C05D0();
  else
    v3 = 0;
  SwitchProfileIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
