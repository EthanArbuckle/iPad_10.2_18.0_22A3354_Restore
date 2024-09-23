@implementation SAIntentGroupSupportedIntentResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SupportedIntentResponse");
}

+ (id)supportedIntentResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)commands
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("commands"), v3);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (NSString)useCaseId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("useCaseId"));
}

- (void)setUseCaseId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("useCaseId"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
