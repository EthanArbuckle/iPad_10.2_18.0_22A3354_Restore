@implementation SASettingSetValue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetValue");
}

+ (id)setValue
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)dryRun
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("dryRun"));
}

- (void)setDryRun:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("dryRun"), a3);
}

- (BOOL)failOnSiriDisconnectWarnings
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("failOnSiriDisconnectWarnings"));
}

- (void)setFailOnSiriDisconnectWarnings:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("failOnSiriDisconnectWarnings"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
