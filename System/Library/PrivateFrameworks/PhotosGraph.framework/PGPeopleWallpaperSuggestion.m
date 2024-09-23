@implementation PGPeopleWallpaperSuggestion

- (PGPeopleWallpaperSuggestion)initWithPersonLocalIdentifier:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 asset:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  PGPeopleWallpaperSuggestion *v11;
  uint64_t v12;
  NSArray *suggestedPersonLocalIdentifiers;
  objc_super v15;
  _QWORD v16[2];

  v7 = a5;
  v8 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPeopleWallpaperSuggestion;
  v11 = -[PGSingleAssetSuggestion initWithType:subtype:asset:](&v15, sel_initWithType_subtype_asset_, v8, v7, a6);
  if (v11)
  {
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    suggestedPersonLocalIdentifiers = v11->_suggestedPersonLocalIdentifiers;
    v11->_suggestedPersonLocalIdentifiers = (NSArray *)v12;

  }
  return v11;
}

- (id)suggestedPersonLocalIdentifiers
{
  return self->_suggestedPersonLocalIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPersonLocalIdentifiers, 0);
}

@end
