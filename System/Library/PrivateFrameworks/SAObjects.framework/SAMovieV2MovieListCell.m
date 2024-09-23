@implementation SAMovieV2MovieListCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("MovieListCell");
}

+ (id)movieListCell
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)displayableShowtimes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("displayableShowtimes"), v3);
}

- (void)setDisplayableShowtimes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("displayableShowtimes"), (uint64_t)a3);
}

- (SAMovieV2MovieDetailSnippet)movieDetailSnippet
{
  return (SAMovieV2MovieDetailSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("movieDetailSnippet"));
}

- (void)setMovieDetailSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("movieDetailSnippet"), a3);
}

- (NSString)movieName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("movieName"));
}

- (void)setMovieName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("movieName"), a3);
}

- (NSArray)posterImages
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("posterImages"), v3);
}

- (void)setPosterImages:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("posterImages"), (uint64_t)a3);
}

- (NSNumber)qualityRating
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("qualityRating"));
}

- (void)setQualityRating:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("qualityRating"), a3);
}

- (NSString)rating
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rating"));
}

- (void)setRating:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rating"), a3);
}

- (NSDate)theatricalReleaseDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theatricalReleaseDate"));
}

- (void)setTheatricalReleaseDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theatricalReleaseDate"), a3);
}

@end
