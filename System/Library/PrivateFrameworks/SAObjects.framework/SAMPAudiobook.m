@implementation SAMPAudiobook

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("Audiobook");
}

+ (id)audiobook
{
  return objc_alloc_init((Class)a1);
}

@end
