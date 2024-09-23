@implementation SAExecuteOnRemoteResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ExecuteOnRemoteResponse");
}

+ (id)executeOnRemoteResponse
{
  return objc_alloc_init((Class)a1);
}

- (SARemoteDevice)remoteDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("remoteDevice"));
}

- (void)setRemoteDevice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("remoteDevice"), a3);
}

- (BOOL)responseFromRemote
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("responseFromRemote"));
}

- (void)setResponseFromRemote:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("responseFromRemote"), a3);
}

- (SAAceCommand)result
{
  return (SAAceCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("result"));
}

- (void)setResult:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("result"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
