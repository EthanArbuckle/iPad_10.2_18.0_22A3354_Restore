@implementation SAMPMusicPlaybackImminent

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MusicPlaybackImminent");
}

+ (id)musicPlaybackImminent
{
  return objc_alloc_init((Class)a1);
}

- (NSString)preloadedUserSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preloadedUserSharedUserId"));
}

- (void)setPreloadedUserSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preloadedUserSharedUserId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
