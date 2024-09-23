@implementation SAUILParseExpressions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.ui.lite");
}

- (id)encodedClassName
{
  return CFSTR("ParseExpressions");
}

+ (id)parseExpressions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)expressions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("expressions"), v3);
}

- (void)setExpressions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("expressions"), (uint64_t)a3);
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("targetDevice"));
}

- (void)setTargetDevice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("targetDevice"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
