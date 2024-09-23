@implementation SetRoomDimmingStateIntentResponse

- (int64_t)code
{
  return sub_2249E0340();
}

- (void)setCode:(int64_t)a3
{
  sub_2249E03A8(a3);
}

- (SetRoomDimmingStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetRoomDimmingStateIntentResponse)init
{
  return (SetRoomDimmingStateIntentResponse *)SetRoomDimmingStateIntentResponse.init()();
}

- (SetRoomDimmingStateIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SetRoomDimmingStateIntentResponse *result;

  v3 = a3;
  SetRoomDimmingStateIntentResponse.init(coder:)();
  return result;
}

- (SetRoomDimmingStateIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SetRoomDimmingStateIntentResponse *result;

  v3 = a3;
  SetRoomDimmingStateIntentResponse.init(backingStore:)();
  return result;
}

- (SetRoomDimmingStateIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SetRoomDimmingStateIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  SetRoomDimmingStateIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
