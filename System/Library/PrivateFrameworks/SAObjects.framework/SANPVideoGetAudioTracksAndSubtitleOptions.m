@implementation SANPVideoGetAudioTracksAndSubtitleOptions

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.nowplaying.video");
}

- (id)encodedClassName
{
  return CFSTR("GetAudioTracksAndSubtitleOptions");
}

+ (id)getAudioTracksAndSubtitleOptions
{
  return objc_alloc_init((Class)a1);
}

- (NSString)desiredLanguage
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("desiredLanguage"));
}

- (void)setDesiredLanguage:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("desiredLanguage"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
