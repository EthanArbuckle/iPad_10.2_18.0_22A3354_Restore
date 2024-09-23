@implementation SARemoveFromActivityStream

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RemoveFromActivityStream");
}

+ (id)removeFromActivityStream
{
  return objc_alloc_init((Class)a1);
}

- (NSString)activityType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activityType"));
}

- (void)setActivityType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activityType"), a3);
}

- (NSDate)fromDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fromDate"));
}

- (void)setFromDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fromDate"), a3);
}

- (NSString)streamType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("streamType"));
}

- (void)setStreamType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("streamType"), a3);
}

- (NSString)taskType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskType"));
}

- (void)setTaskType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskType"), a3);
}

- (NSDate)toDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("toDate"));
}

- (void)setToDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("toDate"), a3);
}

- (NSString)visibility
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("visibility"));
}

- (void)setVisibility:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("visibility"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
