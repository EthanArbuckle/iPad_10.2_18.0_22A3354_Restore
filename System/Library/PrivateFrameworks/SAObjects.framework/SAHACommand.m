@implementation SAHACommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("Command");
}

+ (id)command
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actionRequests
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actionRequests"), v3);
}

- (void)setActionRequests:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actionRequests"), (uint64_t)a3);
}

- (NSArray)actions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("actions"), v3);
}

- (void)setActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("actions"), (uint64_t)a3);
}

- (NSNumber)commandTimeout
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("commandTimeout"));
}

- (void)setCommandTimeout:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("commandTimeout"), a3);
}

- (SAHAFilter)filter
{
  return (SAHAFilter *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("filter"));
}

- (void)setFilter:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("filter"), a3);
}

- (BOOL)mutatingCommand
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("mutatingCommand"));
}

- (void)setMutatingCommand:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("mutatingCommand"), a3);
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
