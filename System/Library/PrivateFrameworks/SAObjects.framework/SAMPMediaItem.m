@implementation SAMPMediaItem

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MediaItem");
}

+ (id)mediaItem
{
  return objc_alloc_init((Class)a1);
}

- (NSString)album
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("album"));
}

- (void)setAlbum:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("album"), a3);
}

- (NSString)artist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("artist"));
}

- (void)setArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("artist"), a3);
}

- (SACalendar)datePurchased
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("datePurchased"));
}

- (void)setDatePurchased:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("datePurchased"), a3);
}

- (NSString)genre
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("genre"));
}

- (void)setGenre:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("genre"), a3);
}

- (NSNumber)perceivableStartTimeInSeconds
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("perceivableStartTimeInSeconds"));
}

- (void)setPerceivableStartTimeInSeconds:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("perceivableStartTimeInSeconds"), a3);
}

- (SAMPReleaseInfo)releaseInfo
{
  return (SAMPReleaseInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("releaseInfo"));
}

- (void)setReleaseInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("releaseInfo"), a3);
}

- (NSString)sortAlbum
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortAlbum"));
}

- (void)setSortAlbum:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortAlbum"), a3);
}

- (NSString)sortArtist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortArtist"));
}

- (void)setSortArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortArtist"), a3);
}

@end
