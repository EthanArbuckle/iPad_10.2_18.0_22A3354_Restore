@implementation SAGetResultObjects

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetResultObjects");
}

+ (id)getResultObjects
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)objectIdentifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("objectIdentifiers"));
}

- (void)setObjectIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("objectIdentifiers"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
