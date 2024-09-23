@implementation SAStructuredDictationResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StructuredDictationResult");
}

+ (id)structuredDictationResult
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)items
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("items"), v3);
}

- (void)setItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("items"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
