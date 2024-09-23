@implementation PLResourceRecipe

- (BOOL)isEqual:(id)a3
{
  PLResourceRecipe *v4;
  PLResourceRecipe *v5;
  PLResourceRecipe *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v4 = (PLResourceRecipe *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[PLResourceRecipe recipeID](self, "recipeID");
    v8 = -[PLResourceRecipe recipeID](v6, "recipeID");

    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return -[PLResourceRecipe recipeID](self, "recipeID");
}

- (PLResourceRecipe)initWithRecipeID:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return 0;
}

- (unsigned)recipeID
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (id)codecFourCharCodeName
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Subclasses must override %@"), v4);

  return 0;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return 0;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Subclasses must override %@"), v6);

  return 0;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  void *v11;
  uint64_t v12;
  id v13;

  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "raise:format:", v12, CFSTR("Subclasses must override %@"), v13);

}

- (id)expectedSizeFromWidth:(int64_t)a3 height:(int64_t)a4
{
  return 0;
}

- (id)uti
{
  return 0;
}

- (BOOL)colorSpaceIsNativeForDisplay
{
  return 0;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  return 0;
}

- (id)maxPixelCountForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  return 0;
}

- (BOOL)isMarkedFullSize
{
  return 0;
}

- (BOOL)isDerivative
{
  return -[PLResourceRecipe recipeID](self, "recipeID") & 1;
}

- (unsigned)recipeClassID
{
  return -[PLResourceRecipe recipeID](self, "recipeID") >> 16;
}

- (unsigned)orientation
{
  return 1;
}

- (id)recipeErrorWithCode:(int64_t)a3 version:(unsigned int)a4 underlyingError:(id)a5 debugDescription:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB2938]);
  }
  else
  {
    NSStringFromPLErrorCode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2938]);

  }
  -[PLResourceRecipe description](self, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("recipe"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("version"));

  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], a3, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)populateAdjustedRecipeIngredients:(id)a3 asset:(id)a4 version:(unsigned int)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "hasAdjustments");
  if (a5 == 2 && v9)
  {
    objc_msgSend(v8, "adjustmentDataResource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "adjustmentDictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D73368]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        v15 = objc_msgSend(v13, "integerValue");
      else
        v15 = 0;
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("Adjustment"));

    }
    else
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video for adjustment data", (uint8_t *)&v31, 2u);
      }

      v15 = 0;
    }
    objc_msgSend(v8, "overflowAdjustmentDataResource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("LargeAdjustment"));
    v18 = objc_msgSend(v8, "cameraProcessingAdjustmentState");
    if (!objc_msgSend(v8, "isPhoto"))
    {
      if (!objc_msgSend(v8, "isVideo"))
      {
LABEL_54:

        goto LABEL_55;
      }
      if (v15)
        v19 = &__block_literal_global_177;
      else
        v19 = &__block_literal_global_175_50006;
      objc_msgSend(v8, "firstPersistedResourceMatching:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
      if (v20)
      {
        if (v22)
        {
          v31 = 138412290;
          v32 = v20;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Resource generation selected video resource for primary video recipe: %@", (uint8_t *)&v31, 0xCu);
        }

        objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("Video"));
        if ((v18 & 1) == 0)
          goto LABEL_53;
      }
      else
      {
        if (v22)
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video for primary video recipe", (uint8_t *)&v31, 2u);
        }

        if ((v18 & 1) == 0)
          goto LABEL_53;
      }
      objc_msgSend(v8, "firstPersistedResourceMatching:", &__block_literal_global_179);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("SpatialOvercapture"));
      goto LABEL_52;
    }
    if (v15)
      objc_msgSend(v8, "firstPersistedResourceMatching:", &__block_literal_global_167_49998);
    else
      objc_msgSend(v8, "primaryStoreOriginalResource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v24)
      {
        v31 = 138412290;
        v32 = v20;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for primary image recipe: %@", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("Image"));
      if ((v18 & 1) != 0)
      {
LABEL_30:
        objc_msgSend(v8, "firstPersistedResourceMatching:", &__block_literal_global_169);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("SpatialOvercapture"));

      }
    }
    else
    {
      if (v24)
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Resource generation failed to find image for primary image recipe", (uint8_t *)&v31, 2u);
      }

      if ((v18 & 1) != 0)
        goto LABEL_30;
    }
    if (!objc_msgSend(v8, "isPhotoIris"))
    {
LABEL_53:

      goto LABEL_54;
    }
    if (v15)
      v26 = &__block_literal_global_171_50002;
    else
      v26 = &__block_literal_global_170_50001;
    objc_msgSend(v8, "firstPersistedResourceMatching:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (v27)
    {
      if (v29)
      {
        v31 = 138412290;
        v32 = v27;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Resource generation selected video complement resource: %@", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("VideoComplement"));
      if ((v18 & 1) == 0)
        goto LABEL_52;
    }
    else
    {
      if (v29)
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Resource generation failed to find video complement resource.", (uint8_t *)&v31, 2u);
      }

      if ((v18 & 1) == 0)
        goto LABEL_52;
    }
    objc_msgSend(v8, "firstPersistedResourceMatching:", &__block_literal_global_173_50005);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("SpatialOvercapture"));

LABEL_52:
    goto LABEL_53;
  }
LABEL_55:

}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_178(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 23;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_3_176(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 25;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_2_174(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 1;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_172(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 24;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 20;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 18;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke_168(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 23;
}

BOOL __68__PLResourceRecipe_populateAdjustedRecipeIngredients_asset_version___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cplType") == 15;
}

+ (Class)classFromRecipeID:(unsigned int)a3
{
  void *v3;

  switch(HIWORD(a3))
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
      v3 = (void *)objc_opt_class();
      break;
    default:
      v3 = 0;
      break;
  }
  return (Class)v3;
}

+ (id)recipeFromID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v8;
  void *v9;
  void *v10;

  v3 = *(_QWORD *)&a3;
  if (recipeFromID__s_onceToken != -1)
    dispatch_once(&recipeFromID__s_onceToken, &__block_literal_global_50019);
  os_unfair_lock_lock((os_unfair_lock_t)&recipeFromID__s_lock);
  v4 = (void *)recipeFromID__s_recipesByID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v8)
    {
      v6 = (void *)objc_msgSend([v8 alloc], "initWithRecipeID:", v3);
      if (v6)
      {
        v9 = (void *)recipeFromID__s_recipesByID;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v10);

      }
    }
    else
    {
      v6 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&recipeFromID__s_lock);
  return v6;
}

void __33__PLResourceRecipe_recipeFromID___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)recipeFromID__s_recipesByID;
  recipeFromID__s_recipesByID = (uint64_t)v0;

  recipeFromID__s_lock = 0;
}

@end
