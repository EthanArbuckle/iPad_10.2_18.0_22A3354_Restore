@implementation SASVGenerateDuc

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("GenerateDuc");
}

+ (id)generateDuc
{
  return objc_alloc_init((Class)a1);
}

- (NSString)ducFamilyId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ducFamilyId"));
}

- (void)setDucFamilyId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ducFamilyId"), a3);
}

- (NSString)ducId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("ducId"));
}

- (void)setDucId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("ducId"), a3);
}

- (NSDictionary)parameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parameters"));
}

- (void)setParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parameters"), a3);
}

@end
