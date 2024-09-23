@implementation SAIntentGroupLaunchAppWithIntent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("LaunchAppWithIntent");
}

+ (id)launchAppWithIntent
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)doNotDismissSiri
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("doNotDismissSiri"));
}

- (void)setDoNotDismissSiri:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("doNotDismissSiri"), a3);
}

- (SAIntentGroupProtobufMessage)handledIntent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("handledIntent"));
}

- (void)setHandledIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("handledIntent"), a3);
}

- (SAIntentGroupProtobufMessage)handledIntentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("handledIntentResponse"));
}

- (void)setHandledIntentResponse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("handledIntentResponse"), a3);
}

- (NSString)jsonEncodedHandledIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedHandledIntent"));
}

- (void)setJsonEncodedHandledIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedHandledIntent"), a3);
}

- (NSString)jsonEncodedHandledIntentResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedHandledIntentResponse"));
}

- (void)setJsonEncodedHandledIntentResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedHandledIntentResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
