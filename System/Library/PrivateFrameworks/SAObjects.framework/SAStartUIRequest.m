@implementation SAStartUIRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartUIRequest");
}

+ (id)startUIRequest
{
  return objc_alloc_init((Class)a1);
}

- (SAStartRequest)startRequest
{
  return (SAStartRequest *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("startRequest"));
}

- (void)setStartRequest:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("startRequest"), a3);
}

- (SAStartLocalRequest)startLocalRequest
{
  return (SAStartLocalRequest *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("startLocalRequest"));
}

- (void)setStartLocalRequest:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("startLocalRequest"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
