@implementation PauseMediaIntentResponse

- (PauseMediaIntentResponse)init
{
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
  sub_2248164FC(a3);
}

- (int64_t)code
{
  return sub_22481655C();
}

- (PauseMediaIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  PauseMediaIntentResponse *result;

  v3 = a3;
  PauseMediaIntentResponse.init(backingStore:)();
  return result;
}

- (PauseMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PauseMediaIntentResponse)initWithCoder:(id)a3
{
  id v3;
  PauseMediaIntentResponse *result;

  v3 = a3;
  PauseMediaIntentResponse.init(coder:)();
  return result;
}

- (PauseMediaIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  PauseMediaIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  PauseMediaIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
