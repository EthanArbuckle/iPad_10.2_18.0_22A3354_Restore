@implementation PXMediaAnalysisVideoStabilizationRecipeSource

- (PXMediaAnalysisVideoStabilizationRecipeSource)initWithAsset:(id)a3 videoDimensions:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  PXMediaAnalysisVideoStabilizationRecipeSource *v9;
  PXMediaAnalysisVideoStabilizationRecipeSource *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXMediaAnalysisVideoStabilizationRecipeSource;
  v9 = -[PXVideoStabilizationRecipeSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_videoDimensions.width = width;
    v10->_videoDimensions.height = height;
  }

  return v10;
}

- (id)analyticsPayload
{
  uint64_t v2;
  void *v3;
  void *v4;
  PHAsset *asset;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D09828];
  asset = self->_asset;
  v7 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &asset, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_loadStabilizationRecipe:(id *)a3 analysisType:(unint64_t *)a4
{
  id v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  unint64_t v31;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__198171;
  v51 = __Block_byref_object_dispose__198172;
  v52 = 0;
  -[PHAsset localIdentifier](self->_asset, "localIdentifier");
  v34 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = -[PXVideoStabilizationRecipeSource allowedAnalysisTypes](self, "allowedAnalysisTypes");
  if ((v8 & 2) != 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("GyroStabilization"), v34);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AllowOnDemandGyro"));
  }
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PixelStabilization"));
    if (-[PXVideoStabilizationRecipeSource allowsOnDemandPixelAnalysis](self, "allowsOnDemandPixelAnalysis"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AllowOnDemandPixel"));
  }
  objc_msgSend(MEMORY[0x1E0D475C0], "sharedAnalysisService", v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__198171;
  v45 = __Block_byref_object_dispose__198172;
  v46 = 0;
  +[PXInlineVideoStabilizationSettings sharedInstance](PXInlineVideoStabilizationSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "localCacheForMediaAnalysisRecipes");

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "cachedRecipeForAsset:", self->_asset);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v42[5];
    v42[5] = v12;

  }
  v14 = (void *)v42[5];
  if (v14)
    goto LABEL_14;
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v55[0] = self->_asset;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __87__PXMediaAnalysisVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke;
  v36[3] = &unk_1E5134A68;
  v39 = &v47;
  v40 = &v41;
  v37 = v35;
  v17 = v15;
  v38 = v17;
  v18 = objc_msgSend(v9, "requestVideoStabilizationForAssets:withOptions:progressHandler:andCompletionHandler:", v16, v7, 0, v36);

  v19 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v17, v19))
  {
    objc_msgSend(v9, "cancelRequest:", v18);
    v20 = MEMORY[0x1E0C81028];
    v21 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      -[PHAsset uuid](self->_asset, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v33;
      _os_log_error_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Video stabilization request timed out for asset %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend((id)objc_opt_class(), "cacheRecipe:forAsset:", v42[5], self->_asset);

  v14 = (void *)v42[5];
  if (v14)
  {
LABEL_14:
    v22 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v22, "removeObjectsForKeys:", &unk_1E53EA1E8);
    v23 = (void *)objc_msgSend(v22, "copy");
    -[PXVideoStabilizationRecipeSource setDebugInfo:](self, "setDebugInfo:", v23);

    ICCreateCorrectionHomographiesWithNewImageCoordinates();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (v24)
    {
      v26 = v24;
      objc_msgSend((id)v42[5], "objectForKeyedSubscript:", CFSTR("gyroStabilization"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "BOOLValue");

      v29 = -[PXVideoStabilizationRecipeSource allowedAnalysisTypes](self, "allowedAnalysisTypes");
      v30 = 0;
      if (v28)
        v31 = v29 & 2;
      else
        v31 = v29 & 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v25, CFSTR("Recipe Denormalization Failed"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
    }

    if (!a4)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v48[5], CFSTR("No recipe returned by MediaAnalysis"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v24 = 0;
  if (a4)
LABEL_20:
    *a4 = v31;
LABEL_21:
  if (a3)
    *a3 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

void __87__PXMediaAnalysisVideoStabilizationRecipeSource__loadStabilizationRecipe_analysisType___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)cachedRecipeForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a3;
  v4 = (void *)RecipeCache;
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AdjustmentDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "adjustmentTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7 == v8)
    {

      if (!v10)
        goto LABEL_4;
    }
    else
    {
      v11 = objc_msgSend(v9, "isEqualToDate:", v7);

      if (v11)
      {
LABEL_4:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Recipe"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

        goto LABEL_9;
      }
    }
    v12 = 0;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (void)cacheRecipe:(id)a3 forAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (cacheRecipe_forAsset__onceToken != -1)
  {
    dispatch_once(&cacheRecipe_forAsset__onceToken, &__block_literal_global_198231);
    if (v5)
      goto LABEL_3;
LABEL_9:
    v12 = (void *)RecipeCache;
    objc_msgSend(v6, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

    goto LABEL_10;
  }
  if (!v5)
    goto LABEL_9;
LABEL_3:
  v14[0] = CFSTR("AdjustmentDate");
  objc_msgSend(v6, "adjustmentTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = CFSTR("Recipe");
  v15[0] = v8;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  v10 = (void *)RecipeCache;
  objc_msgSend(v6, "localIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v11);

LABEL_10:
}

uint64_t __70__PXMediaAnalysisVideoStabilizationRecipeSource_cacheRecipe_forAsset___block_invoke()
{
  PXLRUMemoryCache *v0;
  void *v1;

  v0 = objc_alloc_init(PXLRUMemoryCache);
  v1 = (void *)RecipeCache;
  RecipeCache = (uint64_t)v0;

  return objc_msgSend((id)RecipeCache, "setNumberOfSlots:", 20);
}

@end
