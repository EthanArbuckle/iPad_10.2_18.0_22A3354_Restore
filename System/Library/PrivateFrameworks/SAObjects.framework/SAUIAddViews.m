@implementation SAUIAddViews

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("AddViews");
}

- (NSString)dialogPhase
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dialogPhase"));
}

- (void)setDialogPhase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dialogPhase"), a3);
}

- (NSString)displayTarget
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("displayTarget"));
}

- (void)setDisplayTarget:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("displayTarget"), a3);
}

- (SAUIFeedbackForm)feedbackForm
{
  return (SAUIFeedbackForm *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("feedbackForm"));
}

- (void)setFeedbackForm:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("feedbackForm"), a3);
}

- (BOOL)immersiveExperience
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("immersiveExperience"));
}

- (void)setImmersiveExperience:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("immersiveExperience"), a3);
}

- (BOOL)mutatingCommand
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("mutatingCommand"));
}

- (void)setMutatingCommand:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("mutatingCommand"), a3);
}

- (NSString)patternId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("patternId"));
}

- (void)setPatternId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("patternId"), a3);
}

- (NSString)patternType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("patternType"));
}

- (void)setPatternType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("patternType"), a3);
}

- (BOOL)persistentAcrossInvocations
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("persistentAcrossInvocations"));
}

- (void)setPersistentAcrossInvocations:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("persistentAcrossInvocations"), a3);
}

- (SASendCommands)refreshCommand
{
  return (SASendCommands *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("refreshCommand"));
}

- (void)setRefreshCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("refreshCommand"), a3);
}

- (SAUIRequestEndBehavior)requestEndBehavior
{
  return (SAUIRequestEndBehavior *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("requestEndBehavior"));
}

- (void)setRequestEndBehavior:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("requestEndBehavior"), a3);
}

- (BOOL)requiresResponse
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("requiresResponse"));
}

- (void)setRequiresResponse:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("requiresResponse"), a3);
}

- (NSString)responseMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseMode"));
}

- (void)setResponseMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseMode"), a3);
}

- (BOOL)scrollToTop
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("scrollToTop"));
}

- (void)setScrollToTop:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("scrollToTop"), a3);
}

- (BOOL)supplemental
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("supplemental"));
}

- (void)setSupplemental:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("supplemental"), a3);
}

- (BOOL)temporary
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("temporary"));
}

- (void)setTemporary:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("temporary"), a3);
}

- (NSArray)views
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("views"), v3);
}

- (void)setViews:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("views"), (uint64_t)a3);
}

@end
