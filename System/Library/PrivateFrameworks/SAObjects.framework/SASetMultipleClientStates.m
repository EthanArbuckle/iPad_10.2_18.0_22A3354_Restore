@implementation SASetMultipleClientStates

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetMultipleClientStates");
}

+ (id)setMultipleClientStates
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clientStateSetters
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("clientStateSetters"), &unk_1EE785760);
}

- (void)setClientStateSetters:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clientStateSetters"), (uint64_t)a3);
}

- (NSArray)failedGetters
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("failedGetters"), v3);
}

- (void)setFailedGetters:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("failedGetters"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
