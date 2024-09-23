@implementation SAUIPlayAudio

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.assistant");
}

- (id)encodedClassName
{
  return CFSTR("PlayAudio");
}

- (NSNumber)fadeInDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fadeInDuration"));
}

- (void)setFadeInDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fadeInDuration"), a3);
}

- (NSNumber)fadeOutDuration
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fadeOutDuration"));
}

- (void)setFadeOutDuration:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fadeOutDuration"), a3);
}

- (NSString)hapticLibraryKey
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hapticLibraryKey"));
}

- (void)setHapticLibraryKey:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hapticLibraryKey"), a3);
}

- (SAUIAudioData)itemData
{
  return (SAUIAudioData *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("itemData"));
}

- (void)setItemData:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("itemData"), a3);
}

- (NSString)itemURL
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("itemURL"));
}

- (void)setItemURL:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("itemURL"), a3);
}

- (NSNumber)numberOfLoops
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("numberOfLoops"));
}

- (void)setNumberOfLoops:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("numberOfLoops"), a3);
}

- (NSNumber)toneLibraryAlertType
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("toneLibraryAlertType"));
}

- (void)setToneLibraryAlertType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("toneLibraryAlertType"), a3);
}

- (NSNumber)volume
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("volume"));
}

- (void)setVolume:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("volume"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
