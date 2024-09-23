@implementation SASportsEntityGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sports");
}

- (id)encodedClassName
{
  return CFSTR("EntityGroup");
}

+ (id)entityGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)entities
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("entities"), v3);
}

- (void)setEntities:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("entities"), (uint64_t)a3);
}

- (NSString)groupType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("groupType"));
}

- (void)setGroupType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("groupType"), a3);
}

@end
