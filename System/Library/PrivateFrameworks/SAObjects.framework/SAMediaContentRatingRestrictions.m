@implementation SAMediaContentRatingRestrictions

- (int64_t)movieRestriction
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("movieRestriction"));
}

- (int64_t)tvRestriction
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("tvRestriction"));
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("MediaContentRatingRestrictions");
}

+ (id)mediaContentRatingRestrictions
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)appRestriction
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("appRestriction"));
}

- (void)setAppRestriction:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("appRestriction"), a3);
}

- (NSString)countryCode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("countryCode"));
}

- (void)setCountryCode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("countryCode"), a3);
}

- (void)setMovieRestriction:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("movieRestriction"), a3);
}

- (void)setTvRestriction:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("tvRestriction"), a3);
}

@end
