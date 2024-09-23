@implementation SACFSpokenNotificationFlowCommand

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.clientflow");
}

- (id)encodedClassName
{
  return CFSTR("SpokenNotificationFlowCommand");
}

+ (id)spokenNotificationFlowCommand
{
  return objc_alloc_init((Class)a1);
}

- (SAAppInfo)appInfo
{
  return (SAAppInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("appInfo"));
}

- (void)setAppInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("appInfo"), a3);
}

- (NSString)languageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("languageCode"));
}

- (void)setLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("languageCode"), a3);
}

- (NSString)notificationID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("notificationID"));
}

- (void)setNotificationID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("notificationID"), a3);
}

- (NSString)outputVoiceLanguageCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("outputVoiceLanguageCode"));
}

- (void)setOutputVoiceLanguageCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("outputVoiceLanguageCode"), a3);
}

- (BOOL)shouldPromptUser
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldPromptUser"));
}

- (void)setShouldPromptUser:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldPromptUser"), a3);
}

- (NSString)userAgent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userAgent"));
}

- (void)setUserAgent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userAgent"), a3);
}

- (NSString)userInterfaceIdiom
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userInterfaceIdiom"));
}

- (void)setUserInterfaceIdiom:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userInterfaceIdiom"), a3);
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
