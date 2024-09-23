@implementation SAUIVisualResponseSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("VisualResponseSnippet");
}

- (NSData)modelData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("modelData"));
}

- (void)setModelData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("modelData"), a3);
}

- (NSString)viewIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viewIdentifier"));
}

- (void)setViewIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viewIdentifier"), a3);
}

@end
