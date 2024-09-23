@implementation SAGetMultipleClientStates

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("GetMultipleClientStates");
}

+ (id)getMultipleClientStates
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clientStateGetters
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("clientStateGetters"), &unk_1EE780850);
}

- (void)setClientStateGetters:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clientStateGetters"), (uint64_t)a3);
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
