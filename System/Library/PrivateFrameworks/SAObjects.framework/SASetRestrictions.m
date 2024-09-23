@implementation SASetRestrictions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetRestrictions");
}

+ (id)setRestrictions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)restrictions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("restrictions"));
}

- (void)setRestrictions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("restrictions"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
