@implementation SAFmfSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.fmf");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

- (NSData)modelData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("modelData"));
}

- (void)setModelData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("modelData"), a3);
}

@end
