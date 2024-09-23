@implementation SACalendarRange

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CalendarRange");
}

+ (id)calendarRange
{
  return objc_alloc_init((Class)a1);
}

- (SACalendar)end
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("end"));
}

- (void)setEnd:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("end"), a3);
}

- (SACalendar)start
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("start"));
}

- (void)setStart:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("start"), a3);
}

@end
