@implementation SAMPLikesMediaEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("LikesMediaEntity");
}

+ (id)likesMediaEntity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)influencedSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("influencedSharedUserId"));
}

- (void)setInfluencedSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("influencedSharedUserId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
