@implementation PXStoryColorNormalizationEffect

- (PXStoryColorNormalizationEffect)initWithEntityManager:(id)a3
{
  PXStoryColorNormalizationEffect *v3;
  uint64_t v4;
  PXStoryColorNormalizationCubeLibrary *library;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryColorNormalizationEffect;
  v3 = -[PXGColorGradingEffect initWithEntityManager:](&v7, sel_initWithEntityManager_, a3);
  if (v3)
  {
    +[PXStoryColorNormalizationCubeLibrary sharedInstance](PXStoryColorNormalizationCubeLibrary, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    library = v3->_library;
    v3->_library = (PXStoryColorNormalizationCubeLibrary *)v4;

  }
  return v3;
}

- (NSString)effectSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PXGEffect effectId](self, "effectId");
  -[PXGColorGradingEffect colorLookupCube](self, "colorLookupCube");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EffectID:%d Cube:%ld"), v4, objc_msgSend(v5, "edgeSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)effectDetails
{
  void *v2;
  void *v3;

  -[PXStoryColorNormalizationEffect assetNormalization](self, "assetNormalization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAssetNormalization:(id)a3
{
  PFStoryRecipeDisplayAssetNormalization *v5;
  PFStoryRecipeDisplayAssetNormalization *v6;
  char v7;
  PFStoryRecipeDisplayAssetNormalization *v8;

  v8 = (PFStoryRecipeDisplayAssetNormalization *)a3;
  v5 = self->_assetNormalization;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PFStoryRecipeDisplayAssetNormalization isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetNormalization, a3);
      -[PXStoryColorNormalizationEffect _updateColorLookupCube](self, "_updateColorLookupCube");
    }
  }

}

- (void)setCurrentRequestID:(int64_t)a3
{
  if (self->_currentRequestID != a3)
  {
    -[PXStoryColorNormalizationCubeLibrary cancelRequest:](self->_library, "cancelRequest:");
    self->_currentRequestID = a3;
  }
}

- (void)_updateColorLookupCube
{
  PXStoryColorNormalizationCubeLibrary *library;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, uint64_t, uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  library = self->_library;
  -[PXStoryColorNormalizationEffect assetNormalization](self, "assetNormalization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __57__PXStoryColorNormalizationEffect__updateColorLookupCube__block_invoke;
  v9 = &unk_1E511F118;
  objc_copyWeak(&v10, &location);
  v5 = -[PXStoryColorNormalizationCubeLibrary requestColorCubeForAssetNormalization:completionHandler:](library, "requestColorCubeForAssetNormalization:completionHandler:", v4, &v6);
  -[PXStoryColorNormalizationEffect setCurrentRequestID:](self, "setCurrentRequestID:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleResult:(id)a3 resultType:(unint64_t)a4 requestID:(int64_t)a5
{
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  if (a4 >= 2)
  {
    if (a4 == 2 && -[PXStoryColorNormalizationEffect currentRequestID](self, "currentRequestID") == a5)
    {
      -[PXGEffect queue](self, "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__PXStoryColorNormalizationEffect__handleResult_resultType_requestID___block_invoke;
      v10[3] = &unk_1E5148D08;
      v10[4] = self;
      v11 = v8;
      dispatch_async(v9, v10);

    }
  }
  else
  {
    -[PXGColorGradingEffect setColorLookupCube:](self, "setColorLookupCube:", v8);
  }

}

- (PFStoryRecipeDisplayAssetNormalization)assetNormalization
{
  return self->_assetNormalization;
}

- (int64_t)currentRequestID
{
  return self->_currentRequestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetNormalization, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

uint64_t __70__PXStoryColorNormalizationEffect__handleResult_resultType_requestID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setColorLookupCube:", *(_QWORD *)(a1 + 40));
}

void __57__PXStoryColorNormalizationEffect__updateColorLookupCube__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleResult:resultType:requestID:", v7, a3, a4);

}

@end
