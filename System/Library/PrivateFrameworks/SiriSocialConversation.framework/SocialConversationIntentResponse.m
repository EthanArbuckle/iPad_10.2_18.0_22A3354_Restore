@implementation SocialConversationIntentResponse

- (int64_t)code
{
  return sub_230ADECC8();
}

- (void)setCode:(int64_t)a3
{
  sub_230ADED2C(a3);
}

- (SocialConversationIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;

  v6 = a4;
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SocialConversationIntentResponse)init
{
  return (SocialConversationIntentResponse *)SocialConversationIntentResponse.init()();
}

- (SocialConversationIntentResponse)initWithCoder:(id)a3
{
  id v3;
  SocialConversationIntentResponse *result;

  v3 = a3;
  SocialConversationIntentResponse.init(coder:)();
  return result;
}

- (SocialConversationIntentResponse)initWithBackingStore:(id)a3
{
  id v3;
  SocialConversationIntentResponse *result;

  v3 = a3;
  SocialConversationIntentResponse.init(backingStore:)();
  return result;
}

- (SocialConversationIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;
  SocialConversationIntentResponse *result;

  if (a3)
    v3 = sub_230ADF384();
  else
    v3 = 0;
  SocialConversationIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end
