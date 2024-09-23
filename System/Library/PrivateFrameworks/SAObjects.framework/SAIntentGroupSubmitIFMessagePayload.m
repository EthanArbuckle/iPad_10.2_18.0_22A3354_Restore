@implementation SAIntentGroupSubmitIFMessagePayload

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SubmitIFMessagePayload");
}

- (NSData)data
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("data"));
}

- (void)setData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("data"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
