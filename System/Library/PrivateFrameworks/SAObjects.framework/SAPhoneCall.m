@implementation SAPhoneCall

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.phone");
}

- (id)encodedClassName
{
  return CFSTR("Call");
}

+ (id)call
{
  return objc_alloc_init((Class)a1);
}

- (SAPersonAttribute)callRecipient
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("callRecipient"));
}

- (void)setCallRecipient:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("callRecipient"), a3);
}

- (NSNumber)emergencyCall
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("emergencyCall"));
}

- (void)setEmergencyCall:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("emergencyCall"), a3);
}

- (BOOL)faceTime
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("faceTime"));
}

- (void)setFaceTime:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("faceTime"), a3);
}

- (BOOL)faceTimeAudio
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("faceTimeAudio"));
}

- (void)setFaceTimeAudio:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("faceTimeAudio"), a3);
}

- (BOOL)handsFreeCall
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("handsFreeCall"));
}

- (void)setHandsFreeCall:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("handsFreeCall"), a3);
}

- (BOOL)speakerphoneCall
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("speakerphoneCall"));
}

- (void)setSpeakerphoneCall:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("speakerphoneCall"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
