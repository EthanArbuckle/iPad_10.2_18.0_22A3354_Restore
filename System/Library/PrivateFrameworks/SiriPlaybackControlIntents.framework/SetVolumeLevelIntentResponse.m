@implementation SetVolumeLevelIntentResponse

- (SetVolumeLevelIntentResponse)init
{
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
  sub_22483741C(a3);
}

- (int64_t)code
{
  return sub_224837480();
}

- (SetVolumeLevelIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetVolumeLevelIntentResponse *result;

  v3 = a3;
  SetVolumeLevelIntentResponse.init(backingStore:)();
  return result;
}

- (SetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetVolumeLevelIntentResponse *)SetVolumeLevelIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetVolumeLevelIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetVolumeLevelIntentResponse *result;

  v3 = a3;
  SetVolumeLevelIntentResponse.init(coder:)();
  return result;
}

- (SetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetVolumeLevelIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetVolumeLevelIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
