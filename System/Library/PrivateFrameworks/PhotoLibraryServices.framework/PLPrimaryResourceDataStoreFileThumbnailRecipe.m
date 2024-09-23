@implementation PLPrimaryResourceDataStoreFileThumbnailRecipe

- (BOOL)_isAspectShortSizing
{
  return ((*(&self->super._recipeID + 1) - 272151) & 0xFFFFFFFB) == 0;
}

- (double)_shortSideTargetLength
{
  uint64_t v2;

  v2 = *(&self->super._recipeID + 1);
  if ((_DWORD)v2 == 272151)
    return 256.0;
  if ((_DWORD)v2 == 272155)
    return 360.0;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Short side length called on a non-short side recipe ID: %ld"), v2);
  return -1.0;
}

- (double)_longSideTargetLength
{
  uint64_t v2;

  v2 = *(&self->super._recipeID + 1);
  if ((_DWORD)v2 == 269159)
    return 360.0;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Long side length called on a non-long side recipe ID: %ld"), v2);
  return -1.0;
}

- (PLPrimaryResourceDataStoreFileThumbnailRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3;
  PLPrimaryResourceDataStoreFileThumbnailRecipe *v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreFileThumbnailRecipe;
  v5 = -[PLPrimaryResourceDataStoreFileThumbnailRecipe init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v6 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLPrimaryResourceDataStoreFileThumbnailRecipe.m"), 84, CFSTR("wrong recipe class passed to recipe initializer."));

    }
    *(&v5->super._recipeID + 1) = v3;
  }
  return v5;
}

- (id)uti
{
  return +[PLUniformTypeIdentifier jpegUniformTypeIdentifier](PLUniformTypeIdentifier, "jpegUniformTypeIdentifier");
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return a3;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  return &unk_1E3763968;
}

- (id)chooseIngredientsFrom:(id)a3 version:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  char v20;
  int v21;
  int v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPrimaryResourceDataStoreFileThumbnailRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v10, "addIndex:", 0);
    if (objc_msgSend(v6, "isRAWPlusJPEGWithRAWOnTop"))
      objc_msgSend(v10, "addIndex:", 4);
    if (objc_msgSend(v6, "hasAdjustments"))
      v11 = 2;
    else
      v11 = 0;
    objc_msgSend(v6, "resourcesSortedByQuality");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v13)
    {
      v14 = v13;
      v30 = 0;
      v15 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsIndex:", objc_msgSend(v17, "resourceType"))
            && objc_msgSend(v17, "version") == v11
            && (int)objc_msgSend(v17, "localAvailability") >= 1)
          {
            v18 = v6;
            if (objc_msgSend(v6, "isRAWPlusJPEGWithRAWOnTop")
              && (objc_msgSend(v17, "isDerivative") & 1) == 0
              && (objc_msgSend(v17, "uniformTypeIdentifier"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  v20 = objc_msgSend(v19, "isPrimaryImageFormat"),
                  v19,
                  (v20 & 1) != 0))
            {
              v6 = v18;
            }
            else
            {
              if ((objc_msgSend(v17, "isDerivative") & 1) == 0)
              {
                v25 = v17;

                v30 = v25;
                v6 = v18;
                goto LABEL_31;
              }
              v21 = objc_msgSend(v17, "recipeID");
              v22 = v21;
              if (v21 == 65938 || v21 == 65737)
              {
                v23 = v17;

                v30 = v23;
              }
              v6 = v18;
              if (v22 == 65737 || v22 == 65938)
                goto LABEL_31;
            }
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v14)
          continue;
        break;
      }
LABEL_31:

      v26 = v30;
      if (v30)
      {
        PLBackendGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v30;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Resource generation selected image resource for thumbnail recipe: %@", buf, 0xCu);
        }

        v35 = CFSTR("Image");
        v36 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

        goto LABEL_39;
      }
    }
    else
    {

    }
    PLBackendGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Resource generation failed to find image for thumbnail recipe", buf, 2u);
    }

    v26 = 0;
    v24 = 0;
    goto LABEL_38;
  }
  v24 = 0;
LABEL_39:

  return v24;
}

- (id)expectedFileURLForVersion:(unsigned int)a3 asset:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0D732F0];
  v6 = a4;
  objc_msgSend(v6, "thumbnailIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v7, v8, -[PLPrimaryResourceDataStoreFileThumbnailRecipe recipeID](self, "recipeID"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v11;
  id v13;
  void *v14;
  void (**v15)(id, void *, void *, void *, void *, _QWORD);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[4];

  v11 = *(_QWORD *)&a4;
  v49[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0C99E20];
  v15 = (void (**)(id, void *, void *, void *, void *, _QWORD))a11;
  objc_msgSend(v14, "set");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "libraryID");
  v18 = objc_claimAutoreleasedReturnValue();

  -[PLPrimaryResourceDataStoreFileThumbnailRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "containsObject:", v20);

  v42 = v18;
  v44 = (void *)v16;
  if (v21)
  {
    if ((PLIsAssetsd() & 1) != 0)
    {
      -[PLPrimaryResourceDataStoreFileThumbnailRecipe chooseIngredientsFrom:version:](self, "chooseIngredientsFrom:version:", v13, v11, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Image"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v23, "dataStoreKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileURLForAssetID:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v45 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v26, 1, &v45);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(v13, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, 0, v27, 0);
      if (objc_msgSend(v13, "hasAllThumbs"))
      {
        +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:](PLResourceGenerator, "fileAndTableBackedThumbnailManagerRecipesForLibraryID:", v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "set");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "unionSet:", v33);

        if (objc_msgSend(v13, "hasAdjustments"))
          v34 = 2;
        else
          v34 = 0;
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65737);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLResourceInstaller onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:](PLResourceInstaller, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:", v35, v34, v13);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v44, "addObject:", v35);

        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65741);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLResourceInstaller onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:](PLResourceInstaller, "onDemand_installPrimaryImageResourceWithRecipe:version:forAsset:", v29, v34, v13);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v44, "addObject:", v29);
        v32 = 0;
      }
      else
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v39 = *MEMORY[0x1E0D74498];
        v46[0] = *MEMORY[0x1E0CB2D50];
        NSStringFromPLErrorCode();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v31;
        v47[1] = self;
        v46[1] = CFSTR("recipe");
        v46[2] = CFSTR("version");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2] = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 47008, v37);
        v32 = objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_24;
    }
    v29 = 0;
    v28 = *MEMORY[0x1E0D74498];
  }
  else
  {
    v28 = *MEMORY[0x1E0D74498];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47004, 0, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PLIsAssetsd() & 1) != 0)
      goto LABEL_25;
  }
  v30 = (void *)MEMORY[0x1E0CB35C8];
  v48[0] = *MEMORY[0x1E0CB2D50];
  NSStringFromPLErrorCode();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v27;
  v49[1] = self;
  v48[1] = CFSTR("recipe");
  v48[2] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", v28, 47008, v31);
  v32 = objc_claimAutoreleasedReturnValue();
LABEL_24:

  v29 = (void *)v32;
LABEL_25:
  objc_msgSend(v13, "managedObjectContext", v42);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v40, v29, v44, v41, 0);

}

- (CGSize)sizeForAssetWidth:(int64_t)a3 height:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v5 = (double)a3;
  v6 = (double)a4;
  if (-[PLPrimaryResourceDataStoreFileThumbnailRecipe _isAspectShortSizing](self, "_isAspectShortSizing"))
  {
    -[PLPrimaryResourceDataStoreFileThumbnailRecipe _shortSideTargetLength](self, "_shortSideTargetLength");
    objc_msgSend((id)objc_opt_class(), "scaleOriginalSize:toShortSideTarget:maxLongSideLength:", v5, v6, v7, v7 * 5.0);
  }
  else
  {
    -[PLPrimaryResourceDataStoreFileThumbnailRecipe _longSideTargetLength](self, "_longSideTargetLength");
    objc_msgSend((id)objc_opt_class(), "scaleOriginalSize:toLongSideTarget:", v5, v6, v10);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)description
{
  return PLResourceRecipeIDDescription(*(&self->super._recipeID + 1), 1);
}

- (unsigned)recipeID
{
  return *(&self->super._recipeID + 1);
}

- (void)setRecipeID:(unsigned int)a3
{
  *(&self->super._recipeID + 1) = a3;
}

@end
