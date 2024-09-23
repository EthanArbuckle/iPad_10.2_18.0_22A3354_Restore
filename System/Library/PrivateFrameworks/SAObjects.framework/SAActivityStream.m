@implementation SAActivityStream

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ActivityStream");
}

+ (id)activityStream
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)activities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("activities"), v3);
}

- (void)setActivities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("activities"), (uint64_t)a3);
}

- (NSString)taskType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("taskType"));
}

- (void)setTaskType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("taskType"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
