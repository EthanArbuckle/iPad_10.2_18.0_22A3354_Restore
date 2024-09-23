@implementation PGPeopleWallpaperSuggesterPersonInformation

- (PGPeopleWallpaperSuggesterPersonInformation)initWithPersonLocalIdentifier:(id)a3 importance:(int64_t)a4 unverifiedMergeCandidateLocalIdentifiers:(id)a5
{
  id v9;
  id v10;
  PGPeopleWallpaperSuggesterPersonInformation *v11;
  PGPeopleWallpaperSuggesterPersonInformation *v12;
  NSSet *v13;
  NSSet *dupedPersonLocalIdentifiers;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PGPeopleWallpaperSuggesterPersonInformation;
  v11 = -[PGPeopleWallpaperSuggesterPersonInformation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifier, a3);
    v12->_importance = a4;
    if (v10)
      v13 = (NSSet *)v10;
    else
      v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    dupedPersonLocalIdentifiers = v12->_dupedPersonLocalIdentifiers;
    v12->_dupedPersonLocalIdentifiers = v13;

  }
  return v12;
}

- (void)mergeImportance:(int64_t)a3
{
  int64_t importance;
  int64_t v4;
  int64_t v5;

  importance = self->_importance;
  v4 = importance | a3;
  if (importance >= a3)
    v5 = a3;
  else
    v5 = self->_importance;
  if (importance <= a3)
    importance = a3;
  if (v4 < 0)
    importance = v5;
  self->_importance = importance;
}

- (NSString)personLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)importance
{
  return self->_importance;
}

- (NSSet)dupedPersonLocalIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dupedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

@end
