@implementation SetSharedLocationVisibilityIntentResponse

- (int64_t)code
{
  return SetSharedLocationVisibilityIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_1CCCEBA68(a3);
}

- (SetSharedLocationVisibilityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetSharedLocationVisibilityIntentResponse)init
{
  return (SetSharedLocationVisibilityIntentResponse *)SetSharedLocationVisibilityIntentResponse.init()();
}

- (SetSharedLocationVisibilityIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetSharedLocationVisibilityIntentResponse *result;

  v3 = a3;
  SetSharedLocationVisibilityIntentResponse.init(coder:)();
  return result;
}

- (SetSharedLocationVisibilityIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetSharedLocationVisibilityIntentResponse *result;

  v3 = a3;
  SetSharedLocationVisibilityIntentResponse.init(backingStore:)();
  return result;
}

- (SetSharedLocationVisibilityIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetSharedLocationVisibilityIntentResponse *result;

  if (a3)
    v3 = sub_1CCCF2A54();
  else
    v3 = 0;
  SetSharedLocationVisibilityIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
