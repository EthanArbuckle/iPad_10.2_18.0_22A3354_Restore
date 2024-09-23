@implementation SAMPAudiobookCollection

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("AudiobookCollection");
}

+ (id)audiobookCollection
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

- (NSString)sortArtist
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("sortArtist"));
}

- (void)setSortArtist:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("sortArtist"), a3);
}

@end
