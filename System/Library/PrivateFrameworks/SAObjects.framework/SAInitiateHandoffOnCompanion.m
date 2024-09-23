@implementation SAInitiateHandoffOnCompanion

+ (id)initiateHandoffOnCompanion
{
  return objc_alloc_init((Class)a1);
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("InitiateHandoffOnCompanion");
}

- (SAHandoffPayload)handoffPayload
{
  return (SAHandoffPayload *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("handoffPayload"));
}

- (void)setHandoffPayload:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("handoffPayload"), a3);
}

- (NSNumber)isSiriXRequest
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isSiriXRequest"));
}

- (void)setIsSiriXRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isSiriXRequest"), a3);
}

- (NSString)lockScreenText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lockScreenText"));
}

- (void)setLockScreenText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lockScreenText"), a3);
}

- (NSString)lockScreenTextDialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("lockScreenTextDialogIdentifier"));
}

- (void)setLockScreenTextDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("lockScreenTextDialogIdentifier"), a3);
}

- (NSString)notificationText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationText"));
}

- (void)setNotificationText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationText"), a3);
}

- (NSString)notificationTextDialogIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationTextDialogIdentifier"));
}

- (void)setNotificationTextDialogIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationTextDialogIdentifier"), a3);
}

- (SARemoteDevice)targetDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("targetDevice"));
}

- (void)setTargetDevice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("targetDevice"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
