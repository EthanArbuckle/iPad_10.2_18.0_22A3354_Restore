@implementation SARollbackRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RollbackRequest");
}

+ (id)rollbackRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSString)reason
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("reason"));
}

- (void)setReason:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("reason"), a3);
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
