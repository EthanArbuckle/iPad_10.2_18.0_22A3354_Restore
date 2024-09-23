@implementation SAIntentGroupIntentSignal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("IntentSignal");
}

+ (id)intentSignal
{
  return objc_alloc_init((Class)a1);
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
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
