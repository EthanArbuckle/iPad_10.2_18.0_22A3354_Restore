@implementation WatchSportsEventIntentResponse

- (int64_t)code
{
  return WatchSportsEventIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_21E9D0A1C(a3);
}

- (WatchSportsEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WatchSportsEventIntentResponse)init
{
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init()();
}

- (WatchSportsEventIntentResponse)initWithCoder:(id)a3
{
  id v3;
  WatchSportsEventIntentResponse *result;

  v3 = a3;
  WatchSportsEventIntentResponse.init(coder:)();
  return result;
}

- (WatchSportsEventIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  WatchSportsEventIntentResponse *result;

  v3 = a3;
  WatchSportsEventIntentResponse.init(backingStore:)();
  return result;
}

- (WatchSportsEventIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  WatchSportsEventIntentResponse *result;

  if (a3)
    v3 = sub_21E9D84AC();
  else
    v3 = 0;
  WatchSportsEventIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
