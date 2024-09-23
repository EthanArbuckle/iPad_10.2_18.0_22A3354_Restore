@implementation CloseAppIntentResponse

- (int64_t)code
{
  return CloseAppIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_2291BF53C(a3);
}

- (CloseAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init(code:userActivity:)(a3, a4);
}

- (CloseAppIntentResponse)init
{
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init()();
}

- (CloseAppIntentResponse)initWithCoder:(id)a3
{
  id v3;
  CloseAppIntentResponse *result;

  v3 = a3;
  CloseAppIntentResponse.init(coder:)();
  return result;
}

- (CloseAppIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  CloseAppIntentResponse *result;

  v3 = a3;
  CloseAppIntentResponse.init(backingStore:)();
  return result;
}

- (CloseAppIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  CloseAppIntentResponse *result;

  if (a3)
    v3 = sub_2291C4664();
  else
    v3 = 0;
  CloseAppIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
