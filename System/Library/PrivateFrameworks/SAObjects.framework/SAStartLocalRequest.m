@implementation SAStartLocalRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartLocalRequest");
}

+ (id)startLocalRequest
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)clientBoundCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("clientBoundCommands"), &unk_1EE77C568);
}

- (void)setClientBoundCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clientBoundCommands"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
