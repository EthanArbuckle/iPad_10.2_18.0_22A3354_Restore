@implementation PGPeopleCentricSuggestion

- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifier:(id)a3 asset:(id)a4
{
  id v6;
  PGPeopleCentricSuggestion *v7;
  uint64_t v8;
  NSArray *suggestedPersonLocalIdentifiers;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleCentricSuggestion;
  v7 = -[PGSingleAssetSuggestion initWithType:subtype:asset:](&v11, sel_initWithType_subtype_asset_, 3, 304, a4);
  if (v7)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    suggestedPersonLocalIdentifiers = v7->_suggestedPersonLocalIdentifiers;
    v7->_suggestedPersonLocalIdentifiers = (NSArray *)v8;

  }
  return v7;
}

- (PGPeopleCentricSuggestion)initWithPersonLocalIdentifiers:(id)a3 asset:(id)a4
{
  id v7;
  PGPeopleCentricSuggestion *v8;
  PGPeopleCentricSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleCentricSuggestion;
  v8 = -[PGSingleAssetSuggestion initWithType:subtype:asset:](&v11, sel_initWithType_subtype_asset_, 3, 305, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_suggestedPersonLocalIdentifiers, a3);

  return v9;
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
