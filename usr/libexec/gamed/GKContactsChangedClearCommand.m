@implementation GKContactsChangedClearCommand

- (id)executeWithContext:(id)a3
{
  objc_msgSend(a3, "_gkClearAllEntriesOfEntity:", CFSTR("ContactInfo"));
  return 0;
}

@end
