@implementation SAConstraintSupport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("ConstraintSupport");
}

+ (id)constraintSupport
{
  return objc_alloc_init((Class)a1);
}

- (SASupportCondition)condition
{
  return (SASupportCondition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("condition"));
}

- (void)setCondition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("condition"), a3);
}

- (NSString)property
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("property"));
}

- (void)setProperty:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("property"), a3);
}

@end
