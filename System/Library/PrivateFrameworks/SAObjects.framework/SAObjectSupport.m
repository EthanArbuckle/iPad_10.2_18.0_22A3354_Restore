@implementation SAObjectSupport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ObjectSupport");
}

+ (id)objectSupport
{
  return objc_alloc_init((Class)a1);
}

- (NSString)aceVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("aceVersion"));
}

- (void)setAceVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("aceVersion"), a3);
}

- (NSString)classId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("classId"));
}

- (void)setClassId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("classId"), a3);
}

- (NSString)groupId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupId"));
}

- (void)setGroupId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupId"), a3);
}

- (NSArray)supportedProperties
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("supportedProperties"));
}

- (void)setSupportedProperties:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("supportedProperties"), a3);
}

@end
