@implementation WFLinkBookEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Book"), CFSTR("Book"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Books (plural)"), CFSTR("Books"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Books"));
}

@end
