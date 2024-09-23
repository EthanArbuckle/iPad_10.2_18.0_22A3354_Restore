@implementation SANavStatus

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("NavStatus");
}

+ (id)navStatus
{
  return objc_alloc_init((Class)a1);
}

- (NSString)statusValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("statusValue"));
}

- (void)setStatusValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("statusValue"), a3);
}

@end
