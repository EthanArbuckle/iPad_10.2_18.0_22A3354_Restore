@implementation SAStructuredDictationItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StructuredDictationItem");
}

+ (id)structuredDictationItem
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)resultOptions
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("resultOptions"), &unk_1EE77BF00);
}

- (void)setResultOptions:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resultOptions"), (uint64_t)a3);
}

@end
