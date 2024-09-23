@implementation WFLinkReminderSmartListDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Smart List"), CFSTR("Smart List"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Smart Lists (plural)"), CFSTR("Reminders"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Smart Lists"));
}

@end
