@implementation SAUISetURLData

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("SetURLData");
}

+ (id)setURLData
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)urlData
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("urlData"), v3);
}

- (void)setUrlData:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("urlData"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
