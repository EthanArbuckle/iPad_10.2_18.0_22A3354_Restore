@implementation SAHLShowActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("ShowActivity");
}

+ (id)showActivity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)activityDataType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activityDataType"));
}

- (void)setActivityDataType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activityDataType"), a3);
}

- (NSString)activityView
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activityView"));
}

- (void)setActivityView:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activityView"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
