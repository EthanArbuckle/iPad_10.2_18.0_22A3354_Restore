@implementation SALocalSearchSendToProtobufConduitCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("SendToProtobufConduitCompleted");
}

+ (id)sendToProtobufConduitCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSData)rawResponse
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rawResponse"));
}

- (void)setRawResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rawResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
