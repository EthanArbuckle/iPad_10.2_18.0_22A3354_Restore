@implementation SetSubtitleStateIntentResponse

- (int64_t)code
{
  return sub_2249D7B24();
}

- (void)setCode:(int64_t)a3
{
  sub_2249D7B88(a3);
}

- (SetSubtitleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetSubtitleStateIntentResponse)init
{
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init()();
}

- (SetSubtitleStateIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetSubtitleStateIntentResponse *result;

  v3 = a3;
  SetSubtitleStateIntentResponse.init(coder:)();
  return result;
}

- (SetSubtitleStateIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetSubtitleStateIntentResponse *result;

  v3 = a3;
  SetSubtitleStateIntentResponse.init(backingStore:)();
  return result;
}

- (SetSubtitleStateIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetSubtitleStateIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetSubtitleStateIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
