@implementation SASetApplicationContext

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetApplicationContext");
}

+ (id)setApplicationContext
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)orderedContext
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("orderedContext"));
}

- (void)setOrderedContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("orderedContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
