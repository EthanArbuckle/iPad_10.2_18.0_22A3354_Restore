@implementation SAMPGenreCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GenreCollection");
}

+ (id)genreCollection
{
  return objc_alloc_init((Class)a1);
}

@end
