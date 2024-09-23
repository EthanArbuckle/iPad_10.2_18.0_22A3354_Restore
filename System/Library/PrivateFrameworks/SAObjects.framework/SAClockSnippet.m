@implementation SAClockSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clock");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clocks
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("clocks"), v3);
}

- (void)setClocks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clocks"), (uint64_t)a3);
}

@end
