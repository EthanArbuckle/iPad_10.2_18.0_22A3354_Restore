@implementation WFLinkConversationEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Conversation"), CFSTR("Conversation"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Conversations (plural)"), CFSTR("Conversations"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Conversations"));
}

@end
