@implementation SAGKAlternateResultsPod

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.generalknowledge");
}

- (id)encodedClassName
{
  return CFSTR("AlternateResultsPod");
}

+ (id)alternateResultsPod
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)alternateResults
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("alternateResults"), v3);
}

- (void)setAlternateResults:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("alternateResults"), (uint64_t)a3);
}

@end
