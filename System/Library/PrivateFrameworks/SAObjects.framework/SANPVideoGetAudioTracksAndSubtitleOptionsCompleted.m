@implementation SANPVideoGetAudioTracksAndSubtitleOptionsCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying.video");
}

- (id)encodedClassName
{
  return CFSTR("GetAudioTracksAndSubtitleOptionsCompleted");
}

+ (id)getAudioTracksAndSubtitleOptionsCompleted
{
  return objc_alloc_init((Class)a1);
}

- (SANPVideoAudioAndSubtitleLanguageOptions)languageOptions
{
  return (SANPVideoAudioAndSubtitleLanguageOptions *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("languageOptions"));
}

- (void)setLanguageOptions:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("languageOptions"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
