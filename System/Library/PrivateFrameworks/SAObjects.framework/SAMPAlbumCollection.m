@implementation SAMPAlbumCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AlbumCollection");
}

+ (id)albumCollection
{
  return objc_alloc_init((Class)a1);
}

- (NSString)artist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("artist"));
}

- (void)setArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("artist"), a3);
}

- (NSString)description
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("description"));
}

- (void)setDescription:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("description"), a3);
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
