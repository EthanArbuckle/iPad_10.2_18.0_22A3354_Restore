@implementation SAMPMusicShow

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MusicShow");
}

+ (id)musicShow
{
  return objc_alloc_init((Class)a1);
}

@end
