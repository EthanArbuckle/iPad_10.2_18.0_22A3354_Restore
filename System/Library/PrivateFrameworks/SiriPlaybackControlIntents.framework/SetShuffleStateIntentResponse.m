@implementation SetShuffleStateIntentResponse

- (int64_t)code
{
  return sub_2249DB4E4();
}

- (void)setCode:(int64_t)a3
{
  sub_2249DB54C(a3);
}

- (SetShuffleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetShuffleStateIntentResponse)init
{
  return (SetShuffleStateIntentResponse *)SetShuffleStateIntentResponse.init()();
}

- (SetShuffleStateIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetShuffleStateIntentResponse *result;

  v3 = a3;
  SetShuffleStateIntentResponse.init(coder:)();
  return result;
}

- (SetShuffleStateIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetShuffleStateIntentResponse *result;

  v3 = a3;
  SetShuffleStateIntentResponse.init(backingStore:)();
  return result;
}

- (SetShuffleStateIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetShuffleStateIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetShuffleStateIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
