@implementation PGLongTailSuggestionCandidate

- (PGLongTailSuggestionCandidate)initWithAsset:(id)a3 score:(unint64_t)a4
{
  id v7;
  PGLongTailSuggestionCandidate *v8;
  PGLongTailSuggestionCandidate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGLongTailSuggestionCandidate;
  v8 = -[PGLongTailSuggestionCandidate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_asset, a3);
    v9->_score = a4;
  }

  return v9;
}

- (BOOL)isValidWithMeNodeLocalIdentifier:(id)a3
{
  int v4;

  v4 = -[PGLongTailSuggestionCandidate isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:](self, "isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:", a3);
  if (v4)
    LOBYTE(v4) = -[PHAsset clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:](self->_asset, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 0, 0) ^ 1;
  return v4;
}

- (BOOL)isValidBeforeKeyItemFilterWithMeNodeLocalIdentifier:(id)a3
{
  id v4;
  double v5;
  double v6;
  _BOOL4 v7;
  uint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a3;
  if ((-[PHAsset clsIsNonMemorable](self->_asset, "clsIsNonMemorable") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", self->_asset)
    || (-[PHAsset clsIsTragicFailure](self->_asset, "clsIsTragicFailure") & 1) != 0
    || (-[PHAsset clsIsUtility](self->_asset, "clsIsUtility") & 1) != 0
    || (-[PHAsset aspectRatio](self->_asset, "aspectRatio"), v5 >= 3.0))
  {
    v7 = 0;
  }
  else
  {
    -[PHAsset aspectRatio](self->_asset, "aspectRatio");
    v7 = v6 > 0.333333343;
  }
  v8 = -[PHAsset clsPeopleCount](self->_asset, "clsPeopleCount");
  if (v8)
    v9 = 0;
  else
    v9 = v7;
  if (v8)
    v10 = !v7;
  else
    v10 = 1;
  if (!v10)
  {
    -[PHAsset clsConsolidatedPersonLocalIdentifiers](self->_asset, "clsConsolidatedPersonLocalIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "count") != 0;

  }
  if (v4)
  {
    v12 = -[PHAsset clsPeopleCount](self->_asset, "clsPeopleCount");
    LOBYTE(v13) = v12 != 1 && v9;
    if (v12 == 1 && v9)
    {
      -[PHAsset clsPersonLocalIdentifiers](self->_asset, "clsPersonLocalIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "isEqualToString:", v4) ^ 1;

    }
  }
  else
  {
    LOBYTE(v13) = v9;
  }

  return v13;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (unint64_t)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
