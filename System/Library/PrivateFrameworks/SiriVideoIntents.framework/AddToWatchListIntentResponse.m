@implementation AddToWatchListIntentResponse

- (int64_t)code
{
  return AddToWatchListIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_21E9CE53C(a3);
}

- (AddToWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init(code:userActivity:)(a3, a4);
}

- (AddToWatchListIntentResponse)init
{
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init()();
}

- (AddToWatchListIntentResponse)initWithCoder:(id)a3
{
  id v3;
  AddToWatchListIntentResponse *result;

  v3 = a3;
  AddToWatchListIntentResponse.init(coder:)();
  return result;
}

- (AddToWatchListIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  AddToWatchListIntentResponse *result;

  v3 = a3;
  AddToWatchListIntentResponse.init(backingStore:)();
  return result;
}

- (AddToWatchListIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  AddToWatchListIntentResponse *result;

  if (a3)
    v3 = sub_21E9D84AC();
  else
    v3 = 0;
  AddToWatchListIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
