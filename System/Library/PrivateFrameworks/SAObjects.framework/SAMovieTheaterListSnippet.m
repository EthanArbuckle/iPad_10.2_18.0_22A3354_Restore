@implementation SAMovieTheaterListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("TheaterListSnippet");
}

+ (id)theaterListSnippet
{
  return objc_alloc_init((Class)a1);
}

@end
