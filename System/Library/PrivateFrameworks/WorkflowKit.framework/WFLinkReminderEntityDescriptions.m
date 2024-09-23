@implementation WFLinkReminderEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Reminder"), CFSTR("Reminder"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Reminders (plural)"), CFSTR("Reminders"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Reminders"));
}

@end
