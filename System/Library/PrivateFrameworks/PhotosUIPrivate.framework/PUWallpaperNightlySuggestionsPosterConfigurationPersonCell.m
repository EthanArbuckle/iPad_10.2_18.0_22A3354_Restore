@implementation PUWallpaperNightlySuggestionsPosterConfigurationPersonCell

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (void)setPersonLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

@end
