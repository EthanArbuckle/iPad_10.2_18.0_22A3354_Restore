@implementation SAIntentGroupProtobufMessage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ProtobufMessage");
}

+ (id)protobufMessage
{
  return objc_alloc_init((Class)a1);
}

- (NSData)data
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("data"));
}

- (void)setData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("data"), a3);
}

- (NSString)debugString
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("debugString"));
}

- (void)setDebugString:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("debugString"), a3);
}

- (NSString)typeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("typeName"));
}

- (void)setTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("typeName"), a3);
}

@end
