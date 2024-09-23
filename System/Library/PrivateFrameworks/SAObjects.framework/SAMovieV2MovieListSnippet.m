@implementation SAMovieV2MovieListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("MovieListSnippet");
}

+ (id)movieListSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)movieListCells
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("movieListCells"), v3);
}

- (void)setMovieListCells:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("movieListCells"), (uint64_t)a3);
}

- (SALocalSearchBusiness2)theater
{
  return (SALocalSearchBusiness2 *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("theater"));
}

- (void)setTheater:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("theater"), a3);
}

@end
