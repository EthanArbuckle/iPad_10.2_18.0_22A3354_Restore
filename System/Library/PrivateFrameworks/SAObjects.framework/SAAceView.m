@implementation SAAceView

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AceView");
}

+ (id)aceView
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)canBeRefreshed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canBeRefreshed"));
}

- (void)setCanBeRefreshed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canBeRefreshed"), a3);
}

- (BOOL)canUseServerTTS
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canUseServerTTS"));
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canUseServerTTS"), a3);
}

- (SAAceSerializable)context
{
  return (SAAceSerializable *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("context"));
}

- (void)setContext:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("context"), a3);
}

- (NSNumber)deferredRendering
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deferredRendering"));
}

- (void)setDeferredRendering:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deferredRendering"), a3);
}

- (NSNumber)delayDismissalMs
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("delayDismissalMs"));
}

- (void)setDelayDismissalMs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("delayDismissalMs"), a3);
}

- (SADialog)dialog
{
  return (SADialog *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("dialog"));
}

- (void)setDialog:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("dialog"), a3);
}

- (BOOL)disableDeviceRacing
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("disableDeviceRacing"));
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("disableDeviceRacing"), a3);
}

- (BOOL)isTransient
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isTransient"));
}

- (void)setIsTransient:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isTransient"), a3);
}

- (NSString)itemType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("itemType"));
}

- (void)setItemType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("itemType"), a3);
}

- (NSString)correspondingSessionID
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("correspondingSessionID"));
}

- (void)setCorrespondingSessionID:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("correspondingSessionID"), a3);
}

- (NSNumber)listenAfterSpeaking
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("listenAfterSpeaking"));
}

- (void)setListenAfterSpeaking:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("listenAfterSpeaking"), a3);
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  return (SAUIListenAfterSpeakingBehavior *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("listenAfterSpeakingBehavior"));
}

- (void)setListenAfterSpeakingBehavior:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("listenAfterSpeakingBehavior"), a3);
}

- (SAVoice)preferredSpeakableTextVoice
{
  return (SAVoice *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("preferredSpeakableTextVoice"));
}

- (void)setPreferredSpeakableTextVoice:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("preferredSpeakableTextVoice"), a3);
}

- (BOOL)preserveResultSpaceIfPossible
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("preserveResultSpaceIfPossible"));
}

- (void)setPreserveResultSpaceIfPossible:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("preserveResultSpaceIfPossible"), a3);
}

- (NSString)redactedSpeakableText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("redactedSpeakableText"));
}

- (void)setRedactedSpeakableText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("redactedSpeakableText"), a3);
}

- (NSDictionary)speakableContextInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableContextInfo"));
}

- (void)setSpeakableContextInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableContextInfo"), a3);
}

- (NSString)speakableText
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakableText"));
}

- (void)setSpeakableText:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakableText"), a3);
}

- (NSString)viewId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("viewId"));
}

- (void)setViewId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("viewId"), a3);
}

@end
