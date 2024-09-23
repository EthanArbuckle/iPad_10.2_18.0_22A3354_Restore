@implementation SAIntentGroupDirectInvocation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("DirectInvocation");
}

- (NSData)data
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("data"));
}

- (void)setData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("data"), a3);
}

- (NSString)invocationIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("invocationIdentifier"));
}

- (void)setInvocationIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("invocationIdentifier"), a3);
}

@end
