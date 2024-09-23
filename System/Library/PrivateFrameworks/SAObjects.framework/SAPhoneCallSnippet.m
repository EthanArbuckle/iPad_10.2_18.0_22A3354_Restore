@implementation SAPhoneCallSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("CallSnippet");
}

+ (id)callSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)calls
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("calls"), v3);
}

- (void)setCalls:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("calls"), (uint64_t)a3);
}

@end
