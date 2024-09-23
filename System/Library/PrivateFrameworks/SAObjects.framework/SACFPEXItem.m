@implementation SACFPEXItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow.local.pex");
}

- (id)encodedClassName
{
  return CFSTR("Item");
}

+ (id)item
{
  return objc_alloc_init((Class)a1);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (NSString)itemSource
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("itemSource"));
}

- (void)setItemSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("itemSource"), a3);
}

- (NSNumber)score
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("score"));
}

- (void)setScore:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("score"), a3);
}

- (NSString)sourceIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sourceIdentifier"));
}

- (void)setSourceIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sourceIdentifier"), a3);
}

@end
