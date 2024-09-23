@implementation SACFClientFlowUpdateScriptsCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ClientFlowUpdateScriptsCommand");
}

+ (id)clientFlowUpdateScriptsCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)scripts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("scripts"), v3);
}

- (void)setScripts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("scripts"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
