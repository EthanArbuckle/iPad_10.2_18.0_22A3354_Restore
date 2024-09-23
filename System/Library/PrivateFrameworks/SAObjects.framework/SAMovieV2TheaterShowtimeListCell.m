@implementation SAMovieV2TheaterShowtimeListCell

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("TheaterShowtimeListCell");
}

+ (id)theaterShowtimeListCell
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)bookable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("bookable"));
}

- (void)setBookable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("bookable"), a3);
}

- (SADistance)relativeDistance
{
  return (SADistance *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("relativeDistance"));
}

- (void)setRelativeDistance:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("relativeDistance"), a3);
}

- (SAMovieV2ShowtimeSnippet)showtimeSnippet
{
  return (SAMovieV2ShowtimeSnippet *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("showtimeSnippet"));
}

- (void)setShowtimeSnippet:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("showtimeSnippet"), a3);
}

- (NSString)theaterName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("theaterName"));
}

- (void)setTheaterName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("theaterName"), a3);
}

@end
