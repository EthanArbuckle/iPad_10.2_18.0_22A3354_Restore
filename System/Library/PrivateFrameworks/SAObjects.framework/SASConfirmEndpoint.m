@implementation SASConfirmEndpoint

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("ConfirmEndpoint");
}

+ (id)confirmEndpoint
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)endpointConfirmationTimestamp
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("endpointConfirmationTimestamp"));
}

- (void)setEndpointConfirmationTimestamp:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("endpointConfirmationTimestamp"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
