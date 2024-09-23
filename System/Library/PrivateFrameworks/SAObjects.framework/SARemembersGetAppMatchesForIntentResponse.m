@implementation SARemembersGetAppMatchesForIntentResponse

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.remembers");
}

- (id)encodedClassName
{
  return CFSTR("GetAppMatchesForIntentResponse");
}

+ (id)getAppMatchesForIntentResponse
{
  return objc_alloc_init((Class)a1);
}

- (NSString)jsonMatchSignals
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonMatchSignals"));
}

- (void)setJsonMatchSignals:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonMatchSignals"), a3);
}

- (NSString)matchStatus
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("matchStatus"));
}

- (void)setMatchStatus:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("matchStatus"), a3);
}

- (NSArray)matchingBundleIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("matchingBundleIDs"));
}

- (void)setMatchingBundleIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("matchingBundleIDs"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
