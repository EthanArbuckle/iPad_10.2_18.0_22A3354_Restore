@implementation WFLinkFolderEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Folder"), CFSTR("Folder"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Folders (plural)"), CFSTR("Folders"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Folders"));
}

@end
