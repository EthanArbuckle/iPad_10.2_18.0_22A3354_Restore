@implementation SADialogInflectWordResponses

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dialog");
}

- (id)encodedClassName
{
  return CFSTR("InflectWordResponses");
}

+ (id)inflectWordResponses
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)inflectWordResponses
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("inflectWordResponses"), v3);
}

- (void)setInflectWordResponses:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("inflectWordResponses"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
