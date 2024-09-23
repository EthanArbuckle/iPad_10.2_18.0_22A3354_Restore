@implementation SAScreenActionInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.onscreenaction");
}

- (id)encodedClassName
{
  return CFSTR("Info");
}

+ (id)info
{
  return objc_alloc_init((Class)a1);
}

- (NSString)elementId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("elementId"));
}

- (void)setElementId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("elementId"), a3);
}

- (NSArray)examples
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("examples"));
}

- (void)setExamples:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("examples"), a3);
}

- (NSString)language
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("language"));
}

- (void)setLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("language"), a3);
}

- (NSString)semanticData
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("semanticData"));
}

- (void)setSemanticData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("semanticData"), a3);
}

- (NSURL)semanticId
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("semanticId"));
}

- (void)setSemanticId:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("semanticId"), a3);
}

- (NSURL)type
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("type"), a3);
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
