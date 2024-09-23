@implementation SATTSSetSpeechSynthesisVolume

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.tts");
}

- (id)encodedClassName
{
  return CFSTR("SetSpeechSynthesisVolume");
}

+ (id)setSpeechSynthesisVolume
{
  return objc_alloc_init((Class)a1);
}

- (NSString)actionType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actionType"));
}

- (void)setActionType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actionType"), a3);
}

- (NSNumber)volumeValue
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volumeValue"));
}

- (void)setVolumeValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volumeValue"), a3);
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
