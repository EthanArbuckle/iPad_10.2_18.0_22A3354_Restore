@implementation SASetNLAlertContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetNLAlertContext");
}

- (NSArray)context
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("context"), v3);
}

- (void)setContext:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("context"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
