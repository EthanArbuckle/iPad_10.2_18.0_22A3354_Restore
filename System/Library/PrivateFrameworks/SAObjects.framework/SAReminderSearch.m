@implementation SAReminderSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)completionStatus
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("completionStatus"));
}

- (void)setCompletionStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("completionStatus"), a3);
}

- (NSDate)dueAfter
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dueAfter"));
}

- (void)setDueAfter:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dueAfter"), a3);
}

- (NSDate)dueBefore
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dueBefore"));
}

- (void)setDueBefore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dueBefore"), a3);
}

- (NSString)listName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listName"));
}

- (void)setListName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listName"), a3);
}

- (NSString)subject
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subject"));
}

- (void)setSubject:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subject"), a3);
}

- (NSString)timeZoneId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("timeZoneId"));
}

- (void)setTimeZoneId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("timeZoneId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
