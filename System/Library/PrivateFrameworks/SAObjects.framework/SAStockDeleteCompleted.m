@implementation SAStockDeleteCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("DeleteCompleted");
}

+ (id)deleteCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)results
{
  return (NSArray *)AceObjectURLArrayForProperty(self, (uint64_t)CFSTR("results"));
}

- (void)setResults:(id)a3
{
  AceObjectSetURLArrayForProperty(self, CFSTR("results"), a3);
}

- (NSArray)stocks
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("stocks"), v3);
}

- (void)setStocks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("stocks"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
