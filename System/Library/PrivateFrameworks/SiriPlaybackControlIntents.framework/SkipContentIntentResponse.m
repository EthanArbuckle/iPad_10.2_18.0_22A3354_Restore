@implementation SkipContentIntentResponse

- (int64_t)code
{
  return sub_2249D6C70();
}

- (void)setCode:(int64_t)a3
{
  sub_2249D6CD8(a3);
}

- (SkipContentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SkipContentIntentResponse)init
{
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init()();
}

- (SkipContentIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SkipContentIntentResponse *result;

  v3 = a3;
  SkipContentIntentResponse.init(coder:)();
  return result;
}

- (SkipContentIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SkipContentIntentResponse *result;

  v3 = a3;
  SkipContentIntentResponse.init(backingStore:)();
  return result;
}

- (SkipContentIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SkipContentIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SkipContentIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
