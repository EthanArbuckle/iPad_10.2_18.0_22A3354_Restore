@implementation SAMovieV2TheaterListSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movieV2");
}

- (id)encodedClassName
{
  return CFSTR("TheaterListSnippet");
}

+ (id)theaterListSnippet
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)theaterListCells
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("theaterListCells"), v3);
}

- (void)setTheaterListCells:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("theaterListCells"), (uint64_t)a3);
}

@end
