@implementation WFLinkShortcutEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shortcut"), CFSTR("Shortcut"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shortcuts (plural)"), CFSTR("Shortcuts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Shortcuts"));
}

@end
