@implementation SeekTimeIntentResponse

- (int64_t)code
{
  return sub_2249DA6DC();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DA740(a3);
}

- (SeekTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SeekTimeIntentResponse)init
{
  return (SeekTimeIntentResponse *)SeekTimeIntentResponse.init()();
}

- (SeekTimeIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SeekTimeIntentResponse *result;

  v3 = a3;
  SeekTimeIntentResponse.init(coder:)();
  return result;
}

- (SeekTimeIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SeekTimeIntentResponse *result;

  v3 = a3;
  SeekTimeIntentResponse.init(backingStore:)();
  return result;
}

- (SeekTimeIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SeekTimeIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SeekTimeIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
