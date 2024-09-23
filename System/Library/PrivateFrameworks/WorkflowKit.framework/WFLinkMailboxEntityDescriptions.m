@implementation WFLinkMailboxEntityDescriptions

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Mailbox"), CFSTR("Mailbox"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Mailboxes (plural)"), CFSTR("Mailboxes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Mailboxes"));
}

@end
