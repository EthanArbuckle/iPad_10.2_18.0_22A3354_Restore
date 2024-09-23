@implementation SAIntentGroupIntentDefinitionInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("IntentDefinitionInfo");
}

+ (id)intentDefinitionInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSData)intentDefinition
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentDefinition"));
}

- (void)setIntentDefinition:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentDefinition"), a3);
}

@end
