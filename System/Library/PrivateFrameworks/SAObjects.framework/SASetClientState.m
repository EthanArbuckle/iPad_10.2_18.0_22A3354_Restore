@implementation SASetClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetClientState");
}

+ (id)setClientState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)statesToSet
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("statesToSet"), v3);
}

- (void)setStatesToSet:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("statesToSet"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
