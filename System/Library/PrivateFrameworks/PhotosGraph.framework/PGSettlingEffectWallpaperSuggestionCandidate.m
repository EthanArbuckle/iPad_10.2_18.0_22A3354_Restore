@implementation PGSettlingEffectWallpaperSuggestionCandidate

- (PGSettlingEffectWallpaperSuggestionCandidate)initWithAsset:(id)a3 suggestion:(id)a4
{
  id v7;
  id v8;
  PGSettlingEffectWallpaperSuggestionCandidate *v9;
  PGSettlingEffectWallpaperSuggestionCandidate *v10;
  uint64_t v11;
  PNWallpaperCropResult *cropResult;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGSettlingEffectWallpaperSuggestionCandidate;
  v9 = -[PGSettlingEffectWallpaperSuggestionCandidate init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77F20]), "initWithAsset:classification:", v7, 5);
    cropResult = v10->_cropResult;
    v10->_cropResult = (PNWallpaperCropResult *)v11;

    objc_storeStrong((id *)&v10->_suggestion, a4);
  }

  return v10;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 8, 1);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 16, 1);
}

- (PHSuggestion)suggestion
{
  return (PHSuggestion *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (id)sortDescriptorsForProcessing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.activityScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.settlingEffectScore"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.autoplaySuggestionScore"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.wallpaperScore"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.favorite"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.creationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
