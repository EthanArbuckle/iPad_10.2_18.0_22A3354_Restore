@implementation SAMPGeniusSummon

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("GeniusSummon");
}

+ (id)geniusSummon
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

- (SAMPMediaItem)mediaItem
{
  return (SAMPMediaItem *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("mediaItem"));
}

- (void)setMediaItem:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("mediaItem"), a3);
}

- (NSNumber)startPlaying
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("startPlaying"));
}

- (void)setStartPlaying:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("startPlaying"), a3);
}

- (NSString)upNextQueueInsertLocation
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("upNextQueueInsertLocation"));
}

- (void)setUpNextQueueInsertLocation:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("upNextQueueInsertLocation"), a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end
