@implementation SAStartRequest

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StartRequest");
}

+ (id)startRequest
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

- (NSString)applicationName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("applicationName"));
}

- (void)setApplicationName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("applicationName"), a3);
}

- (BOOL)clearContext
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("clearContext"));
}

- (void)setClearContext:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("clearContext"), a3);
}

- (BOOL)eyesFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("eyesFree"));
}

- (void)setEyesFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("eyesFree"), a3);
}

- (BOOL)handsFree
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("handsFree"));
}

- (void)setHandsFree:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("handsFree"), a3);
}

- (NSString)hardwareBuild
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hardwareBuild"));
}

- (void)setHardwareBuild:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hardwareBuild"), a3);
}

- (NSString)inputOrigin
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("inputOrigin"));
}

- (void)setInputOrigin:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("inputOrigin"), a3);
}

- (NSNumber)isCarryDevice
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isCarryDevice"));
}

- (void)setIsCarryDevice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isCarryDevice"), a3);
}

- (NSNumber)isWatchFaceRequest
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isWatchFaceRequest"));
}

- (void)setIsWatchFaceRequest:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isWatchFaceRequest"), a3);
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

- (NSString)responseMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("responseMode"));
}

- (void)setResponseMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("responseMode"), a3);
}

- (SASStartSpeech)sourceSpeechRequest
{
  return (SASStartSpeech *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("sourceSpeechRequest"));
}

- (void)setSourceSpeechRequest:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("sourceSpeechRequest"), a3);
}

- (BOOL)talkOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("talkOnly"));
}

- (void)setTalkOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("talkOnly"), a3);
}

- (BOOL)textToSpeechIsMuted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("textToSpeechIsMuted"));
}

- (void)setTextToSpeechIsMuted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("textToSpeechIsMuted"), a3);
}

- (NSString)turnId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("turnId"));
}

- (void)setTurnId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("turnId"), a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
