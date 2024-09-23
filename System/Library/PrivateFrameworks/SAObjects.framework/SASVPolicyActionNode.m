@implementation SASVPolicyActionNode

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("PolicyActionNode");
}

+ (id)policyActionNode
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)children
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("children"), v3);
}

- (void)setChildren:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("children"), (uint64_t)a3);
}

- (NSString)confirmationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmationType"));
}

- (void)setConfirmationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmationType"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SASVSpeechMetadata)speechMetadata
{
  return (SASVSpeechMetadata *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("speechMetadata"));
}

- (void)setSpeechMetadata:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("speechMetadata"), a3);
}

- (NSString)type
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("type"));
}

- (void)setType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("type"), a3);
}

@end
