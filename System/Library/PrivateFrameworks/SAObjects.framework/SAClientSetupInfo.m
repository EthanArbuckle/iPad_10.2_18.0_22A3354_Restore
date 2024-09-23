@implementation SAClientSetupInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ClientSetupInfo");
}

+ (id)clientSetupInfo
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)delay
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("delay"));
}

- (void)setDelay:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("delay"), a3);
}

- (double)threshold
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("threshold"));
}

- (void)setThreshold:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("threshold"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
