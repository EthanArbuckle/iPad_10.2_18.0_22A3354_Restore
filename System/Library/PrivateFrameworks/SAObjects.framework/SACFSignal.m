@implementation SACFSignal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("Signal");
}

+ (id)signal
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

- (NSString)flowScriptHint
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("flowScriptHint"));
}

- (void)setFlowScriptHint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("flowScriptHint"), a3);
}

- (NSArray)scriptIdentifiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("scriptIdentifiers"));
}

- (void)setScriptIdentifiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("scriptIdentifiers"), a3);
}

- (SACFAbstractClientCommand)signalPayload
{
  return (SACFAbstractClientCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("signalPayload"));
}

- (void)setSignalPayload:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("signalPayload"), a3);
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
