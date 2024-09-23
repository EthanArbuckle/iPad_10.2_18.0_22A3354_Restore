@implementation SANPVideoAudioAndSubtitleLanguageOptions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying.video");
}

- (id)encodedClassName
{
  return CFSTR("AudioAndSubtitleLanguageOptions");
}

+ (id)audioAndSubtitleLanguageOptions
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)availableSubtitles
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("availableSubtitles"), v3);
}

- (void)setAvailableSubtitles:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("availableSubtitles"), (uint64_t)a3);
}

- (NSArray)availableTracks
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("availableTracks"), v3);
}

- (void)setAvailableTracks:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("availableTracks"), (uint64_t)a3);
}

- (SANPVideoLanguageOption)currentAudioTrack
{
  return (SANPVideoLanguageOption *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentAudioTrack"));
}

- (void)setCurrentAudioTrack:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentAudioTrack"), a3);
}

- (SANPVideoLanguageOption)currentSubtitles
{
  return (SANPVideoLanguageOption *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("currentSubtitles"));
}

- (void)setCurrentSubtitles:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("currentSubtitles"), a3);
}

@end
