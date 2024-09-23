@implementation LaunchAppIntentResponse

- (int64_t)code
{
  return LaunchAppIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_2291BE840(a3);
}

- (LaunchAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LaunchAppIntentResponse)init
{
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init()();
}

- (LaunchAppIntentResponse)initWithCoder:(id)a3
{
  id v3;
  LaunchAppIntentResponse *result;

  v3 = a3;
  LaunchAppIntentResponse.init(coder:)();
  return result;
}

- (LaunchAppIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  LaunchAppIntentResponse *result;

  v3 = a3;
  LaunchAppIntentResponse.init(backingStore:)();
  return result;
}

- (LaunchAppIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  LaunchAppIntentResponse *result;

  if (a3)
    v3 = sub_2291C4664();
  else
    v3 = 0;
  LaunchAppIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
