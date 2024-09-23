@implementation SAStockSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("SearchCompleted");
}

+ (id)searchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)stockReferences
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("stockReferences"), v3);
}

- (void)setStockReferences:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("stockReferences"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
