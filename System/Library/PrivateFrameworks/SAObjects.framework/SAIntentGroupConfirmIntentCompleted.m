@implementation SAIntentGroupConfirmIntentCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ConfirmIntentCompleted");
}

+ (id)confirmIntentCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intentResponse"));
}

- (void)setIntentResponse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intentResponse"), a3);
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntentResponse"));
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntentResponse"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
