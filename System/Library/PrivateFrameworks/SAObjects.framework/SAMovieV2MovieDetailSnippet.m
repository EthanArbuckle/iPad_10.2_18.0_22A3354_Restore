@implementation SAMovieV2MovieDetailSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("MovieDetailSnippet");
}

+ (id)movieDetailSnippet
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

- (NSString)adamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adamId"));
}

- (void)setAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adamId"), a3);
}

- (NSArray)alternateProviderPunchouts
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("alternateProviderPunchouts"), v3);
}

- (void)setAlternateProviderPunchouts:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("alternateProviderPunchouts"), (uint64_t)a3);
}

- (NSNumber)availableOnItunesForPurchase
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("availableOnItunesForPurchase"));
}

- (void)setAvailableOnItunesForPurchase:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("availableOnItunesForPurchase"), a3);
}

- (NSNumber)availableOnItunesForRent
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("availableOnItunesForRent"));
}

- (void)setAvailableOnItunesForRent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("availableOnItunesForRent"), a3);
}

- (BOOL)canBeFavorited
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("canBeFavorited"));
}

- (void)setCanBeFavorited:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("canBeFavorited"), a3);
}

- (NSString)canonicalId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("canonicalId"));
}

- (void)setCanonicalId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("canonicalId"), a3);
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

- (NSURL)hiresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("hiresTrailerUri"));
}

- (void)setHiresTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("hiresTrailerUri"), a3);
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

- (BOOL)isContainerItem
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isContainerItem"));
}

- (void)setIsContainerItem:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isContainerItem"), a3);
}

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("lowresTrailerUri"));
}

- (void)setLowresTrailerUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("lowresTrailerUri"), a3);
}

- (NSURL)movieIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("movieIdentifier"));
}

- (void)setMovieIdentifier:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("movieIdentifier"), a3);
}

- (SAMovieV2ReviewListSnippet)movieReviewListSnippet
{
  return (SAMovieV2ReviewListSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("movieReviewListSnippet"));
}

- (void)setMovieReviewListSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("movieReviewListSnippet"), a3);
}

- (NSString)name
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("name"));
}

- (void)setName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("name"), a3);
}

- (SAUIAppPunchOut)playOnItunesPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playOnItunesPunchout"));
}

- (void)setPlayOnItunesPunchout:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playOnItunesPunchout"), a3);
}

- (NSNumber)playTrailer
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("playTrailer"));
}

- (void)setPlayTrailer:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("playTrailer"), a3);
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

- (int64_t)runtimeInMinutes
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("runtimeInMinutes"));
}

- (void)setRuntimeInMinutes:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("runtimeInMinutes"), a3);
}

- (SAMovieV2ShowtimeSnippet)showtimeSnippet
{
  return (SAMovieV2ShowtimeSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("showtimeSnippet"));
}

- (void)setShowtimeSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("showtimeSnippet"), a3);
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

- (SAMovieV2TheaterShowtimeListSnippet)theaterShowtimeListSnippet
{
  return (SAMovieV2TheaterShowtimeListSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("theaterShowtimeListSnippet"));
}

- (void)setTheaterShowtimeListSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("theaterShowtimeListSnippet"), a3);
}

- (NSString)theaterShowtimeSearchRegionDescription
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theaterShowtimeSearchRegionDescription"));
}

- (void)setTheaterShowtimeSearchRegionDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theaterShowtimeSearchRegionDescription"), a3);
}

- (NSDate)theatricalReleaseDate
{
  return (NSDate *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theatricalReleaseDate"));
}

- (void)setTheatricalReleaseDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theatricalReleaseDate"), a3);
}

- (SAUIAppPunchOut)videosPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("videosPunchout"));
}

- (void)setVideosPunchout:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("videosPunchout"), a3);
}

@end
