@implementation SAABContactGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("ContactGroup");
}

+ (id)contactGroup
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

- (SASource)groupSource
{
  return (SASource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("groupSource"));
}

- (void)setGroupSource:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("groupSource"), a3);
}

@end
