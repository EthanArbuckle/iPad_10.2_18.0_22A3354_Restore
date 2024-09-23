@implementation SADIAGLatencyDiagnosticReportDiagnosticReport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.diagnostic");
}

- (id)encodedClassName
{
  return CFSTR("LatencyDiagnosticReportDiagnosticReport");
}

+ (id)latencyDiagnosticReportDiagnosticReport
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)latency
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("latency"));
}

- (void)setLatency:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("latency"), a3);
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("uri"));
}

- (void)setUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("uri"), a3);
}

- (NSString)verb
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("verb"));
}

- (void)setVerb:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("verb"), a3);
}

@end
