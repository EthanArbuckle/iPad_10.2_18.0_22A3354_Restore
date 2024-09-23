@implementation SAReminderListObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("ListObject");
}

+ (id)listObject
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

- (SAReminderRecurrence)recurrence
{
  return (SAReminderRecurrence *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recurrence"));
}

- (void)setRecurrence:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recurrence"), a3);
}

- (SAReminderTrigger)reminderTrigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reminderTrigger"));
}

- (void)setReminderTrigger:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reminderTrigger"), a3);
}

- (NSArray)reminders
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("reminders"), v3);
}

- (void)setReminders:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("reminders"), (uint64_t)a3);
}

- (NSArray)remindersToCreate
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("remindersToCreate"), v3);
}

- (void)setRemindersToCreate:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("remindersToCreate"), (uint64_t)a3);
}

- (NSNumber)totalNumOfReminders
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("totalNumOfReminders"));
}

- (void)setTotalNumOfReminders:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("totalNumOfReminders"), a3);
}

@end
