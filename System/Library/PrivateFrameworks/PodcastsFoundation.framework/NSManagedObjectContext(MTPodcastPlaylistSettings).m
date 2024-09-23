@implementation NSManagedObjectContext(MTPodcastPlaylistSettings)

- (uint64_t)podcastPlaylistSettingsForUuid:()MTPodcastPlaylistSettings
{
  return objc_msgSend(a1, "objectForUuid:entityName:", a3, CFSTR("MTPodcastPlaylistSettings"));
}

@end
