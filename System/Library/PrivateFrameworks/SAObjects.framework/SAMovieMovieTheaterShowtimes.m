@implementation SAMovieMovieTheaterShowtimes

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("MovieTheaterShowtimes");
}

+ (id)movieTheaterShowtimes
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)movieShowtimes
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("movieShowtimes"), v3);
}

- (void)setMovieShowtimes:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("movieShowtimes"), (uint64_t)a3);
}

- (NSArray)showtimes
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("showtimes"));
}

- (void)setShowtimes:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("showtimes"), a3);
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
