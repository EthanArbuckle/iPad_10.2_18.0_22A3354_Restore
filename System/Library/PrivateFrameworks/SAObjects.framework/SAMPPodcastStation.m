@implementation SAMPPodcastStation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("PodcastStation");
}

+ (id)podcastStation
{
  return objc_alloc_init((Class)a1);
}

@end
