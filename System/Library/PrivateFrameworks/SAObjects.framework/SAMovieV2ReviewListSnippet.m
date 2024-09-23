@implementation SAMovieV2ReviewListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("ReviewListSnippet");
}

+ (id)reviewListSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)movieName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("movieName"));
}

- (void)setMovieName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("movieName"), a3);
}

- (SALocalSearchReviewList)reviewList
{
  return (SALocalSearchReviewList *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("reviewList"));
}

- (void)setReviewList:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("reviewList"), a3);
}

@end
