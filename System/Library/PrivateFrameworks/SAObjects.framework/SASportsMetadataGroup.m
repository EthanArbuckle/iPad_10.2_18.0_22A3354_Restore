@implementation SASportsMetadataGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("MetadataGroup");
}

+ (id)metadataGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSString)groupTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupTitle"));
}

- (void)setGroupTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupTitle"), a3);
}

- (NSArray)metadata
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("metadata"), v3);
}

- (void)setMetadata:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("metadata"), (uint64_t)a3);
}

- (NSNumber)selected
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selected"));
}

- (void)setSelected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selected"), a3);
}

@end
