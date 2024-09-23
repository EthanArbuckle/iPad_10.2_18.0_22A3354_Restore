@implementation SAPhoneSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("SearchCompleted");
}

+ (id)searchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)phoneSearchResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("phoneSearchResults"), v3);
}

- (void)setPhoneSearchResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("phoneSearchResults"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
