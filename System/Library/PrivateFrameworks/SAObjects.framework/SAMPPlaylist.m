@implementation SAMPPlaylist

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Playlist");
}

+ (id)playlist
{
  return objc_alloc_init((Class)a1);
}

@end
