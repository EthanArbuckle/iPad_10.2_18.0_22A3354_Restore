@implementation SASVPolicyAction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("PolicyAction");
}

+ (id)policyAction
{
  return objc_alloc_init((Class)a1);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SASVPolicyActionNode)policyActionRoot
{
  return (SASVPolicyActionNode *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("policyActionRoot"));
}

- (void)setPolicyActionRoot:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("policyActionRoot"), a3);
}

@end
