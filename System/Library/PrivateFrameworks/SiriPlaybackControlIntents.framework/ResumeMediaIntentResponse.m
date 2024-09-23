@implementation ResumeMediaIntentResponse

- (ResumeMediaIntentResponse)init
{
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
  sub_22482825C(a3);
}

- (int64_t)code
{
  return sub_2248282BC();
}

- (ResumeMediaIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  ResumeMediaIntentResponse *result;

  v3 = a3;
  ResumeMediaIntentResponse.init(backingStore:)();
  return result;
}

- (ResumeMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (ResumeMediaIntentResponse *)ResumeMediaIntentResponse.init(code:userActivity:)(a3, a4);
}

- (ResumeMediaIntentResponse)initWithCoder:(id)a3
{
  id v3;
  ResumeMediaIntentResponse *result;

  v3 = a3;
  ResumeMediaIntentResponse.init(coder:)();
  return result;
}

- (ResumeMediaIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  ResumeMediaIntentResponse *result;

  if (a3)
    v3 = sub_2249ECD68();
  else
    v3 = 0;
  ResumeMediaIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
