@implementation SASUpdateAudioInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.speech");
}

- (id)encodedClassName
{
  return CFSTR("UpdateAudioInfo");
}

+ (id)updateAudioInfo
{
  return objc_alloc_init((Class)a1);
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

- (NSString)dspStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("dspStatus"));
}

- (void)setDspStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("dspStatus"), a3);
}

- (NSString)firmwareVersion
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("firmwareVersion"));
}

- (void)setFirmwareVersion:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("firmwareVersion"), a3);
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

- (NSNumber)noiseReductionLevel
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("noiseReductionLevel"));
}

- (void)setNoiseReductionLevel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("noiseReductionLevel"), a3);
}

- (NSString)origin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("origin"));
}

- (void)setOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("origin"), a3);
}

- (NSString)productId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("productId"));
}

- (void)setProductId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("productId"), a3);
}

- (SASRecordingInfo)recordingInfo
{
  return (SASRecordingInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recordingInfo"));
}

- (void)setRecordingInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recordingInfo"), a3);
}

- (BOOL)triggeredTwoShotBorealis
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("triggeredTwoShotBorealis"));
}

- (void)setTriggeredTwoShotBorealis:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("triggeredTwoShotBorealis"), a3);
}

- (NSString)vendorId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("vendorId"));
}

- (void)setVendorId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("vendorId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
