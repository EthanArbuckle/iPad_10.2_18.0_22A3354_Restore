@implementation SAUIDisambiguationGroup

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("DisambiguationGroup");
}

+ (id)disambiguationGroup
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)disambiguationLists
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("disambiguationLists"), v3);
}

- (void)setDisambiguationLists:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("disambiguationLists"), (uint64_t)a3);
}

@end
