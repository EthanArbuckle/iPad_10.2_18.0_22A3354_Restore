@implementation SALocalSearchMapViewport

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("MapViewport");
}

+ (id)mapViewport
{
  return objc_alloc_init((Class)a1);
}

- (double)eastLongitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("eastLongitude"));
}

- (void)setEastLongitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("eastLongitude"), a3);
}

- (double)northLatitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("northLatitude"));
}

- (void)setNorthLatitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("northLatitude"), a3);
}

- (double)southLatitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("southLatitude"));
}

- (void)setSouthLatitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("southLatitude"), a3);
}

- (double)timeInSecondsSinceViewportChanged
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("timeInSecondsSinceViewportChanged"));
}

- (void)setTimeInSecondsSinceViewportChanged:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("timeInSecondsSinceViewportChanged"), a3);
}

- (double)timeInSecondsSinceViewportEnteredForeground
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("timeInSecondsSinceViewportEnteredForeground"));
}

- (void)setTimeInSecondsSinceViewportEnteredForeground:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("timeInSecondsSinceViewportEnteredForeground"), a3);
}

- (NSArray)vertices
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("vertices"), v3);
}

- (void)setVertices:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("vertices"), (uint64_t)a3);
}

- (double)westLongitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("westLongitude"));
}

- (void)setWestLongitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("westLongitude"), a3);
}

@end
