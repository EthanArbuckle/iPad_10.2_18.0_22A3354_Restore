@implementation SAMPReleaseInfo

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("ReleaseInfo");
}

+ (id)releaseInfo
{
  return objc_alloc_init((Class)a1);
}

- (SACalendar)releaseDate
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("releaseDate"));
}

- (void)setReleaseDate:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("releaseDate"), a3);
}

- (int64_t)releaseYear
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("releaseYear"));
}

- (void)setReleaseYear:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("releaseYear"), a3);
}

@end
