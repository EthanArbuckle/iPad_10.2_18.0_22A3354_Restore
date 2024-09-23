@implementation SAIntentGroupUpdateIntentSlot

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("UpdateIntentSlot");
}

+ (id)updateIntentSlot
{
  return objc_alloc_init((Class)a1);
}

- (NSString)intentSlotKeyPath
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotKeyPath"));
}

- (void)setIntentSlotKeyPath:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotKeyPath"), a3);
}

- (SAIntentGroupProtobufMessage)intentSlotResolutionResult
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intentSlotResolutionResult"));
}

- (void)setIntentSlotResolutionResult:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intentSlotResolutionResult"), a3);
}

- (NSNumber)intentSlotValueIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotValueIndex"));
}

- (void)setIntentSlotValueIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotValueIndex"), a3);
}

- (NSString)intentTypeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentTypeName"));
}

- (void)setIntentTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentTypeName"), a3);
}

- (NSString)jsonEncodedIntentSlotResolutionResult
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntentSlotResolutionResult"));
}

- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntentSlotResolutionResult"), a3);
}

- (SAIntentGroupProtobufMessage)location
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("location"));
}

- (void)setLocation:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("location"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
