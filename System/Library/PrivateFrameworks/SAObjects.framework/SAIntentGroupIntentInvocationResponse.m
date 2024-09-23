@implementation SAIntentGroupIntentInvocationResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("IntentInvocationResponse");
}

+ (id)intentInvocationResponse
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)backgroundLaunch
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("backgroundLaunch"));
}

- (void)setBackgroundLaunch:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("backgroundLaunch"), a3);
}

- (NSString)launchId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("launchId"));
}

- (void)setLaunchId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("launchId"), a3);
}

- (NSArray)parameters
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("parameters"), v3);
}

- (void)setParameters:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("parameters"), (uint64_t)a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
