@implementation SASportsMetadata

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("Metadata");
}

+ (id)metadata
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)average
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("average"));
}

- (void)setAverage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("average"), a3);
}

- (NSString)identifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifier"));
}

- (void)setIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifier"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (NSNumber)selected
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("selected"));
}

- (void)setSelected:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("selected"), a3);
}

- (NSString)value
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("value"));
}

- (void)setValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("value"), a3);
}

@end
