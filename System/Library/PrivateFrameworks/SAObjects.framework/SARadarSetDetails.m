@implementation SARadarSetDetails

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.radar");
}

- (id)encodedClassName
{
  return CFSTR("SetDetails");
}

+ (id)setDetails
{
  return objc_alloc_init((Class)a1);
}

- (NSString)classification
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("classification"));
}

- (void)setClassification:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("classification"), a3);
}

- (NSString)description
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("description"));
}

- (void)setDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("description"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
