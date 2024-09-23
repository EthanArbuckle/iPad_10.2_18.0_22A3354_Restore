@implementation SAMPSong

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Song");
}

+ (id)song
{
  return objc_alloc_init((Class)a1);
}

@end
