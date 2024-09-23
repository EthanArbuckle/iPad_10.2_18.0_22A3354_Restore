@implementation PGPetWallpaperSuggestionCandidate

- (PGPetWallpaperSuggestionCandidate)initWithFace:(id)a3 inAsset:(id)a4
{
  id v7;
  id v8;
  PGPetWallpaperSuggestionCandidate *v9;
  PGPetWallpaperSuggestionCandidate *v10;
  uint64_t v11;
  PNWallpaperCropResult *cropResult;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGPetWallpaperSuggestionCandidate;
  v9 = -[PGPetWallpaperSuggestionCandidate init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    objc_storeStrong((id *)&v10->_asset, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77F20]), "initWithAsset:classification:", v8, 2);
    cropResult = v10->_cropResult;
    v10->_cropResult = (PNWallpaperCropResult *)v11;

  }
  return v10;
}

- (PHFace)face
{
  return (PHFace *)objc_getProperty(self, a2, 8, 1);
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 16, 1);
}

- (PNWallpaperCropResult)cropResult
{
  return (PNWallpaperCropResult *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropResult, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
