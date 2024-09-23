@implementation SALocalSearchSendToProtobufConduit

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("SendToProtobufConduit");
}

+ (id)sendToProtobufConduit
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)attributes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("attributes"), v3);
}

- (void)setAttributes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attributes"), (uint64_t)a3);
}

- (NSURL)endpoint
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("endpoint"));
}

- (void)setEndpoint:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("endpoint"), a3);
}

- (NSData)rawRequest
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rawRequest"));
}

- (void)setRawRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rawRequest"), a3);
}

- (int64_t)timeoutInSeconds
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("timeoutInSeconds"));
}

- (void)setTimeoutInSeconds:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("timeoutInSeconds"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
