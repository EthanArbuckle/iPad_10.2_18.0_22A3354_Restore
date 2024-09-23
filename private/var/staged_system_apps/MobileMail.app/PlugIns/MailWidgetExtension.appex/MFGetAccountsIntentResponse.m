@implementation MFGetAccountsIntentResponse

- (int64_t)code
{
  MFGetAccountsIntentResponse *v2;
  int64_t v5;

  v2 = self;
  v5 = MFGetAccountsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  MFGetAccountsIntentResponse *v3;

  v3 = self;
  sub_10006F2B0(a3);

}

- (MFGetAccountsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (MFGetAccountsIntentResponse)init
{
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init()();
}

- (MFGetAccountsIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(coder:)(a3);
}

- (MFGetAccountsIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(backingStore:)(a3);
}

- (MFGetAccountsIntentResponse)initWithPropertiesByName:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  if (a3)
  {
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(propertiesByName:)(v6);
}

@end
