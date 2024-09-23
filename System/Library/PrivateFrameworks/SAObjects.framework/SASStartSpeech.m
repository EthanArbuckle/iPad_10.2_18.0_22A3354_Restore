@implementation SASStartSpeech

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("StartSpeech");
}

+ (id)startSpeech
{
  return objc_alloc_init((Class)a1);
}

- (NSString)origin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("origin"));
}

- (void)setOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("origin"), a3);
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

- (BOOL)clearContext
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("clearContext"));
}

- (void)setClearContext:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("clearContext"), a3);
}

- (int)codec
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("codec"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SASCodecForString(v2);

  return v3;
}

- (void)setCodec:(int)a3
{
  id v4;

  stringForSASCodec(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("codec"), v4);

}

- (NSString)deviceIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceIdentifier"));
}

- (void)setDeviceIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceIdentifier"), a3);
}

- (NSString)deviceModel
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("deviceModel"));
}

- (void)setDeviceModel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("deviceModel"), a3);
}

- (BOOL)disableAutoEndpointing
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("disableAutoEndpointing"));
}

- (void)setDisableAutoEndpointing:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("disableAutoEndpointing"), a3);
}

- (NSString)dspStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dspStatus"));
}

- (void)setDspStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dspStatus"), a3);
}

- (BOOL)enablePartialResults
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("enablePartialResults"));
}

- (void)setEnablePartialResults:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("enablePartialResults"), a3);
}

- (NSString)headsetAddress
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headsetAddress"));
}

- (void)setHeadsetAddress:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headsetAddress"), a3);
}

- (NSString)headsetId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headsetId"));
}

- (void)setHeadsetId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headsetId"), a3);
}

- (NSString)headsetName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("headsetName"));
}

- (void)setHeadsetName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("headsetName"), a3);
}

- (NSNumber)isCarryDevice
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isCarryDevice"));
}

- (void)setIsCarryDevice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isCarryDevice"), a3);
}

- (NSString)motionActivity
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("motionActivity"));
}

- (void)setMotionActivity:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("motionActivity"), a3);
}

- (NSNumber)motionConfidence
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("motionConfidence"));
}

- (void)setMotionConfidence:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("motionConfidence"), a3);
}

- (NSNumber)noiseReductionLevel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("noiseReductionLevel"));
}

- (void)setNoiseReductionLevel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("noiseReductionLevel"), a3);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
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
