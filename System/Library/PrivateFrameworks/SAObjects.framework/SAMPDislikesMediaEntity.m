@implementation SAMPDislikesMediaEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("DislikesMediaEntity");
}

+ (id)dislikesMediaEntity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)influencedUserSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("influencedUserSharedUserId"));
}

- (void)setInfluencedUserSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("influencedUserSharedUserId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
