@implementation SetGeoFenceIntentResponse

- (int64_t)code
{
  return SetGeoFenceIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
  sub_1CCCEC440(a3);
}

- (SetGeoFenceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetGeoFenceIntentResponse)init
{
  return (SetGeoFenceIntentResponse *)SetGeoFenceIntentResponse.init()();
}

- (SetGeoFenceIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetGeoFenceIntentResponse *result;

  v3 = a3;
  SetGeoFenceIntentResponse.init(coder:)();
  return result;
}

- (SetGeoFenceIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetGeoFenceIntentResponse *result;

  v3 = a3;
  SetGeoFenceIntentResponse.init(backingStore:)();
  return result;
}

- (SetGeoFenceIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetGeoFenceIntentResponse *result;

  if (a3)
    v3 = sub_1CCCF2A54();
  else
    v3 = 0;
  SetGeoFenceIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
