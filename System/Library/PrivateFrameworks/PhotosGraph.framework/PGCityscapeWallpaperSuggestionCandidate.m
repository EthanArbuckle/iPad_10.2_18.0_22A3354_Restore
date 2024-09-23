@implementation PGCityscapeWallpaperSuggestionCandidate

- (PGCityscapeWallpaperSuggestionCandidate)initWithAsset:(id)a3
{
  id v5;
  PGCityscapeWallpaperSuggestionCandidate *v6;
  PGCityscapeWallpaperSuggestionCandidate *v7;
  uint64_t v8;
  PNWallpaperCropResult *cropResult;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGCityscapeWallpaperSuggestionCandidate;
  v6 = -[PGCityscapeWallpaperSuggestionCandidate init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asset, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77F20]), "initWithAsset:classification:", v5, 4);
    cropResult = v7->_cropResult;
    v7->_cropResult = (PNWallpaperCropResult *)v8;

  }
  return v7;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 8, 1);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
