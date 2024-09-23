@implementation SAReminderRecurrence

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Recurrence");
}

+ (id)recurrence
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)daysOfTheMonth
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("daysOfTheMonth"));
}

- (void)setDaysOfTheMonth:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("daysOfTheMonth"), a3);
}

- (NSArray)daysOfTheWeek
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("daysOfTheWeek"));
}

- (void)setDaysOfTheWeek:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("daysOfTheWeek"), a3);
}

- (NSArray)daysOfTheYear
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("daysOfTheYear"));
}

- (void)setDaysOfTheYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("daysOfTheYear"), a3);
}

- (NSString)frequencyTimeUnit
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("frequencyTimeUnit"));
}

- (void)setFrequencyTimeUnit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("frequencyTimeUnit"), a3);
}

- (int64_t)interval
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("interval"));
}

- (void)setInterval:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("interval"), a3);
}

- (NSArray)monthsOfTheYear
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("monthsOfTheYear"));
}

- (void)setMonthsOfTheYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("monthsOfTheYear"), a3);
}

- (NSArray)weeksOfTheYear
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weeksOfTheYear"));
}

- (void)setWeeksOfTheYear:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weeksOfTheYear"), a3);
}

@end
