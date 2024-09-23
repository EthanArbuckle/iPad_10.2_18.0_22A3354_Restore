@implementation SASVDialogNode

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.vector");
}

- (id)encodedClassName
{
  return CFSTR("DialogNode");
}

+ (id)dialogNode
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

- (NSString)nodeTypeHint
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nodeTypeHint"));
}

- (void)setNodeTypeHint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nodeTypeHint"), a3);
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
