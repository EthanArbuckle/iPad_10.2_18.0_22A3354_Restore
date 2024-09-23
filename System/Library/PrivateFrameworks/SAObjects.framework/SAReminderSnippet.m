@implementation SAReminderSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)reminderLists
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("reminderLists"), v3);
}

- (void)setReminderLists:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("reminderLists"), (uint64_t)a3);
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

@end
