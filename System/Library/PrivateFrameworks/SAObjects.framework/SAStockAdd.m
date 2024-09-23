@implementation SAStockAdd

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.stock");
}

- (id)encodedClassName
{
  return CFSTR("Add");
}

+ (id)add
{
  return objc_alloc_init((Class)a1);
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
  return 1;
}

@end
