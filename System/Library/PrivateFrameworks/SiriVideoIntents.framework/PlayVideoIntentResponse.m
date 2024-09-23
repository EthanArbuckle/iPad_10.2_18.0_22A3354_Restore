@implementation PlayVideoIntentResponse

- (int64_t)code
{
  return PlayVideoIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_21E9CD804(a3);
}

- (PlayVideoIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PlayVideoIntentResponse)init
{
  return (PlayVideoIntentResponse *)PlayVideoIntentResponse.init()();
}

- (PlayVideoIntentResponse)initWithCoder:(id)a3
{
  id v3;
  PlayVideoIntentResponse *result;

  v3 = a3;
  PlayVideoIntentResponse.init(coder:)();
  return result;
}

- (PlayVideoIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  PlayVideoIntentResponse *result;

  v3 = a3;
  PlayVideoIntentResponse.init(backingStore:)();
  return result;
}

- (PlayVideoIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  PlayVideoIntentResponse *result;

  if (a3)
    v3 = sub_21E9D84AC();
  else
    v3 = 0;
  PlayVideoIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
