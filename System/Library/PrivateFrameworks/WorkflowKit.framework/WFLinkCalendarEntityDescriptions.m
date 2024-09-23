@implementation WFLinkCalendarEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Calendar"), CFSTR("Calendar"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Calendars (plural)"), CFSTR("Calendars"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Calendars"));
}

@end
