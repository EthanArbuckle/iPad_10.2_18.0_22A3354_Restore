@implementation SAMovieV2MovieTheater

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("MovieTheater");
}

+ (id)movieTheater
{
  return objc_alloc_init((Class)a1);
}

- (SALocalSearchBusiness2)business
{
  return (SALocalSearchBusiness2 *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("business"));
}

- (void)setBusiness:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("business"), a3);
}

- (NSArray)movies
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("movies"), v3);
}

- (void)setMovies:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("movies"), (uint64_t)a3);
}

@end
