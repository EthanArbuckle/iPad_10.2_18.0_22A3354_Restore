@implementation UserIdentifyIntentResponse

- (int64_t)code
{
  return UserIdentifyIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_2463BCF0C(a3);
}

- (UserIdentifyIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init(code:userActivity:)(a3, a4);
}

- (UserIdentifyIntentResponse)init
{
  return (UserIdentifyIntentResponse *)UserIdentifyIntentResponse.init()();
}

- (UserIdentifyIntentResponse)initWithCoder:(id)a3
{
  id v3;
  UserIdentifyIntentResponse *result;

  v3 = a3;
  UserIdentifyIntentResponse.init(coder:)();
  return result;
}

- (UserIdentifyIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  UserIdentifyIntentResponse *result;

  v3 = a3;
  UserIdentifyIntentResponse.init(backingStore:)();
  return result;
}

- (UserIdentifyIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  UserIdentifyIntentResponse *result;

  if (a3)
    v3 = sub_2463C05D0();
  else
    v3 = 0;
  UserIdentifyIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
