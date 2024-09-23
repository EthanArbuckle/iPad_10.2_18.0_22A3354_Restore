@implementation PLPrimaryResourceDataStoreDeferredProcessingRecipe

- (BOOL)_needsVideoFinalizationForImageAsset:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "pathForDeferredVideoComplementFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 && objc_msgSend(v4, "videoDeferredProcessingNeeded") && self->_recipeID == 131280;

  return v6;
}

- (PLPrimaryResourceDataStoreDeferredProcessingRecipe)initWithRecipeID:(unsigned int)a3
{
  uint64_t v3;
  PLPrimaryResourceDataStoreDeferredProcessingRecipe *v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v3 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPrimaryResourceDataStoreDeferredProcessingRecipe;
  v5 = -[PLPrimaryResourceDataStoreDeferredProcessingRecipe init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "classFromRecipeID:", v3);
    if (v6 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLPrimaryResourceDataStoreDeferredProcessingRecipe.m"), 48, CFSTR("Wrong recipe class passed to recipe initializer"));

    }
    v5->_recipeID = v3;
  }
  return v5;
}

- (id)colorSpaceGivenSourceColorSpace:(id)a3 inContext:(id)a4
{
  return a3;
}

- (id)supportedVersionsForLocalResourceGeneration
{
  unsigned int recipeID;

  recipeID = self->_recipeID;
  if (recipeID == 131280 || recipeID == 65944)
    return &unk_1E3763368;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isMarkedFullSize
{
  unsigned int recipeID;

  recipeID = self->_recipeID;
  return recipeID == 65944 || recipeID == 131280;
}

- (void)generateAndStoreForAsset:(id)a3 version:(unsigned int)a4 imageConversionClient:(id)a5 videoConversionClient:(id)a6 conversionServiceOptions:(id)a7 deferredPhotoFinalizer:(id)a8 progress:(id *)a9 reason:(id)a10 completion:(id)a11
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  id *v44;
  id *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void (**v50)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v51[4];
  id v52;
  _QWORD v53[2];
  void (**v54)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[2];
  void (**v59)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[5];

  v12 = *(_QWORD *)&a4;
  v64[3] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  v16 = a11;
  -[PLPrimaryResourceDataStoreDeferredProcessingRecipe supportedVersionsForLocalResourceGeneration](self, "supportedVersionsForLocalResourceGeneration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  v50 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v16;
  if ((v19 & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v63[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v23;
    v63[1] = CFSTR("recipe");
    v49 = v14;
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLPrimaryResourceDataStoreDeferredProcessingRecipe recipeID](self, "recipeID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v25;
    v63[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 47004, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v24;
    v14 = v49;

  }
  objc_msgSend(v14, "fileURLForCurrentDeferredProcessingPreviewFile");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v28
     && ((v29 = objc_msgSend(v14, "deferredProcessingNeeded"), v29 == 10) || v29 == 1)
     && self->_recipeID == 65944;

  v31 = -[PLPrimaryResourceDataStoreDeferredProcessingRecipe _needsVideoFinalizationForImageAsset:](self, "_needsVideoFinalizationForImageAsset:", v14);
  v32 = v31;
  if (!v30 && !v31)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0D74498];
    v61[0] = *MEMORY[0x1E0CB2D50];
    NSStringFromPLErrorCode();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v35;
    v61[1] = CFSTR("recipe");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLPrimaryResourceDataStoreDeferredProcessingRecipe recipeID](self, "recipeID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v36;
    v61[2] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 47006, v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v39;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v50;
    ((void (**)(_QWORD, _QWORD, void *, void *, void *, _QWORD))v50)[2](v50, 0, v20, v40, v42, 0);
    goto LABEL_22;
  }
  if (!v19)
    goto LABEL_15;
  objc_msgSend(v14, "objectID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "libraryServicesManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke;
    v56[3] = &unk_1E36634D8;
    v43 = &v57;
    v57 = v42;
    v44 = (id *)v58;
    v58[0] = v40;
    v58[1] = self;
    v60 = v12;
    v45 = (id *)&v59;
    v46 = v50;
    v59 = v50;
    objc_msgSend(v15, "requestFinalizationOfAsset:isBackgroundPriority:reason:completionHandler:", v14, 0, CFSTR("generate deferred processing derivatives"), v56);
  }
  else
  {
    if (!v32)
    {
      v46 = v50;
      goto LABEL_22;
    }
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_38;
    v51[3] = &unk_1E36634D8;
    v43 = &v52;
    v52 = v42;
    v44 = (id *)v53;
    v53[0] = v40;
    v53[1] = self;
    v55 = v12;
    v45 = (id *)&v54;
    v54 = v50;
    objc_msgSend(v15, "requestFrameDropRecoveryForAsset:completionHandler:", v14, v51);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (a9)
      *a9 = objc_retainAutorelease(v47);

    v46 = v50;
  }

LABEL_22:
}

- (id)description
{
  return PLResourceRecipeIDDescription(self->_recipeID, 1);
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  int v26;
  _QWORD v27[5];
  id v28;

  v3 = a2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__12775;
  v27[4] = __Block_byref_object_dispose__12776;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLPrimaryResourceDataStoreDeferredProcessingRecipe generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:]_block_invoke", v6);

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2;
  v16[3] = &unk_1E3663500;
  v10 = v7;
  v17 = v10;
  v18 = *(id *)(a1 + 40);
  v11 = v3;
  v25 = v27;
  v12 = *(_QWORD *)(a1 + 48);
  v19 = v11;
  v20 = v12;
  v26 = *(_DWORD *)(a1 + 64);
  v13 = v4;
  v21 = v13;
  v14 = v5;
  v22 = v14;
  v24 = *(id *)(a1 + 56);
  v15 = v8;
  v23 = v15;
  objc_msgSend(v9, "asyncPerformOnContext:identifyingBlock:block:", v15, 0, v16);

  _Block_object_dispose(v27, 8);
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  int v26;
  _QWORD v27[5];
  id v28;

  v3 = a2;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__12775;
  v27[4] = __Block_byref_object_dispose__12776;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLPrimaryResourceDataStoreDeferredProcessingRecipe generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:]_block_invoke", v6);

  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2_39;
  v16[3] = &unk_1E3663500;
  v10 = v7;
  v17 = v10;
  v18 = *(id *)(a1 + 40);
  v11 = v3;
  v25 = v27;
  v12 = *(_QWORD *)(a1 + 48);
  v19 = v11;
  v20 = v12;
  v26 = *(_DWORD *)(a1 + 64);
  v13 = v4;
  v21 = v13;
  v24 = *(id *)(a1 + 56);
  v14 = v8;
  v22 = v14;
  v15 = v5;
  v23 = v15;
  objc_msgSend(v9, "asyncPerformOnContext:identifyingBlock:block:", v14, 0, v16);

  _Block_object_dispose(v27, 8);
}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2_39(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (v4)
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
      goto LABEL_12;
    }
    PLDeferredProcessingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to request frame drop recovery for asset with error %@", buf, 0xCu);
    }

    v8 = *(unsigned int *)(a1 + 104);
    v10 = *(id *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    goto LABEL_10;
  }
  if (v5)
  {
    PLDeferredProcessingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error fetching object in moc with assetID %@: %@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 56);
    v8 = *(unsigned int *)(a1 + 104);
    v10 = v5;
LABEL_10:
    objc_msgSend(v9, "recipeErrorWithCode:version:underlyingError:debugDescription:", 47001, v8, v10, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

void __206__PLPrimaryResourceDataStoreDeferredProcessingRecipe_generateAndStoreForAsset_version_imageConversionClient_videoConversionClient_conversionServiceOptions_deferredPhotoFinalizer_progress_reason_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v20 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;

  if (v4)
  {
    if (!*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 64), "addObject:", *(_QWORD *)(a1 + 56));
      v17 = *(void **)(a1 + 72);
      objc_msgSend(v4, "assetID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "libraryID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLResourceGenerator fileAndTableBackedThumbnailManagerRecipesForLibraryID:](PLResourceGenerator, "fileAndTableBackedThumbnailManagerRecipesForLibraryID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "unionOrderedSet:", v19);

      goto LABEL_12;
    }
    PLDeferredProcessingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to finalize asset with error %@", buf, 0xCu);
    }

    v8 = *(unsigned int *)(a1 + 104);
    v10 = *(id *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    v11 = 47007;
LABEL_10:
    objc_msgSend(v9, "recipeErrorWithCode:version:underlyingError:debugDescription:", v11, v8, v10, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
LABEL_12:

    goto LABEL_13;
  }
  if (v5)
  {
    PLDeferredProcessingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error fetching object in moc with assetID %@: %@", buf, 0x16u);
    }

    v9 = *(void **)(a1 + 56);
    v8 = *(unsigned int *)(a1 + 104);
    v11 = 47001;
    v10 = v5;
    goto LABEL_10;
  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

@end
