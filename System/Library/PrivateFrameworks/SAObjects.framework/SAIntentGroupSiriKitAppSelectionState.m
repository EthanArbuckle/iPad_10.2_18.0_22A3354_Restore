@implementation SAIntentGroupSiriKitAppSelectionState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("SiriKitAppSelectionState");
}

+ (id)siriKitAppSelectionState
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appConfirmationState
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appConfirmationState"));
}

- (void)setAppConfirmationState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appConfirmationState"), a3);
}

- (NSString)appCorrectionState
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appCorrectionState"));
}

- (void)setAppCorrectionState:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appCorrectionState"), a3);
}

- (NSArray)eligibleApps
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("eligibleApps"), v3);
}

- (void)setEligibleApps:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("eligibleApps"), (uint64_t)a3);
}

- (SASyncAppIdentifyingInfo)requestedApp
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("requestedApp"));
}

- (void)setRequestedApp:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("requestedApp"), a3);
}

@end
