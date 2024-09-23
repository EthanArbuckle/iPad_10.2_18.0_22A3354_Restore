@implementation SocialConversationIntent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SocialConversationIntent)init
{
  return (SocialConversationIntent *)SocialConversationIntent.init()();
}

- (SocialConversationIntent)initWithCoder:(id)a3
{
  id v3;
  SocialConversationIntent *result;

  v3 = a3;
  SocialConversationIntent.init(coder:)();
  return result;
}

- (SocialConversationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  SocialConversationIntent *result;

  if (a3)
  {
    v5 = sub_230ADF3B4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  SocialConversationIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (SocialConversationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  sub_230ADF3B4();
  sub_230ADF3B4();
  if (a5)
    sub_230ADF384();
  return (SocialConversationIntent *)SocialConversationIntent.init(domain:verb:parametersByName:)();
}

@end
