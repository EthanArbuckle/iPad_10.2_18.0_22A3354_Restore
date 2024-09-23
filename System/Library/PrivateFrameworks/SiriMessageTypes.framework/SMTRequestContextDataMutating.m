@implementation SMTRequestContextDataMutating

- (NSString)audioSource
{
  return self->_audioSource;
}

- (void)setAudioSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (void)setAudioDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setResponseMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (void)setIsVoiceTriggerEnabled:(BOOL)a3
{
  self->_isVoiceTriggerEnabled = a3;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (void)setIsTextToSpeechEnabled:(BOOL)a3
{
  self->_isTextToSpeechEnabled = a3;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (void)setIsTriggerlessFollowup:(BOOL)a3
{
  self->_isTriggerlessFollowup = a3;
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (void)setBargeInModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDateInterval)approximatePreviousTTSInterval
{
  return self->_approximatePreviousTTSInterval;
}

- (void)setApproximatePreviousTTSInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (void)setDeviceRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)voiceAudioSessionId
{
  return self->_voiceAudioSessionId;
}

- (void)setVoiceAudioSessionId:(unsigned int)a3
{
  self->_voiceAudioSessionId = a3;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (void)setIsSystemApertureEnabled:(BOOL)a3
{
  self->_isSystemApertureEnabled = a3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (void)setIsLiveActivitiesSupported:(BOOL)a3
{
  self->_isLiveActivitiesSupported = a3;
}

- (BOOL)isDeviceShowingLockScreen
{
  return self->_isDeviceShowingLockScreen;
}

- (void)setIsDeviceShowingLockScreen:(BOOL)a3
{
  self->_isDeviceShowingLockScreen = a3;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_approximatePreviousTTSInterval, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioSource, 0);
}

@end
