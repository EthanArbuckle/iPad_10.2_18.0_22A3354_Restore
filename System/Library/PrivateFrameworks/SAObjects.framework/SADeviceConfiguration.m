@implementation SADeviceConfiguration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DeviceConfiguration");
}

+ (id)deviceConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (double)audioSessionActivationDelay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("audioSessionActivationDelay"));
}

- (void)setAudioSessionActivationDelay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("audioSessionActivationDelay"), a3);
}

- (double)audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold"));
}

- (void)setAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold"), a3);
}

- (BOOL)hasAudioSessionActivationDelay
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("hasAudioSessionActivationDelay"));
}

- (void)setHasAudioSessionActivationDelay:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("hasAudioSessionActivationDelay"), a3);
}

- (double)initialInterstitialDelay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("initialInterstitialDelay"));
}

- (void)setInitialInterstitialDelay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("initialInterstitialDelay"), a3);
}

- (double)initialInterstitialDelayForCarPlay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("initialInterstitialDelayForCarPlay"));
}

- (void)setInitialInterstitialDelayForCarPlay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("initialInterstitialDelayForCarPlay"), a3);
}

- (double)initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking"));
}

- (void)setInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking"), a3);
}

- (double)mediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("mediaPlaybackVolumeThresholdForAudioSessionActivationDelay"));
}

- (void)setMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("mediaPlaybackVolumeThresholdForAudioSessionActivationDelay"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
