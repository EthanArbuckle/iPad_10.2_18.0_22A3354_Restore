@implementation SAMPMusicMovie

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MusicMovie");
}

+ (id)musicMovie
{
  return objc_alloc_init((Class)a1);
}

@end
