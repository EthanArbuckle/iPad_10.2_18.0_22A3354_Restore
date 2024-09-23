@implementation SACalendarRecurrence

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.calendar");
}

- (id)encodedClassName
{
  return CFSTR("Recurrence");
}

+ (id)recurrence
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)endCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("endCount"));
}

- (void)setEndCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("endCount"), a3);
}

- (NSDate)endDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endDate"));
}

- (void)setEndDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endDate"), a3);
}

- (int)frequency
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("frequency"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SACalendarRecurrenceFrequencyForString(v2);

  return v3;
}

- (void)setFrequency:(int)a3
{
  id v4;

  stringForSACalendarRecurrenceFrequency(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("frequency"), v4);

}

- (int64_t)interval
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("interval"));
}

- (void)setInterval:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("interval"), a3);
}

@end
