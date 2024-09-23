@implementation SAMPAddMediaItemsToUpNextQueue

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AddMediaItemsToUpNextQueue");
}

+ (id)addMediaItemsToUpNextQueue
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("hashedRouteUIDs"));
}

- (void)setHashedRouteUIDs:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("hashedRouteUIDs"), a3);
}

- (NSString)insertLocation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("insertLocation"));
}

- (void)setInsertLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("insertLocation"), a3);
}

- (SAMPCollection)mediaCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mediaCollection"));
}

- (void)setMediaCollection:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mediaCollection"), a3);
}

- (NSString)musicAccountSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("musicAccountSharedUserId"));
}

- (void)setMusicAccountSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("musicAccountSharedUserId"), a3);
}

- (NSString)speakerSharedUserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("speakerSharedUserId"));
}

- (void)setSpeakerSharedUserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("speakerSharedUserId"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
