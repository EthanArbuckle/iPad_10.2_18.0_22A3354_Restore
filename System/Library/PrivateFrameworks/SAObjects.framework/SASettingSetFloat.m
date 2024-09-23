@implementation SASettingSetFloat

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetFloat");
}

+ (id)setFloat
{
  return objc_alloc_init((Class)a1);
}

- (float)value
{
  return AceObjectFloatForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(float)a3
{
  AceObjectSetFloatForProperty(self, CFSTR("value"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
