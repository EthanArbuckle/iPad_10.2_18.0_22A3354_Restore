@implementation WFLinkListEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("List"), CFSTR("List"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Lists (plural)"), CFSTR("Lists"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Lists"));
}

@end
