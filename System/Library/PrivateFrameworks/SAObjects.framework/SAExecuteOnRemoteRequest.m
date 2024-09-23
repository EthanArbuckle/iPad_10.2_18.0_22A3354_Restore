@implementation SAExecuteOnRemoteRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ExecuteOnRemoteRequest");
}

+ (id)executeOnRemoteRequest
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

- (BOOL)requiresResponseFromRemote
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("requiresResponseFromRemote"));
}

- (void)setRequiresResponseFromRemote:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("requiresResponseFromRemote"), a3);
}

- (NSData)serializedCommand
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("serializedCommand"));
}

- (void)setSerializedCommand:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("serializedCommand"), a3);
}

- (BOOL)shouldFallbackOnAWDL
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldFallbackOnAWDL"));
}

- (void)setShouldFallbackOnAWDL:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldFallbackOnAWDL"), a3);
}

- (BOOL)suppressResponse
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("suppressResponse"));
}

- (void)setSuppressResponse:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("suppressResponse"), a3);
}

- (BOOL)useGuaranteedDelivery
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("useGuaranteedDelivery"));
}

- (void)setUseGuaranteedDelivery:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("useGuaranteedDelivery"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
