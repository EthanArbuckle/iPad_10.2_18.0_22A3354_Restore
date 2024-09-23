@implementation SetRepeatStateIntentResponse

- (int64_t)code
{
  return sub_2249DC284();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DC2EC(a3);
}

- (SetRepeatStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetRepeatStateIntentResponse)init
{
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init()();
}

- (SetRepeatStateIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetRepeatStateIntentResponse *result;

  v3 = a3;
  SetRepeatStateIntentResponse.init(coder:)();
  return result;
}

- (SetRepeatStateIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetRepeatStateIntentResponse *result;

  v3 = a3;
  SetRepeatStateIntentResponse.init(backingStore:)();
  return result;
}

- (SetRepeatStateIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetRepeatStateIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetRepeatStateIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
