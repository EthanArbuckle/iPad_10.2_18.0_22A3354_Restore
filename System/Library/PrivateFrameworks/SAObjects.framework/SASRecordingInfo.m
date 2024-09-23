@implementation SASRecordingInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("RecordingInfo");
}

+ (id)recordingInfo
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)activationAudioAlertDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationAudioAlertDuration"));
}

- (void)setActivationAudioAlertDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationAudioAlertDuration"), a3);
}

- (NSNumber)activationAudioAlertStartTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationAudioAlertStartTime"));
}

- (void)setActivationAudioAlertStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationAudioAlertStartTime"), a3);
}

- (NSNumber)activationHapticAlertDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationHapticAlertDuration"));
}

- (void)setActivationHapticAlertDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationHapticAlertDuration"), a3);
}

- (NSNumber)activationHapticAlertStartTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationHapticAlertStartTime"));
}

- (void)setActivationHapticAlertStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationHapticAlertStartTime"), a3);
}

- (NSNumber)activationTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("activationTime"));
}

- (void)setActivationTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("activationTime"), a3);
}

- (NSString)alertType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("alertType"));
}

- (void)setAlertType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("alertType"), a3);
}

- (NSNumber)beamFormingStartTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("beamFormingStartTime"));
}

- (void)setBeamFormingStartTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("beamFormingStartTime"), a3);
}

- (NSNumber)buttonDowntime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("buttonDowntime"));
}

- (void)setButtonDowntime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("buttonDowntime"), a3);
}

- (NSNumber)buttonUpTime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("buttonUpTime"));
}

- (void)setButtonUpTime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("buttonUpTime"), a3);
}

- (BOOL)ringerSwitchOff
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("ringerSwitchOff"));
}

- (void)setRingerSwitchOff:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("ringerSwitchOff"), a3);
}

- (BOOL)zeroLatencyLaunch
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("zeroLatencyLaunch"));
}

- (void)setZeroLatencyLaunch:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("zeroLatencyLaunch"), a3);
}

@end
