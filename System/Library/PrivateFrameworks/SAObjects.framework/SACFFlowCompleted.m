@implementation SACFFlowCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("FlowCompleted");
}

+ (id)flowCompleted
{
  return objc_alloc_init((Class)a1);
}

- (NSString)domain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("domain"));
}

- (void)setDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("domain"), a3);
}

- (SACFProvideContext)updateContext
{
  return (SACFProvideContext *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("updateContext"));
}

- (void)setUpdateContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("updateContext"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
