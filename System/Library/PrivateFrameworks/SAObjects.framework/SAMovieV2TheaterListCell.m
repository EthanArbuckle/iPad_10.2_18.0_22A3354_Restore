@implementation SAMovieV2TheaterListCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("TheaterListCell");
}

+ (id)theaterListCell
{
  return objc_alloc_init((Class)a1);
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("relativeDistance"));
}

- (void)setRelativeDistance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("relativeDistance"), a3);
}

- (NSString)theaterAddress
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theaterAddress"));
}

- (void)setTheaterAddress:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theaterAddress"), a3);
}

- (NSString)theaterName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theaterName"));
}

- (void)setTheaterName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theaterName"), a3);
}

- (SAMovieV2MovieListSnippet)theaterShowtimeListSnippet
{
  return (SAMovieV2MovieListSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("theaterShowtimeListSnippet"));
}

- (void)setTheaterShowtimeListSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("theaterShowtimeListSnippet"), a3);
}

@end
