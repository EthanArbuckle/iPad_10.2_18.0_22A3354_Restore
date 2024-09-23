@implementation SARDNativeFlowContextUpdate

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("NativeFlowContextUpdate");
}

- (NSArray)applicationContext
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("applicationContext"), v3);
}

- (void)setApplicationContext:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("applicationContext"), (uint64_t)a3);
}

- (NSArray)attachments
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("attachments"), &unk_1EE77BF00);
}

- (void)setAttachments:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("attachments"), (uint64_t)a3);
}

- (NSArray)clientFlowUpdateContextList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("clientFlowUpdateContextList"), v3);
}

- (void)setClientFlowUpdateContextList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("clientFlowUpdateContextList"), (uint64_t)a3);
}

- (NSData)pegasusConversationContext
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pegasusConversationContext"));
}

- (void)setPegasusConversationContext:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pegasusConversationContext"), a3);
}

- (NSData)promptContextProto
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("promptContextProto"));
}

- (void)setPromptContextProto:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("promptContextProto"), a3);
}

- (BOOL)resetFlowTaskState
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("resetFlowTaskState"));
}

- (void)setResetFlowTaskState:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("resetFlowTaskState"), a3);
}

- (SAIntentGroupSiriKitMetrics)siriKitMetrics
{
  return (SAIntentGroupSiriKitMetrics *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("siriKitMetrics"));
}

- (void)setSiriKitMetrics:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("siriKitMetrics"), a3);
}

- (SASVSystemDialogActOutput)systemDialogActOutput
{
  return (SASVSystemDialogActOutput *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("systemDialogActOutput"));
}

- (void)setSystemDialogActOutput:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("systemDialogActOutput"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
