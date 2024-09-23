@implementation SALocalSearchMapViewportVertex

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("MapViewportVertex");
}

+ (id)mapViewportVertex
{
  return objc_alloc_init((Class)a1);
}

- (double)latitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("latitude"));
}

- (void)setLatitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("latitude"), a3);
}

- (double)longitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("longitude"));
}

- (void)setLongitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("longitude"), a3);
}

@end
