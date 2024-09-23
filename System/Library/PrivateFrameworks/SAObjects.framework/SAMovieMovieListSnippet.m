@implementation SAMovieMovieListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("MovieListSnippet");
}

+ (id)movieListSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)movies
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("movies"), v3);
}

- (void)setMovies:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("movies"), (uint64_t)a3);
}

- (BOOL)shouldShowRottenTomatoesRating
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("shouldShowRottenTomatoesRating"));
}

- (void)setShouldShowRottenTomatoesRating:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("shouldShowRottenTomatoesRating"), a3);
}

@end
