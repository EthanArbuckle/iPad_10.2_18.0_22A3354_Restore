@implementation WFLinkNoteEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Note"), CFSTR("Note"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Notes (plural)"), CFSTR("Notes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Notes"));
}

@end
