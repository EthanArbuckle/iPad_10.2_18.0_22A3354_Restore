@implementation WFLinkViewEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("View"), CFSTR("View"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Views (plural)"), CFSTR("Views"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Views"));
}

@end
