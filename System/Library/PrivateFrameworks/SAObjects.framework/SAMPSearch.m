@implementation SAMPSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)constraints
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("constraints"), v3);
}

- (void)setConstraints:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("constraints"), (uint64_t)a3);
}

- (int64_t)maxResults
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("maxResults"));
}

- (void)setMaxResults:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("maxResults"), a3);
}

- (NSArray)searchTypes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("searchTypes"));
}

- (void)setSearchTypes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("searchTypes"), a3);
}

- (BOOL)strict
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("strict"));
}

- (void)setStrict:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("strict"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
