@implementation SAMovieMovie

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("Movie");
}

+ (id)movie
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)actors
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("actors"));
}

- (void)setActors:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("actors"), a3);
}

- (NSArray)directors
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directors"));
}

- (void)setDirectors:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directors"), a3);
}

- (NSArray)genres
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("genres"));
}

- (void)setGenres:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("genres"), a3);
}

- (NSURL)hiResTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("hiResTrailerUri"));
}

- (void)setHiResTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("hiResTrailerUri"), a3);
}

- (NSURL)iTunesUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("iTunesUri"));
}

- (void)setITunesUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("iTunesUri"), a3);
}

- (BOOL)is3d
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("is3d"));
}

- (void)setIs3d:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("is3d"), a3);
}

- (NSNumber)isAvailableOnItunesForPurchase
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isAvailableOnItunesForPurchase"));
}

- (void)setIsAvailableOnItunesForPurchase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isAvailableOnItunesForPurchase"), a3);
}

- (NSNumber)isAvailableOnItunesForRent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("isAvailableOnItunesForRent"));
}

- (void)setIsAvailableOnItunesForRent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("isAvailableOnItunesForRent"), a3);
}

- (NSURL)lowResTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("lowResTrailerUri"));
}

- (void)setLowResTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("lowResTrailerUri"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
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

- (NSURL)posterUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("posterUri"));
}

- (void)setPosterUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("posterUri"), a3);
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

- (SALocalSearchReviewList)reviews
{
  return (SALocalSearchReviewList *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviews"));
}

- (void)setReviews:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviews"), a3);
}

- (NSURL)rottenTomatoesUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("rottenTomatoesUri"));
}

- (void)setRottenTomatoesUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("rottenTomatoesUri"), a3);
}

- (int64_t)runtimeInMinutes
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("runtimeInMinutes"));
}

- (void)setRuntimeInMinutes:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("runtimeInMinutes"), a3);
}

- (NSArray)studios
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("studios"));
}

- (void)setStudios:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("studios"), a3);
}

- (NSString)synopsis
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("synopsis"));
}

- (void)setSynopsis:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("synopsis"), a3);
}

- (NSString)theaterShowtimeSearchRegionDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theaterShowtimeSearchRegionDescription"));
}

- (void)setTheaterShowtimeSearchRegionDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theaterShowtimeSearchRegionDescription"), a3);
}

- (NSArray)theaterShowtimes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("theaterShowtimes"), v3);
}

- (void)setTheaterShowtimes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("theaterShowtimes"), (uint64_t)a3);
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
