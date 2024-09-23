@implementation SASetRequestOrigin

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetRequestOrigin");
}

+ (id)setRequestOrigin
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

- (double)verticalAccuracy
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("verticalAccuracy"));
}

- (void)setVerticalAccuracy:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("verticalAccuracy"), a3);
}

- (double)horizontalAccuracy
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("horizontalAccuracy"));
}

- (void)setHorizontalAccuracy:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("horizontalAccuracy"), a3);
}

- (NSNumber)age
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("age"));
}

- (void)setAge:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("age"), a3);
}

- (double)altitude
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("altitude"));
}

- (void)setAltitude:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("altitude"), a3);
}

- (NSString)desiredAccuracy
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("desiredAccuracy"));
}

- (void)setDesiredAccuracy:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("desiredAccuracy"), a3);
}

- (double)direction
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("direction"));
}

- (void)setDirection:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("direction"), a3);
}

- (NSNumber)preciseLocationEnabled
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("preciseLocationEnabled"));
}

- (void)setPreciseLocationEnabled:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("preciseLocationEnabled"), a3);
}

- (double)speed
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("speed"));
}

- (void)setSpeed:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("speed"), a3);
}

- (NSString)status
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("status"));
}

- (void)setStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("status"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
