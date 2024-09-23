@implementation GetAcitivitySummaryIntentResponse

- (int64_t)code
{
  GetAcitivitySummaryIntentResponse *v2;
  int64_t AcitivitySummaryIntent;

  v2 = self;
  AcitivitySummaryIntent = GetAcitivitySummaryIntentResponse.code.getter();

  return AcitivitySummaryIntent;
}

- (void)setCode:(int64_t)a3
{
  GetAcitivitySummaryIntentResponse *v3;

  v3 = self;
  GetAcitivitySummaryIntentResponse.code.setter(a3);

}

- (GetAcitivitySummaryIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4;

  v4 = a4;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetAcitivitySummaryIntentResponse)init
{
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init()();
}

- (GetAcitivitySummaryIntentResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(coder:)(a3);
}

- (GetAcitivitySummaryIntentResponse)initWithBackingStore:(id)a3
{
  id v3;

  v3 = a3;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(backingStore:)(a3);
}

- (GetAcitivitySummaryIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(propertiesByName:)(v6);
}

@end
