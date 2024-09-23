@implementation SAIntentGroupRunSiriKitExecutor

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("RunSiriKitExecutor");
}

+ (id)runSiriKitExecutor
{
  return objc_alloc_init((Class)a1);
}

- (SAIntentGroupSiriKitAppSelectionState)appSelectionState
{
  return (SAIntentGroupSiriKitAppSelectionState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appSelectionState"));
}

- (void)setAppSelectionState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appSelectionState"), a3);
}

- (SAIntentGroupAceBargeInState)bargeInState
{
  return (SAIntentGroupAceBargeInState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("bargeInState"));
}

- (void)setBargeInState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("bargeInState"), a3);
}

- (NSString)confirmationState
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("confirmationState"));
}

- (void)setConfirmationState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("confirmationState"), a3);
}

- (BOOL)directAction
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("directAction"));
}

- (void)setDirectAction:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("directAction"), a3);
}

- (BOOL)eyesFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("eyesFree"));
}

- (void)setEyesFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("eyesFree"), a3);
}

- (NSString)goalID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("goalID"));
}

- (void)setGoalID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("goalID"), a3);
}

- (SAPerson)identifiedUserMeCard
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("identifiedUserMeCard"));
}

- (void)setIdentifiedUserMeCard:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("identifiedUserMeCard"), a3);
}

- (NSString)inputOrigin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("inputOrigin"));
}

- (void)setInputOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("inputOrigin"), a3);
}

- (NSString)interactionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("interactionType"));
}

- (void)setInteractionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("interactionType"), a3);
}

- (NSString)mode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mode"));
}

- (void)setMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mode"), a3);
}

- (BOOL)multiUser
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("multiUser"));
}

- (void)setMultiUser:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("multiUser"), a3);
}

- (NSArray)parameterMetadata
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("parameterMetadata"), v3);
}

- (void)setParameterMetadata:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("parameterMetadata"), (uint64_t)a3);
}

- (NSArray)parameterPrompts
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parameterPrompts"));
}

- (void)setParameterPrompts:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parameterPrompts"), a3);
}

- (NSString)parentGoalID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("parentGoalID"));
}

- (void)setParentGoalID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("parentGoalID"), a3);
}

- (SAIntentGroupParse)parse
{
  return (SAIntentGroupParse *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("parse"));
}

- (void)setParse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("parse"), a3);
}

- (SAIntentGroupSiriKitListPosition)readingListPosition
{
  return (SAIntentGroupSiriKitListPosition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("readingListPosition"));
}

- (void)setReadingListPosition:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("readingListPosition"), a3);
}

- (SAIntentGroupSiriKitRemoteExecution)remoteExecution
{
  return (SAIntentGroupSiriKitRemoteExecution *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("remoteExecution"));
}

- (void)setRemoteExecution:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("remoteExecution"), a3);
}

- (BOOL)requiresConditionalMultiUserGrounding
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("requiresConditionalMultiUserGrounding"));
}

- (void)setRequiresConditionalMultiUserGrounding:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("requiresConditionalMultiUserGrounding"), a3);
}

- (NSString)sessionHandOffContinuityID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sessionHandOffContinuityID"));
}

- (void)setSessionHandOffContinuityID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sessionHandOffContinuityID"), a3);
}

- (SAIntentGroupSiriKitMetrics)siriKitMetrics
{
  return (SAIntentGroupSiriKitMetrics *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("siriKitMetrics"));
}

- (void)setSiriKitMetrics:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("siriKitMetrics"), a3);
}

- (BOOL)textToSpeechEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("textToSpeechEnabled"));
}

- (void)setTextToSpeechEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("textToSpeechEnabled"), a3);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
}

- (NSString)userInitiatedAction
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userInitiatedAction"));
}

- (void)setUserInitiatedAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userInitiatedAction"), a3);
}

- (NSString)usoVerb
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("usoVerb"));
}

- (void)setUsoVerb:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("usoVerb"), a3);
}

- (BOOL)voiceTriggerEnabled
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("voiceTriggerEnabled"));
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("voiceTriggerEnabled"), a3);
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
