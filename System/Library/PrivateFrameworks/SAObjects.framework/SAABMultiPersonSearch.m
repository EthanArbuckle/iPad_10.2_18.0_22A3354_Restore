@implementation SAABMultiPersonSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("MultiPersonSearch");
}

+ (id)multiPersonSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)personSearches
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("personSearches"), v3);
}

- (void)setPersonSearches:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("personSearches"), (uint64_t)a3);
}

- (NSNumber)resultsLimit
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultsLimit"));
}

- (void)setResultsLimit:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultsLimit"), a3);
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
