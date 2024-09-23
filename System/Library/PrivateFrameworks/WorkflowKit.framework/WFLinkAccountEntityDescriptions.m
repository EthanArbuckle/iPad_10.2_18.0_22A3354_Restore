@implementation WFLinkAccountEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Account"), CFSTR("Account"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Accounts (plural)"), CFSTR("Accounts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Accounts"));
}

@end
