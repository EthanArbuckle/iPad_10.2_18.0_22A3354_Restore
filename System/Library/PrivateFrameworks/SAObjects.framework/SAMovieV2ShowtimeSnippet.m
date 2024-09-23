@implementation SAMovieV2ShowtimeSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("ShowtimeSnippet");
}

+ (id)showtimeSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAUIImageResource)attributionLogo
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("attributionLogo"));
}

- (void)setAttributionLogo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("attributionLogo"), a3);
}

- (NSString)movieName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("movieName"));
}

- (void)setMovieName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("movieName"), a3);
}

- (NSArray)showtimes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("showtimes"), v3);
}

- (void)setShowtimes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("showtimes"), (uint64_t)a3);
}

- (SALocalSearchBusiness2)theater
{
  return (SALocalSearchBusiness2 *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("theater"));
}

- (void)setTheater:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("theater"), a3);
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
