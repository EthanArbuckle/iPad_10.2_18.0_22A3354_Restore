@implementation SAReminderListSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("ListSearch");
}

+ (id)listSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSString)accountName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("accountName"));
}

- (void)setAccountName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("accountName"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAReminderTrigger)trigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("trigger"));
}

- (void)setTrigger:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("trigger"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
