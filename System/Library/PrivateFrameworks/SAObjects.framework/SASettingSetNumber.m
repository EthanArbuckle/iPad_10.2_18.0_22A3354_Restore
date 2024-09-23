@implementation SASettingSetNumber

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetNumber");
}

+ (id)setNumber
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)increment
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("increment"));
}

- (void)setIncrement:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("increment"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
