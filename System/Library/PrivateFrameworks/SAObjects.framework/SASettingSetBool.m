@implementation SASettingSetBool

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetBool");
}

+ (id)setBool
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)toggle
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("toggle"));
}

- (void)setToggle:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("toggle"), a3);
}

- (BOOL)value
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("value"));
}

- (void)setValue:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("value"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
