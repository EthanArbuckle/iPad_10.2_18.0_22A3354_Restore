@implementation PlayLiveServiceIntentResponse

- (int64_t)code
{
  return PlayLiveServiceIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_21E9CFDE4(a3);
}

- (PlayLiveServiceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PlayLiveServiceIntentResponse)init
{
  return (PlayLiveServiceIntentResponse *)PlayLiveServiceIntentResponse.init()();
}

- (PlayLiveServiceIntentResponse)initWithCoder:(id)a3
{
  id v3;
  PlayLiveServiceIntentResponse *result;

  v3 = a3;
  PlayLiveServiceIntentResponse.init(coder:)();
  return result;
}

- (PlayLiveServiceIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  PlayLiveServiceIntentResponse *result;

  v3 = a3;
  PlayLiveServiceIntentResponse.init(backingStore:)();
  return result;
}

- (PlayLiveServiceIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  PlayLiveServiceIntentResponse *result;

  if (a3)
    v3 = sub_21E9D84AC();
  else
    v3 = 0;
  PlayLiveServiceIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
