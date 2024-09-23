@implementation SAMovieV2TheaterShowtimeListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("TheaterShowtimeListSnippet");
}

+ (id)theaterShowtimeListSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAMovieV2MovieDetailSnippet)movieDetailSnippet
{
  return (SAMovieV2MovieDetailSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("movieDetailSnippet"));
}

- (void)setMovieDetailSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("movieDetailSnippet"), a3);
}

- (NSArray)theaterShowtimeListCells
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("theaterShowtimeListCells"), v3);
}

- (void)setTheaterShowtimeListCells:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("theaterShowtimeListCells"), (uint64_t)a3);
}

@end
