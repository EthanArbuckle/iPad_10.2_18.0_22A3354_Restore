@implementation SAUIAddDialogs

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AddDialogs");
}

- (NSArray)dialogs
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("dialogs"), v3);
}

- (void)setDialogs:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("dialogs"), (uint64_t)a3);
}

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listenAfterSpeaking"));
}

- (void)setListenAfterSpeaking:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listenAfterSpeaking"), a3);
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("listenAfterSpeakingBehavior"));
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("listenAfterSpeakingBehavior"), a3);
}

- (SAUIRequestEndBehavior)requestEndBehavior
{
  return (SAUIRequestEndBehavior *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("requestEndBehavior"));
}

- (void)setRequestEndBehavior:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("requestEndBehavior"), a3);
}

- (NSString)responseMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseMode"));
}

- (void)setResponseMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseMode"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
