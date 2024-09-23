@implementation SACFFetchScriptResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("FetchScriptResponse");
}

+ (id)fetchScriptResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)flowScripts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("flowScripts"), v3);
}

- (void)setFlowScripts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("flowScripts"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
