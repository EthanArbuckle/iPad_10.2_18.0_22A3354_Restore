@implementation SASendCommands

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SendCommands");
}

+ (id)sendCommands
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77BFF0);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
