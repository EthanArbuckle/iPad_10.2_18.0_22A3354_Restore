@implementation SAIntentGroupGetIntentDefinitionsResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("GetIntentDefinitionsResponse");
}

+ (id)getIntentDefinitionsResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)intentDefinitionInfos
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("intentDefinitionInfos"), v3);
}

- (void)setIntentDefinitionInfos:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("intentDefinitionInfos"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
