@implementation SAReminderSiriKitInteraction

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.reminder");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitInteraction");
}

+ (id)siriKitInteraction
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

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intentResponse"));
}

- (void)setIntentResponse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intentResponse"), a3);
}

@end
