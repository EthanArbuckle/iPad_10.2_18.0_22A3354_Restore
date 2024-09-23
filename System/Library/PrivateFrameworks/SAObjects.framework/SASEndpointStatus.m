@implementation SASEndpointStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("EndpointStatus");
}

+ (id)endpointStatus
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)confirmed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("confirmed"));
}

- (void)setConfirmed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("confirmed"), a3);
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
  return 0;
}

@end
