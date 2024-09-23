@implementation SAIntentGroupProcessIntent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ProcessIntent");
}

+ (id)processIntent
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)allowsPunchOut
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("allowsPunchOut"));
}

- (void)setAllowsPunchOut:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("allowsPunchOut"), a3);
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intent"));
}

- (void)setIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intent"), a3);
}

- (NSArray)intentSlotKeyPaths
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("intentSlotKeyPaths"));
}

- (void)setIntentSlotKeyPaths:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("intentSlotKeyPaths"), a3);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (BOOL)shouldRunHandleIntent
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldRunHandleIntent"));
}

- (void)setShouldRunHandleIntent:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldRunHandleIntent"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
