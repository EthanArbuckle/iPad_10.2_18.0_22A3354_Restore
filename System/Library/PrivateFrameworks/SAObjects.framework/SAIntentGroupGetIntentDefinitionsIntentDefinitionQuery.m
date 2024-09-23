@implementation SAIntentGroupGetIntentDefinitionsIntentDefinitionQuery

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("GetIntentDefinitionsIntentDefinitionQuery");
}

+ (id)getIntentDefinitionsIntentDefinitionQuery
{
  return objc_alloc_init((Class)a1);
}

- (NSString)entity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("entity"));
}

- (void)setEntity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("entity"), a3);
}

- (NSString)verb
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("verb"));
}

- (void)setVerb:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("verb"), a3);
}

@end
