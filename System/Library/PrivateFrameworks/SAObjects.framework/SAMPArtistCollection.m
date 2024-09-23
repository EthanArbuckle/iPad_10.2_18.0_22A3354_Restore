@implementation SAMPArtistCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("ArtistCollection");
}

+ (id)artistCollection
{
  return objc_alloc_init((Class)a1);
}

@end
