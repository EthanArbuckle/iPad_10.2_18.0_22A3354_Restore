@implementation SACFClientFlowRequestCallback

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("ClientFlowRequestCallback");
}

+ (id)clientFlowRequestCallback
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)applicationContextObjects
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("applicationContextObjects"), v3);
}

- (void)setApplicationContextObjects:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("applicationContextObjects"), (uint64_t)a3);
}

- (NSArray)conversationStateAttachments
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("conversationStateAttachments"), &unk_1EE77BF00);
}

- (void)setConversationStateAttachments:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("conversationStateAttachments"), (uint64_t)a3);
}

- (NSArray)dictationPromptAbortValues
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dictationPromptAbortValues"));
}

- (void)setDictationPromptAbortValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dictationPromptAbortValues"), a3);
}

- (NSString)dictationPromptTargetDomain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dictationPromptTargetDomain"));
}

- (void)setDictationPromptTargetDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dictationPromptTargetDomain"), a3);
}

- (NSArray)dictationPromptTargetNodes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dictationPromptTargetNodes"));
}

- (void)setDictationPromptTargetNodes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dictationPromptTargetNodes"), a3);
}

- (NSArray)disambiguationPromptAbortValues
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disambiguationPromptAbortValues"));
}

- (void)setDisambiguationPromptAbortValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disambiguationPromptAbortValues"), a3);
}

- (NSNumber)disambiguationPromptAmbiguityId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disambiguationPromptAmbiguityId"));
}

- (void)setDisambiguationPromptAmbiguityId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disambiguationPromptAmbiguityId"), a3);
}

- (NSArray)disambiguationPromptResponseTargets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disambiguationPromptResponseTargets"));
}

- (void)setDisambiguationPromptResponseTargets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disambiguationPromptResponseTargets"), a3);
}

- (NSString)disambiguationPromptTargetDomain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("disambiguationPromptTargetDomain"));
}

- (void)setDisambiguationPromptTargetDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("disambiguationPromptTargetDomain"), a3);
}

- (NSArray)displayHintsAsJson
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayHintsAsJson"));
}

- (void)setDisplayHintsAsJson:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayHintsAsJson"), a3);
}

- (NSString)nlInput
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("nlInput"));
}

- (void)setNlInput:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("nlInput"), a3);
}

- (NSNumber)objectDisambiguation
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("objectDisambiguation"));
}

- (void)setObjectDisambiguation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("objectDisambiguation"), a3);
}

- (BOOL)shouldResetFlowTaskState
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldResetFlowTaskState"));
}

- (void)setShouldResetFlowTaskState:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldResetFlowTaskState"), a3);
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

- (NSArray)weightedPromptAbortValues
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weightedPromptAbortValues"));
}

- (void)setWeightedPromptAbortValues:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weightedPromptAbortValues"), a3);
}

- (NSArray)weightedPromptResponseOptions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weightedPromptResponseOptions"));
}

- (void)setWeightedPromptResponseOptions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weightedPromptResponseOptions"), a3);
}

- (NSArray)weightedPromptResponseTargets
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weightedPromptResponseTargets"));
}

- (void)setWeightedPromptResponseTargets:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weightedPromptResponseTargets"), a3);
}

- (NSNumber)weightedPromptStrict
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weightedPromptStrict"));
}

- (void)setWeightedPromptStrict:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weightedPromptStrict"), a3);
}

- (NSString)weightedPromptTargetDomain
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("weightedPromptTargetDomain"));
}

- (void)setWeightedPromptTargetDomain:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("weightedPromptTargetDomain"), a3);
}

@end
