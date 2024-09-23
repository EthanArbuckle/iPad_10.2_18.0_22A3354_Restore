@implementation SACancelCrossDeviceRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("CancelCrossDeviceRequest");
}

- (BOOL)cancelAssociatedRequests
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("cancelAssociatedRequests"));
}

- (void)setCancelAssociatedRequests:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("cancelAssociatedRequests"), a3);
}

- (NSString)requestId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestId"));
}

- (void)setRequestId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
