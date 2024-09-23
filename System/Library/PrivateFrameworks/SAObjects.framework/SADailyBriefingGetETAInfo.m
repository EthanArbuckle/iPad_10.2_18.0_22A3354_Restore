@implementation SADailyBriefingGetETAInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.dailybriefing");
}

- (id)encodedClassName
{
  return CFSTR("GetETAInfo");
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

- (BOOL)requiresResponse
{
  return 0;
}

@end
