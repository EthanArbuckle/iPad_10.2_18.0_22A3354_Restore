@implementation SAHACommandCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("CommandCompleted");
}

+ (id)commandCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actionResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actionResults"), v3);
}

- (void)setActionResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actionResults"), (uint64_t)a3);
}

- (NSString)clientValidity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("clientValidity"));
}

- (void)setClientValidity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("clientValidity"), a3);
}

- (NSString)commandOutcome
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("commandOutcome"));
}

- (void)setCommandOutcome:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("commandOutcome"), a3);
}

- (NSURL)homeIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("homeIdentifier"));
}

- (void)setHomeIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("homeIdentifier"), a3);
}

- (NSString)serverValidity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serverValidity"));
}

- (void)setServerValidity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serverValidity"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
