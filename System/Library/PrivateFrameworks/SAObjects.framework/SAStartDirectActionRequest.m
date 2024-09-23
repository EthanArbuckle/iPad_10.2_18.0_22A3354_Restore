@implementation SAStartDirectActionRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartDirectActionRequest");
}

+ (id)startDirectActionRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)directAction
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directAction"));
}

- (void)setDirectAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directAction"), a3);
}

- (NSDictionary)requestExecutionParameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestExecutionParameters"));
}

- (void)setRequestExecutionParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestExecutionParameters"), a3);
}

- (NSString)utteranceFromRequestParameters
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utteranceFromRequestParameters"));
}

- (void)setUtteranceFromRequestParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utteranceFromRequestParameters"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
