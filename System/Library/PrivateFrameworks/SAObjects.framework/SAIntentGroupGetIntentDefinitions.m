@implementation SAIntentGroupGetIntentDefinitions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("GetIntentDefinitions");
}

+ (id)getIntentDefinitions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)queries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("queries"), v3);
}

- (void)setQueries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("queries"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
