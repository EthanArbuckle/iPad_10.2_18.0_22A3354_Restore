@implementation SAIntentGroupBatchSlotResolutionResultStepResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("BatchSlotResolutionResultStepResult");
}

+ (id)batchSlotResolutionResultStepResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)base64EncodedProtobufMessage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("base64EncodedProtobufMessage"));
}

- (void)setBase64EncodedProtobufMessage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("base64EncodedProtobufMessage"), a3);
}

- (SACommandFailed)commandFailed
{
  return (SACommandFailed *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("commandFailed"));
}

- (void)setCommandFailed:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("commandFailed"), a3);
}

- (NSString)jsonEncodedSlotResolutionResult
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedSlotResolutionResult"));
}

- (void)setJsonEncodedSlotResolutionResult:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedSlotResolutionResult"), a3);
}

- (NSString)keyPath
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("keyPath"));
}

- (void)setKeyPath:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("keyPath"), a3);
}

- (NSString)typeName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("typeName"));
}

- (void)setTypeName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("typeName"), a3);
}

@end
