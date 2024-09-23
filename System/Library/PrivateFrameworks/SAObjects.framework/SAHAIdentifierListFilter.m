@implementation SAHAIdentifierListFilter

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.homeautomation");
}

- (id)encodedClassName
{
  return CFSTR("IdentifierListFilter");
}

+ (id)identifierListFilter
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)identifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("identifiers"));
}

- (void)setIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("identifiers"), a3);
}

@end
