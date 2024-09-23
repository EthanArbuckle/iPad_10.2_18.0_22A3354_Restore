@implementation SASTTemplateContentRating

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.templates");
}

- (id)encodedClassName
{
  return CFSTR("TemplateContentRating");
}

- (NSString)system
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("system"));
}

- (void)setSystem:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("system"), a3);
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
