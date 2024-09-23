@implementation SAResultObjectReference

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ResultObjectReference");
}

+ (id)resultObjectReference
{
  return objc_alloc_init((Class)a1);
}

- (NSString)className
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("className"));
}

- (void)setClassName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("className"), a3);
}

- (NSString)groupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupName"));
}

- (void)setGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupName"), a3);
}

- (NSString)referenceId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("referenceId"));
}

- (void)setReferenceId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("referenceId"), a3);
}

@end
