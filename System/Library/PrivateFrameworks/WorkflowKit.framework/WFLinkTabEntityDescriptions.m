@implementation WFLinkTabEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tab"), CFSTR("Tab"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tabs (plural)"), CFSTR("Tabs"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Tabs"));
}

@end
