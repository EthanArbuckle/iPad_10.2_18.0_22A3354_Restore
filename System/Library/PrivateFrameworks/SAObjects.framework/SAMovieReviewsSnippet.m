@implementation SAMovieReviewsSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("ReviewsSnippet");
}

+ (id)reviewsSnippet
{
  return objc_alloc_init((Class)a1);
}

- (SAMovieMovie)movie
{
  return (SAMovieMovie *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("movie"));
}

- (void)setMovie:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("movie"), a3);
}

@end
