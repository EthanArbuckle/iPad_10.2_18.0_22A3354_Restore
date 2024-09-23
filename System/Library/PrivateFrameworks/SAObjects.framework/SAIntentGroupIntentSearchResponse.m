@implementation SAIntentGroupIntentSearchResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("IntentSearchResponse");
}

+ (id)intentSearchResponse
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

- (NSArray)metadata
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("metadata"), v3);
}

- (void)setMetadata:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("metadata"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
