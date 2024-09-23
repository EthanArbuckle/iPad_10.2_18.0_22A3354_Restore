@implementation SAIntentGroupSiriKitParameterMetadata

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitParameterMetadata");
}

+ (id)siriKitParameterMetadata
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)confirmationStates
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmationStates"));
}

- (void)setConfirmationStates:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmationStates"), a3);
}

- (NSString)parameterName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parameterName"));
}

- (void)setParameterName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parameterName"), a3);
}

- (BOOL)shouldResolve
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldResolve"));
}

- (void)setShouldResolve:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldResolve"), a3);
}

@end
