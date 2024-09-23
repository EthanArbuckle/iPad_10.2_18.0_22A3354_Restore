@implementation SAAISearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("Search");
}

+ (id)search
{
  return objc_alloc_init((Class)a1);
}

- (double)duration
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("duration"));
}

- (void)setDuration:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("duration"), a3);
}

- (NSData)fingerprint
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fingerprint"));
}

- (void)setFingerprint:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fingerprint"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
