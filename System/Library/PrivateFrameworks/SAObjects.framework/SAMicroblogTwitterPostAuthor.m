@implementation SAMicroblogTwitterPostAuthor

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.microblog");
}

- (id)encodedClassName
{
  return CFSTR("TwitterPostAuthor");
}

+ (id)twitterPostAuthor
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)followersCount
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("followersCount"));
}

- (void)setFollowersCount:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("followersCount"), a3);
}

- (NSString)fullName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("fullName"));
}

- (void)setFullName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("fullName"), a3);
}

- (NSURL)profileImageUrl
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("profileImageUrl"));
}

- (void)setProfileImageUrl:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("profileImageUrl"), a3);
}

- (NSString)screenName
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("screenName"));
}

- (void)setScreenName:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("screenName"), a3);
}

- (NSNumber)userId
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("userId"));
}

- (void)setUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("userId"), a3);
}

- (BOOL)verified
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("verified"));
}

- (void)setVerified:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("verified"), a3);
}

@end
