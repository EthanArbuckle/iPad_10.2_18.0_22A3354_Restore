@implementation SARDStartServerRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("StartServerRequest");
}

- (NSString)audioDestination
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioDestination"));
}

- (void)setAudioDestination:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioDestination"), a3);
}

- (NSString)audioSource
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("audioSource"));
}

- (void)setAudioSource:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("audioSource"), a3);
}

- (NSArray)bargeInModes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bargeInModes"));
}

- (void)setBargeInModes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bargeInModes"), a3);
}

- (NSString)deviceModel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceModel"));
}

- (void)setDeviceModel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceModel"), a3);
}

- (NSNumber)durationSincePreviousTTSFinish
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSFinish"));
}

- (void)setDurationSincePreviousTTSFinish:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSFinish"), a3);
}

- (NSNumber)durationSincePreviousTTSStart
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("durationSincePreviousTTSStart"));
}

- (void)setDurationSincePreviousTTSStart:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("durationSincePreviousTTSStart"), a3);
}

- (BOOL)textRequest
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("textRequest"));
}

- (void)setTextRequest:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("textRequest"), a3);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("voiceTriggerEventInfo"));
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("voiceTriggerEventInfo"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
