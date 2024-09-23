@implementation SAIntentGroupProcessIntentCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("ProcessIntentCompleted");
}

+ (id)processIntentCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupBatchSlotResolutionResult)batchSlotResolutionResult
{
  return (SAIntentGroupBatchSlotResolutionResult *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("batchSlotResolutionResult"));
}

- (void)setBatchSlotResolutionResult:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("batchSlotResolutionResult"), a3);
}

- (SAIntentGroupConfirmIntentCompleted)confirmIntentCompleted
{
  return (SAIntentGroupConfirmIntentCompleted *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("confirmIntentCompleted"));
}

- (void)setConfirmIntentCompleted:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("confirmIntentCompleted"), a3);
}

- (SAIntentGroupHandleIntentCompleted)handleIntentCompleted
{
  return (SAIntentGroupHandleIntentCompleted *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("handleIntentCompleted"));
}

- (void)setHandleIntentCompleted:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("handleIntentCompleted"), a3);
}

- (NSString)lastAttemptedStep
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lastAttemptedStep"));
}

- (void)setLastAttemptedStep:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lastAttemptedStep"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
