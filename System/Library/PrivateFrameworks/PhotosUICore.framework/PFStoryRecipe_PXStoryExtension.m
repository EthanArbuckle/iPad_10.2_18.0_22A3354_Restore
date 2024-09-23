@implementation PFStoryRecipe_PXStoryExtension

+ (BOOL)recipeContainsAnyDisplayAsset:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PFStoryRecipe_PXStoryExtension_recipeContainsAnyDisplayAsset___block_invoke;
  v6[3] = &unk_1E511CC50;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateAssetsWithKind:usingBlock:", 1, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)displayAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__44750;
  v29 = __Block_byref_object_dispose__44751;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __75__PFStoryRecipe_PXStoryExtension_displayAssetsInRecipe_withCategory_error___block_invoke;
  v24[3] = &unk_1E511CC50;
  v24[4] = &v25;
  objc_msgSend(v8, "enumerateAssetsWithKind:usingBlock:", 1, v24);
  v9 = (void *)v26[5];
  if (!v9)
  {
    PXDisplayAssetFetchResultEmpty();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(a1, "schemeForPHAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    v23 = 0;
    objc_msgSend(a1, "PHAssetsInRecipe:withCategory:error:", v8, a4, &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    goto LABEL_8;
  }
  v15 = (void *)v26[5];
  objc_msgSend(a1, "schemeForSyntheticAssets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v15, "isEqualToString:", v16);

  if ((_DWORD)v15)
  {
    v22 = 0;
    objc_msgSend(a1, "syntheticAssetsInRecipe:withCategory:error:", v8, a4, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
LABEL_8:
    v14 = v13;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v31 = *MEMORY[0x1E0CB2938];
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("Unknown asset scheme %@"), v26[5]);
  v32[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v20);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (a5)
LABEL_11:
    *a5 = objc_retainAutorelease(v14);
LABEL_12:

  _Block_object_dispose(&v25, 8);
  return v12;
}

+ (BOOL)addDisplayAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (!objc_msgSend(v10, "count"))
  {
    v15 = 0;
    v13 = 1;
    if (!a6)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0;
    v13 = objc_msgSend(a1, "addPHAssets:toRecipe:withCategory:error:", v10, v11, a5, &v21);
    v14 = v21;
LABEL_8:
    v15 = v14;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0;
    v13 = objc_msgSend(a1, "addSyntheticAssets:toRecipe:withCategory:error:", v10, v11, a5, &v20);
    v14 = v20;
    goto LABEL_8;
  }
  v16 = (void *)MEMORY[0x1E0CB35C8];
  v22 = *MEMORY[0x1E0CB2938];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown display asset fetch result %@ containing %@"), v10, v12);
  v23[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v18);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = 0;
LABEL_10:

  if (a6)
LABEL_11:
    *a6 = objc_retainAutorelease(v15);
LABEL_12:

  return v13;
}

+ (id)flexFetchQueue
{
  if (flexFetchQueue_onceToken != -1)
    dispatch_once(&flexFetchQueue_onceToken, &__block_literal_global_44741);
  return (id)flexFetchQueue_queue;
}

+ (id)requestAudioAssetFromRecipeAsset:(id)a3 recipe:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  void (**v16)(void *, _QWORD, uint64_t, void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  PXMockAudioAsset *v42;
  id v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  PXMusicCuratorAudioAssetRequestOptions *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  PXMockAudioAsset *v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD block[4];
  id v73;
  id v74;
  id v75;
  id v76;
  void (**v77)(void *, _QWORD, uint64_t, void *);
  _QWORD v78[4];
  void (**v79)(void *, _QWORD, uint64_t, void *);
  _QWORD aBlock[4];
  id v81;
  id v82;
  uint8_t buf[8];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLAudioPlaybackGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, a1);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PFStoryRecipe_PXStoryExtension - requestAudioAssetFromRecipeAsset", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke;
  aBlock[3] = &unk_1E511CC98;
  v82 = a1;
  v15 = v10;
  v81 = v15;
  v16 = (void (**)(void *, _QWORD, uint64_t, void *))_Block_copy(aBlock);
  if (objc_msgSend(v8, "kind") != 2)
  {
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("not a song recipe asset: %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v8);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    if (!v40)
    {
LABEL_14:
      v42 = 0;
      goto LABEL_15;
    }
LABEL_13:
    v16[2](v16, 0, 1, v40);
    goto LABEL_14;
  }
  v23 = v8;
  objc_msgSend(v23, "catalog");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = (id)*MEMORY[0x1E0D759E8];
  if (v24 == v25)
  {

    goto LABEL_17;
  }
  v26 = v25;
  v27 = objc_msgSend(v24, "isEqualToString:", v25);

  if (v27)
  {
LABEL_17:
    objc_msgSend(v23, "songID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      +[PFStoryRecipe_PXStoryExtension PHPhotoLibraryForRecipe:](PFStoryRecipe_PXStoryExtension, "PHPhotoLibraryForRecipe:", v9);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v23;
      v53 = v15;
      v54 = v9;
      v55 = objc_alloc_init(PXMusicCuratorAudioAssetRequestOptions);
      v84[0] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v14;
      v58 = (void *)v56;
      v78[0] = v57;
      v78[1] = 3221225472;
      v78[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_143;
      v78[3] = &unk_1E511CCC0;
      v79 = v16;
      +[PXMusicCurator requestAudioAssetFetchResultForAdamIDs:requestOptions:photoLibrary:completionHandler:](PXMusicCurator, "requestAudioAssetFetchResultForAdamIDs:requestOptions:photoLibrary:completionHandler:", v58, v55, v52, v78);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      v9 = v54;
      v15 = v53;
      v23 = v69;

LABEL_23:
      v40 = 0;
LABEL_26:

LABEL_27:
      if (!v40)
        goto LABEL_14;
      goto LABEL_13;
    }
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("missing Adam ID for Apple Music song: %@"), v45, v46, v47, v48, v49, v50, (uint64_t)v23);
LABEL_25:
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    goto LABEL_26;
  }
  v28 = (id)*MEMORY[0x1E0D759F0];
  if (v24 == v28)
  {

    goto LABEL_21;
  }
  v29 = v28;
  v30 = objc_msgSend(v24, "isEqualToString:", v28);

  if (v30)
  {
LABEL_21:
    objc_msgSend(v23, "songID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "flexFetchQueue");
      v66 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_2;
      block[3] = &unk_1E5139650;
      v73 = v51;
      v74 = 0;
      v75 = v23;
      v41 = v65;
      v76 = v41;
      v77 = v16;
      dispatch_async(v66, block);

      goto LABEL_23;
    }
    PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("missing Flex ID for Flex Music song: %@"), v59, v60, v61, v62, v63, v64, (uint64_t)v23);
    goto LABEL_25;
  }
  v31 = (id)*MEMORY[0x1E0D759F8];
  if (v24 == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = objc_msgSend(v24, "isEqualToString:", v31);

    if ((v33 & 1) == 0)
    {
      PXStoryErrorCreateWithCodeDebugFormat(1, CFSTR("unknown catalog %@ for recipe song: %@"), v34, v35, v36, v37, v38, v39, (uint64_t)v24);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      goto LABEL_27;
    }
  }
  v67 = [PXMockAudioAsset alloc];
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __88__PFStoryRecipe_PXStoryExtension_requestAudioAssetFromRecipeAsset_recipe_resultHandler___block_invoke_3;
  v70[3] = &unk_1E511CCE8;
  v71 = v23;
  v68 = v23;
  v42 = -[PXMockAudioAsset initWithConfiguration:](v67, "initWithConfiguration:", v70);

  if (v42)
    ((void (**)(void *, PXMockAudioAsset *, uint64_t, void *))v16)[2](v16, v42, 1, 0);
  v41 = 0;
  v40 = 0;
LABEL_15:
  v43 = v41;

  return v43;
}

+ (id)recipeAssetFromAudioAsset:(id)a3 withCategory:(int64_t)a4 subcategory:(int64_t)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  id *v37;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0D752D0];
    v36 = *MEMORY[0x1E0D759E8];
    v11 = v9;
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorGradeCategory");
    v15 = v9;
    v16 = a6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", a4, a5, v36, v12, v13, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    a6 = v16;
    v9 = v15;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = a6;
      v19 = (void *)MEMORY[0x1E0D752D0];
      v20 = (uint64_t *)MEMORY[0x1E0D759F0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PXStoryErrorCreateWithCodeDebugFormat(3, CFSTR("cannot create a recipe song asset from audio asset: %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v9);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        if (!a6)
          goto LABEL_10;
        goto LABEL_9;
      }
      v37 = a6;
      v19 = (void *)MEMORY[0x1E0D752D0];
      v20 = (uint64_t *)MEMORY[0x1E0D759F8];
    }
    v27 = *v20;
    v28 = v9;
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subtitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorGradeCategory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v19;
    a6 = v37;
    objc_msgSend(v33, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", a4, a5, v27, v29, v30, v31, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v34 = 0;
  if (a6)
LABEL_9:
    *a6 = objc_retainAutorelease(v34);
LABEL_10:

  return v18;
}

+ (BOOL)_recipe:(id)a3 isReferencingPHPhotoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "libraryWithKind:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v5;
}

+ (BOOL)_recipe:(id)a3 setPHPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _PXStoryRecipePhotoKitLibraryReference *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(a1, "_recipe:isReferencingPHPhotoLibrary:", v8, v9) & 1) != 0)
  {
    v10 = 0;
    v11 = 1;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v8, "libraryWithKind:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12 == 0;
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2938];
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibraryURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("Recipe referencing PhotoKit library %@ and cannot be changed to %@"), v15, v16);
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = -[_PXStoryRecipePhotoKitLibraryReference initWithPhotoLibrary:]([_PXStoryRecipePhotoKitLibraryReference alloc], "initWithPhotoLibrary:", v9);
    objc_msgSend(v8, "addLibrary:", v19);

    v10 = 0;
  }

  if (a5)
LABEL_8:
    *a5 = objc_retainAutorelease(v10);
LABEL_9:

  return v11;
}

+ (id)recipe:(id)a3 withPHPhotoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v15;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "_recipe:isReferencingPHPhotoLibrary:", v8, v9))
  {
    v10 = v8;
    v11 = 0;
    if (!a5)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = (void *)objc_msgSend(v8, "mutableCopyWithZone:", 0);
  v15 = 0;
  v13 = objc_msgSend(a1, "_recipe:setPHPhotoLibrary:error:", v12, v9, &v15);
  v11 = v15;
  v10 = 0;
  if (v13)
    v10 = (id)objc_msgSend(v12, "copyWithZone:", 0);

  if (a5)
LABEL_7:
    *a5 = objc_retainAutorelease(v11);
LABEL_8:

  return v10;
}

+ (id)PHPhotoLibraryForRecipe:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "libraryWithKind:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CD16F8]);
    objc_msgSend(v3, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithPhotoLibraryURL:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (NSString)schemeForPHAssets
{
  return (NSString *)CFSTR("photokit");
}

+ (BOOL)addPHAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id *v14;
  int v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  int64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  int64_t v31;
  id obj;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v10 = a3;
  v11 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__69870;
  v37 = __Block_byref_object_dispose__69871;
  v38 = 0;
  v12 = objc_msgSend(v10, "count");
  if (!v12)
  {
    v23 = 1;
    if (!a6)
      goto LABEL_12;
    goto LABEL_11;
  }
  v25 = a5;
  objc_msgSend(v10, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)(v34 + 5);
  obj = (id)v34[5];
  v15 = objc_msgSend(a1, "_recipe:setPHPhotoLibrary:error:", v11, v13, &obj);
  objc_storeStrong(v14, obj);
  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    if (v12 >= 1)
    {
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v19);

      }
    }
    objc_msgSend(a1, "schemeForPHAssets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudIdentifierMappingsForLocalIdentifiers:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __84__PFStoryRecipe_PXStoryExtension_PhotoKit__addPHAssets_toRecipe_withCategory_error___block_invoke;
    v27[3] = &unk_1E5120AD8;
    v31 = v25;
    v22 = v20;
    v28 = v22;
    v29 = v11;
    v30 = &v33;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v27);
    v23 = v34[5] == 0;

  }
  else
  {
    v23 = 0;
  }

  if (a6)
LABEL_11:
    *a6 = objc_retainAutorelease((id)v34[5]);
LABEL_12:
  _Block_object_dispose(&v33, 8);

  return v23;
}

+ (id)PHAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *, _BYTE *);
  void *v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__69870;
  v40 = __Block_byref_object_dispose__69871;
  v41 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "schemeForPHAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke;
  v31[3] = &unk_1E51298C0;
  v12 = v10;
  v32 = v12;
  v35 = a4;
  v13 = v9;
  v33 = v13;
  v34 = &v36;
  objc_msgSend(v8, "enumerateAssetsWithKind:usingBlock:", 1, v31);
  if (v37[5] || !objc_msgSend(v13, "count"))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(a1, "PHPhotoLibraryForRecipe:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "localIdentifierMappingsForCloudIdentifiers:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v11;
      v26 = 3221225472;
      v27 = __80__PFStoryRecipe_PXStoryExtension_PhotoKit__PHAssetsInRecipe_withCategory_error___block_invoke_2;
      v28 = &unk_1E5120B00;
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v29 = v18;
      v30 = &v36;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &v25);
      if (v37[5])
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v16, "librarySpecificFetchOptions", v25, v26, v27, v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CD1390];
        v23 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(v22, "fetchAssetsWithLocalIdentifiers:options:", v23, v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v42 = *MEMORY[0x1E0CB2938];
      v43[0] = CFSTR("Recipe doesn't refer to a PhotoKit library");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PXStoryErrorDomain"), 1, v17);
      v20 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v18 = (id)v37[5];
      v37[5] = v20;
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v37[5]);

  _Block_object_dispose(&v36, 8);
  return v14;
}

+ (void)enumerateDisplayAssetsFromRecipe:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PXStoryRecipeEnumerator *v9;
  void *v10;
  _PXStoryRecipeEnumerator *v11;
  _PXStoryRecipeEnumerator *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, _BYTE *);
  void *v16;
  _PXStoryRecipeEnumerator *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "PHPhotoLibraryForRecipe:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [_PXStoryRecipeEnumerator alloc];
    objc_msgSend(a1, "schemeForPHAssets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_PXStoryRecipeEnumerator initWithBatchSize:photoLibrary:scheme:block:](v9, "initWithBatchSize:photoLibrary:scheme:block:", 200, v8, v10, v7);

    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __88__PFStoryRecipe_PXStoryExtension_PhotoKit__enumerateDisplayAssetsFromRecipe_usingBlock___block_invoke;
    v16 = &unk_1E5120B28;
    v18 = &v19;
    v12 = v11;
    v17 = v12;
    objc_msgSend(v6, "enumerateAssetsWithKind:usingBlock:", 1, &v13);
    if (*((_BYTE *)v20 + 24))
      -[_PXStoryRecipeEnumerator didFinishEnumeratingRecipeDisplayAssets](v12, "didFinishEnumeratingRecipeDisplayAssets", v13, v14, v15, v16);

    _Block_object_dispose(&v19, 8);
  }

}

+ (NSString)schemeForSyntheticAssets
{
  return (NSString *)CFSTR("synthetic");
}

+ (BOOL)addSyntheticAssets:(id)a3 toRecipe:(id)a4 withCategory:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v25 = a1;
  objc_msgSend(a1, "schemeForSyntheticAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  if (v12 >= 1)
  {
    v13 = v12;
    v14 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "px_descriptionForAssertionMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PFStoryRecipe+PXStory+Synthetic.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("syntheticAssets[index]"), v21, v24);

        goto LABEL_9;
      }
LABEL_5:
      v16 = (void *)MEMORY[0x1E0D752B8];
      objc_msgSend(v15, "serializableDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createAssetWithCategory:scheme:cloudIdentifier:", a5, v11, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAsset:", v18);

      if (v13 == ++v14)
        goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("PFStoryRecipe+PXStory+Synthetic.m"), 27, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("syntheticAssets[index]"), v21);
LABEL_9:

    goto LABEL_5;
  }
LABEL_10:

  return 1;
}

+ (id)syntheticAssetsInRecipe:(id)a3 withCategory:(int64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__120891;
  v27 = __Block_byref_object_dispose__120892;
  v28 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "schemeForSyntheticAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __88__PFStoryRecipe_PXStoryExtension_Synthetic__syntheticAssetsInRecipe_withCategory_error___block_invoke;
  v18 = &unk_1E51298C0;
  v11 = v10;
  v19 = v11;
  v22 = a4;
  v12 = v9;
  v20 = v12;
  v21 = &v23;
  objc_msgSend(v8, "enumerateAssetsWithKind:usingBlock:", 1, &v15);
  if (!v24[5] && objc_msgSend(v12, "count", v15, v16, v17, v18, v19))
  {
    PXDisplayAssetFetchResultFromArray();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0;
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease((id)v24[5]);
LABEL_4:

  _Block_object_dispose(&v23, 8);
  return v13;
}

@end
