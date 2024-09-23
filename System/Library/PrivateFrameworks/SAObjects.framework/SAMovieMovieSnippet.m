@implementation SAMovieMovieSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("MovieSnippet");
}

+ (id)movieSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAMovieMovie)movie
{
  return (SAMovieMovie *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("movie"));
}

- (void)setMovie:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("movie"), a3);
}

- (BOOL)playTrailer
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("playTrailer"));
}

- (void)setPlayTrailer:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("playTrailer"), a3);
}

@end
