@implementation SAIntentGroupResolveAppForIntent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ResolveAppForIntent");
}

+ (id)resolveAppForIntent
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)appsList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("appsList"), v3);
}

- (void)setAppsList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("appsList"), (uint64_t)a3);
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intent"));
}

- (void)setIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intent"), a3);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
