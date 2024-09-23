@implementation SAABMultiPersonSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.contact");
}

- (id)encodedClassName
{
  return CFSTR("MultiPersonSearchCompleted");
}

+ (id)multiPersonSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)personSearchCompleteds
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("personSearchCompleteds"), v3);
}

- (void)setPersonSearchCompleteds:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("personSearchCompleteds"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
