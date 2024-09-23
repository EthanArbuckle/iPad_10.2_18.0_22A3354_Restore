@implementation WFLinkTabGroupEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tab Group"), CFSTR("Tab Group"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Tab Groups (plural)"), CFSTR("Tab Groups"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Tab Groups"));
}

@end
