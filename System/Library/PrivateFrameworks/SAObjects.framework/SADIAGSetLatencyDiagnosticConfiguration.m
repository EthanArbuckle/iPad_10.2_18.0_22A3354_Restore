@implementation SADIAGSetLatencyDiagnosticConfiguration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.diagnostic");
}

- (id)encodedClassName
{
  return CFSTR("SetLatencyDiagnosticConfiguration");
}

+ (id)setLatencyDiagnosticConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)diagnosticActions
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("diagnosticActions"), v3);
}

- (void)setDiagnosticActions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("diagnosticActions"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
