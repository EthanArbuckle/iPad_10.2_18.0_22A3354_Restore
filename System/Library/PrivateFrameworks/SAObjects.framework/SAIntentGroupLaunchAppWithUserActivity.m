@implementation SAIntentGroupLaunchAppWithUserActivity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("LaunchAppWithUserActivity");
}

+ (id)launchAppWithUserActivity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)userActivityIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userActivityIdentifier"));
}

- (void)setUserActivityIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userActivityIdentifier"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
