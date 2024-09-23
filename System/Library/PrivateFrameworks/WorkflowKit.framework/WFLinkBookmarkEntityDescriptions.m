@implementation WFLinkBookmarkEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Bookmark"), CFSTR("Bookmark"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Bookmarks (plural)"), CFSTR("Bookmarks"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Bookmarks"));
}

@end
