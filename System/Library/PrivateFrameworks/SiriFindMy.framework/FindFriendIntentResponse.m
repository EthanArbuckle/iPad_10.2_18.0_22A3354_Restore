@implementation FindFriendIntentResponse

- (int64_t)code
{
  return FindFriendIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_1CCCEAE24(a3);
}

- (FindFriendIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init(code:userActivity:)(a3, a4);
}

- (FindFriendIntentResponse)init
{
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init()();
}

- (FindFriendIntentResponse)initWithCoder:(id)a3
{
  id v3;
  FindFriendIntentResponse *result;

  v3 = a3;
  FindFriendIntentResponse.init(coder:)();
  return result;
}

- (FindFriendIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  FindFriendIntentResponse *result;

  v3 = a3;
  FindFriendIntentResponse.init(backingStore:)();
  return result;
}

- (FindFriendIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  FindFriendIntentResponse *result;

  if (a3)
    v3 = sub_1CCCF2A54();
  else
    v3 = 0;
  FindFriendIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
