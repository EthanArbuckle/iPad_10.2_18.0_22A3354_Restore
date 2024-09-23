@implementation DeepLaunchIntentResponse

- (int64_t)code
{
  return DeepLaunchIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_2291C0198(a3);
}

- (DeepLaunchIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init(code:userActivity:)(a3, a4);
}

- (DeepLaunchIntentResponse)init
{
  return (DeepLaunchIntentResponse *)DeepLaunchIntentResponse.init()();
}

- (DeepLaunchIntentResponse)initWithCoder:(id)a3
{
  id v3;
  DeepLaunchIntentResponse *result;

  v3 = a3;
  DeepLaunchIntentResponse.init(coder:)();
  return result;
}

- (DeepLaunchIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  DeepLaunchIntentResponse *result;

  v3 = a3;
  DeepLaunchIntentResponse.init(backingStore:)();
  return result;
}

- (DeepLaunchIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  DeepLaunchIntentResponse *result;

  if (a3)
    v3 = sub_2291C4664();
  else
    v3 = 0;
  DeepLaunchIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
