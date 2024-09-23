@implementation SAReminderObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Object");
}

+ (id)object
{
  return objc_alloc_init((Class)a1);
}

- (NSString)alternateSubject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alternateSubject"));
}

- (void)setAlternateSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alternateSubject"), a3);
}

- (BOOL)completed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("completed"));
}

- (void)setCompleted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("completed"), a3);
}

- (NSDate)dueDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dueDate"));
}

- (void)setDueDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dueDate"), a3);
}

- (NSString)dueDateTimeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dueDateTimeZoneId"));
}

- (void)setDueDateTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dueDateTimeZoneId"), a3);
}

- (BOOL)important
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("important"));
}

- (void)setImportant:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("important"), a3);
}

- (NSArray)lists
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("lists"), v3);
}

- (void)setLists:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("lists"), (uint64_t)a3);
}

- (SAReminderPayload)payload
{
  return (SAReminderPayload *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("payload"));
}

- (void)setPayload:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("payload"), a3);
}

- (SAReminderRecurrence)recurrence
{
  return (SAReminderRecurrence *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recurrence"));
}

- (void)setRecurrence:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recurrence"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (SAReminderListObject)toList
{
  return (SAReminderListObject *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("toList"));
}

- (void)setToList:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("toList"), a3);
}

- (SAReminderTrigger)trigger
{
  return (SAReminderTrigger *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("trigger"));
}

- (void)setTrigger:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("trigger"), a3);
}

@end
