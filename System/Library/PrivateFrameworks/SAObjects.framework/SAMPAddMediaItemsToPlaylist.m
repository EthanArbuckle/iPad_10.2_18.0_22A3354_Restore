@implementation SAMPAddMediaItemsToPlaylist

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AddMediaItemsToPlaylist");
}

+ (id)addMediaItemsToPlaylist
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

- (NSString)insertLocation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("insertLocation"));
}

- (void)setInsertLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("insertLocation"), a3);
}

- (NSArray)mediaItems
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("mediaItems"), v3);
}

- (void)setMediaItems:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("mediaItems"), (uint64_t)a3);
}

- (SAMPPlaylist)playlist
{
  return (SAMPPlaylist *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playlist"));
}

- (void)setPlaylist:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playlist"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
