@implementation WFLinkMessageEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Link Message"), CFSTR("Message"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Messages (plural)"), CFSTR("Messages"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Messages"));
}

@end
