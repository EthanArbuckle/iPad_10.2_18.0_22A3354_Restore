@implementation SAUIGetResponseAlternatives

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("GetResponseAlternatives");
}

+ (id)getResponseAlternatives
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)locallyResolved
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("locallyResolved"));
}

- (void)setLocallyResolved:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("locallyResolved"), a3);
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
  return 0;
}

@end
