@implementation SAErrorIndicatorStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ErrorIndicatorStatus");
}

+ (id)errorIndicatorStatus
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)deviceFixingProblems
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("deviceFixingProblems"));
}

- (void)setDeviceFixingProblems:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("deviceFixingProblems"), a3);
}

- (NSArray)values
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("values"));
}

- (void)setValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("values"), a3);
}

@end
