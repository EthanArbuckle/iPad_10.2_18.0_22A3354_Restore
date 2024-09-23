@implementation SAIntentGroupResolveIntentSlotCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ResolveIntentSlotCompleted");
}

+ (id)resolveIntentSlotCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupProtobufMessage)intentSlotResolutionResult
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intentSlotResolutionResult"));
}

- (void)setIntentSlotResolutionResult:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intentSlotResolutionResult"), a3);
}

- (NSString)jsonEncodedIntentSlotResolutionResult
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntentSlotResolutionResult"));
}

- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntentSlotResolutionResult"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
