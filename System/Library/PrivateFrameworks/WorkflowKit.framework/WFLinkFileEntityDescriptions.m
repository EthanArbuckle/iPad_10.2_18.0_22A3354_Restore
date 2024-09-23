@implementation WFLinkFileEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Link File"), CFSTR("File"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Files (plural)"), CFSTR("Files"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Files"));
}

@end
