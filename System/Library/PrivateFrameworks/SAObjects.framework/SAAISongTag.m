@implementation SAAISongTag

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.acousticid");
}

- (id)encodedClassName
{
  return CFSTR("SongTag");
}

+ (id)songTag
{
  return objc_alloc_init((Class)a1);
}

- (NSString)adamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adamId"));
}

- (void)setAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adamId"), a3);
}

- (NSString)album
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("album"));
}

- (void)setAlbum:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("album"), a3);
}

- (NSString)albumAdamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("albumAdamId"));
}

- (void)setAlbumAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("albumAdamId"), a3);
}

- (NSString)artist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("artist"));
}

- (void)setArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("artist"), a3);
}

- (NSString)artistAdamId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("artistAdamId"));
}

- (void)setArtistAdamId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("artistAdamId"), a3);
}

- (NSString)contentRating
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("contentRating"));
}

- (void)setContentRating:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("contentRating"), a3);
}

- (NSURL)iTunesUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("iTunesUri"));
}

- (void)setITunesUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("iTunesUri"), a3);
}

- (SAUIImageResource)previewImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("previewImage"));
}

- (void)setPreviewImage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("previewImage"), a3);
}

- (NSURL)radioStationUri
{
  return (NSURL *)AceObjectURLForProperty(self, (uint64_t)CFSTR("radioStationUri"));
}

- (void)setRadioStationUri:(id)a3
{
  AceObjectSetURLForProperty(self, CFSTR("radioStationUri"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

@end
