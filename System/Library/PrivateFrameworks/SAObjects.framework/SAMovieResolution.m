@implementation SAMovieResolution

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.movie");
}

- (id)encodedClassName
{
  return CFSTR("Resolution");
}

+ (id)resolution
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)height
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("height"));
}

- (void)setHeight:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("height"), a3);
}

- (int64_t)width
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("width"));
}

- (void)setWidth:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("width"), a3);
}

@end
