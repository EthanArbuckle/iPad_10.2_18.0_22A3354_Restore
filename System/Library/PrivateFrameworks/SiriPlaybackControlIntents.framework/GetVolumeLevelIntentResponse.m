@implementation GetVolumeLevelIntentResponse

- (int64_t)code
{
  return sub_2249DD070();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DD0D4(a3);
}

- (GetVolumeLevelIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetVolumeLevelIntentResponse)init
{
  return (GetVolumeLevelIntentResponse *)GetVolumeLevelIntentResponse.init()();
}

- (GetVolumeLevelIntentResponse)initWithCoder:(id)a3
{
  id v3;
  GetVolumeLevelIntentResponse *result;

  v3 = a3;
  GetVolumeLevelIntentResponse.init(coder:)();
  return result;
}

- (GetVolumeLevelIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  GetVolumeLevelIntentResponse *result;

  v3 = a3;
  GetVolumeLevelIntentResponse.init(backingStore:)();
  return result;
}

- (GetVolumeLevelIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  GetVolumeLevelIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  GetVolumeLevelIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
