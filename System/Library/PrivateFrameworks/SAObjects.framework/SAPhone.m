@implementation SAPhone

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("Phone");
}

+ (id)phone
{
  return objc_alloc_init((Class)a1);
}

- (NSNumber)favoriteFacetime
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("favoriteFacetime"));
}

- (void)setFavoriteFacetime:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("favoriteFacetime"), a3);
}

- (NSNumber)favoriteFacetimeAudio
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("favoriteFacetimeAudio"));
}

- (void)setFavoriteFacetimeAudio:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("favoriteFacetimeAudio"), a3);
}

- (NSNumber)favoriteVoice
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("favoriteVoice"));
}

- (void)setFavoriteVoice:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("favoriteVoice"), a3);
}

- (NSString)label
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("label"));
}

- (void)setLabel:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("label"), a3);
}

- (NSString)number
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("number"));
}

- (void)setNumber:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("number"), a3);
}

- (NSNumber)pseudo
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("pseudo"));
}

- (void)setPseudo:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("pseudo"), a3);
}

@end
