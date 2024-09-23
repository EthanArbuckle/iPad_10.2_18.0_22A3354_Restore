@implementation SACFFlowCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("FlowCommand");
}

+ (id)flowCommand
{
  return objc_alloc_init((Class)a1);
}

- (NSDictionary)jsDialogScripts
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsDialogScripts"));
}

- (void)setJsDialogScripts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsDialogScripts"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
