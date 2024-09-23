@implementation SAMovieV2MovieContextObject

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("MovieContextObject");
}

+ (id)movieContextObject
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

@end
