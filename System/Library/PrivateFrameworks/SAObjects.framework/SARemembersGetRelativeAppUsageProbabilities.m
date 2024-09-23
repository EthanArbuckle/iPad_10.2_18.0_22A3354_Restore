@implementation SARemembersGetRelativeAppUsageProbabilities

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.remembers");
}

- (id)encodedClassName
{
  return CFSTR("GetRelativeAppUsageProbabilities");
}

+ (id)getRelativeAppUsageProbabilities
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)bundleIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleIDs"));
}

- (void)setBundleIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleIDs"), a3);
}

- (int64_t)days
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("days"));
}

- (void)setDays:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("days"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
