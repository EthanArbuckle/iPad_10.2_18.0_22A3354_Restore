@implementation SASmsGroupName

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sms");
}

- (id)encodedClassName
{
  return CFSTR("GroupName");
}

+ (id)groupName
{
  return objc_alloc_init((Class)a1);
}

- (NSString)groupName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupName"));
}

- (void)setGroupName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupName"), a3);
}

- (NSString)groupNameId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupNameId"));
}

- (void)setGroupNameId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupNameId"), a3);
}

@end
