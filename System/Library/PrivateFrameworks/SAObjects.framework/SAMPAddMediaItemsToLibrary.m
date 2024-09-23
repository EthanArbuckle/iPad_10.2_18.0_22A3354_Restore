@implementation SAMPAddMediaItemsToLibrary

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AddMediaItemsToLibrary");
}

+ (id)addMediaItemsToLibrary
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

- (SAMPCollection)mediaItems
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mediaItems"));
}

- (void)setMediaItems:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mediaItems"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
