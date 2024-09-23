@implementation SADIAGLatencyDiagnosticReport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.diagnostic");
}

- (id)encodedClassName
{
  return CFSTR("LatencyDiagnosticReport");
}

+ (id)latencyDiagnosticReport
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)diagnosticReports
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("diagnosticReports"), v3);
}

- (void)setDiagnosticReports:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("diagnosticReports"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
