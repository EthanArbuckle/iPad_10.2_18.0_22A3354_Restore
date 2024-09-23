@implementation RemoveFromWatchListIntentResponse

- (int64_t)code
{
  return RemoveFromWatchListIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_21E9CF198(a3);
}

- (RemoveFromWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init(code:userActivity:)(a3, a4);
}

- (RemoveFromWatchListIntentResponse)init
{
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init()();
}

- (RemoveFromWatchListIntentResponse)initWithCoder:(id)a3
{
  id v3;
  RemoveFromWatchListIntentResponse *result;

  v3 = a3;
  RemoveFromWatchListIntentResponse.init(coder:)();
  return result;
}

- (RemoveFromWatchListIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  RemoveFromWatchListIntentResponse *result;

  v3 = a3;
  RemoveFromWatchListIntentResponse.init(backingStore:)();
  return result;
}

- (RemoveFromWatchListIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  RemoveFromWatchListIntentResponse *result;

  if (a3)
    v3 = sub_21E9D84AC();
  else
    v3 = 0;
  RemoveFromWatchListIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
