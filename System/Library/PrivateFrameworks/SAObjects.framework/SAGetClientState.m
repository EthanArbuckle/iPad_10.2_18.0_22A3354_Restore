@implementation SAGetClientState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetClientState");
}

+ (id)getClientState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)statesToGet
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("statesToGet"), v3);
}

- (void)setStatesToGet:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("statesToGet"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
