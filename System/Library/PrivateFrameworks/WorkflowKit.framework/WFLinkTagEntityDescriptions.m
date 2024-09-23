@implementation WFLinkTagEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tag"), CFSTR("Tag"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tags (plural)"), CFSTR("Tags"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Tags"));
}

@end
