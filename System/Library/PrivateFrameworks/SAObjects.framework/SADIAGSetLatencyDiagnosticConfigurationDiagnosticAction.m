@implementation SADIAGSetLatencyDiagnosticConfigurationDiagnosticAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.diagnostic");
}

- (id)encodedClassName
{
  return CFSTR("SetLatencyDiagnosticConfigurationDiagnosticAction");
}

+ (id)setLatencyDiagnosticConfigurationDiagnosticAction
{
  return objc_alloc_init((Class)a1);
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
