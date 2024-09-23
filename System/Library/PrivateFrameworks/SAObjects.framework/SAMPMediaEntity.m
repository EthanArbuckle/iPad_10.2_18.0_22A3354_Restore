@implementation SAMPMediaEntity

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MediaEntity");
}

+ (id)mediaEntity
{
  return objc_alloc_init((Class)a1);
}

- (NSString)adamIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("adamIdentifier"));
}

- (void)setAdamIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("adamIdentifier"), a3);
}

- (NSString)brandIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("brandIdentifier"));
}

- (void)setBrandIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("brandIdentifier"), a3);
}

- (SACalendar)dateAdded
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("dateAdded"));
}

- (void)setDateAdded:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("dateAdded"), a3);
}

- (BOOL)explicit
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("explicit"));
}

- (void)setExplicit:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("explicit"), a3);
}

- (NSString)externalIdentifier
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("externalIdentifier"));
}

- (void)setExternalIdentifier:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("externalIdentifier"), a3);
}

- (NSString)mediaType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaType"));
}

- (void)setMediaType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaType"), a3);
}

- (SAMPPlaybackInfo)playbackInfo
{
  return (SAMPPlaybackInfo *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("playbackInfo"));
}

- (void)setPlaybackInfo:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("playbackInfo"), a3);
}

- (NSString)rawPlaybackInfo
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rawPlaybackInfo"));
}

- (void)setRawPlaybackInfo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rawPlaybackInfo"), a3);
}

- (NSString)releaseDate
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("releaseDate"));
}

- (void)setReleaseDate:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("releaseDate"), a3);
}

- (NSString)sortTitle
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortTitle"));
}

- (void)setSortTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortTitle"), a3);
}

- (NSString)storeId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("storeId"));
}

- (void)setStoreId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("storeId"), a3);
}

- (NSString)title
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("title"));
}

- (void)setTitle:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("title"), a3);
}

- (BOOL)unplayable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("unplayable"));
}

- (void)setUnplayable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("unplayable"), a3);
}

@end
