@implementation SACFPEXResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow.local.pex");
}

- (id)encodedClassName
{
  return CFSTR("Response");
}

+ (id)response
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)pexItems
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("pexItems"), v3);
}

- (void)setPexItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("pexItems"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
