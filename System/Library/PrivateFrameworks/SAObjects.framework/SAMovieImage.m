@implementation SAMovieImage

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("Image");
}

+ (id)image
{
  return objc_alloc_init((Class)a1);
}

- (SAMovieResolution)resolution
{
  return (SAMovieResolution *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("resolution"));
}

- (void)setResolution:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("resolution"), a3);
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("uri"));
}

- (void)setUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("uri"), a3);
}

@end
