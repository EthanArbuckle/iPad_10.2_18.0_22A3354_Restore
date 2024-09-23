@implementation SAMovieShowtimeListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("ShowtimeListSnippet");
}

+ (id)showtimeListSnippet
{
  return objc_alloc_init((Class)a1);
}

@end
