@implementation SASettingSetValueResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.setting");
}

- (id)encodedClassName
{
  return CFSTR("SetValueResponse");
}

+ (id)setValueResponse
{
  return objc_alloc_init((Class)a1);
}

- (SASettingEntity)setting
{
  return (SASettingEntity *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("setting"));
}

- (void)setSetting:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("setting"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
