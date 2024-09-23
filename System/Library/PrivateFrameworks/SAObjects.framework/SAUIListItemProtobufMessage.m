@implementation SAUIListItemProtobufMessage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("ListItemProtobufMessage");
}

+ (id)listItemProtobufMessage
{
  return objc_alloc_init((Class)a1);
}

- (NSData)dynamicURLImageResourceData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dynamicURLImageResourceData"));
}

- (void)setDynamicURLImageResourceData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dynamicURLImageResourceData"), a3);
}

- (NSData)dynamicURLImageResourceDataEvodBumper
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dynamicURLImageResourceDataEvodBumper"));
}

- (void)setDynamicURLImageResourceDataEvodBumper:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dynamicURLImageResourceDataEvodBumper"), a3);
}

@end
