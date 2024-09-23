@implementation SkipTimeIntentResponse

- (int64_t)code
{
  return sub_2249D5ED4();
}

- (void)setCode:(int64_t)a3
{
  sub_2249D5F3C(a3);
}

- (SkipTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SkipTimeIntentResponse)init
{
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init()();
}

- (SkipTimeIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SkipTimeIntentResponse *result;

  v3 = a3;
  SkipTimeIntentResponse.init(coder:)();
  return result;
}

- (SkipTimeIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SkipTimeIntentResponse *result;

  v3 = a3;
  SkipTimeIntentResponse.init(backingStore:)();
  return result;
}

- (SkipTimeIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SkipTimeIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SkipTimeIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
