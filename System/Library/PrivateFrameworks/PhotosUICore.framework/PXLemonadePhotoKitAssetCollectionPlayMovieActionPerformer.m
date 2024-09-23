@implementation PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v6 = a3;
  objc_msgSend(v6, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m"), 25, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v13, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m"), 25, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v13);
  }

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "canPerformReasoningOnAssetCollectionReference:", v6);
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    objc_msgSend(a1, "reasoningStructDescriptionFor:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer is unable to perform. Reasoning: %@"), v9);

    v8 = 0;
  }

  return v8;
}

+ ($4C472092DE67A143DAA215F616F8A186)canPerformReasoningOnAssetCollectionReference:(SEL)a3
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  $4C472092DE67A143DAA215F616F8A186 *result;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  id v16;

  objc_msgSend(a4, "assetCollection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a3, a2, CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var1 = objc_msgSend(v16, "estimatedAssetCount");
  retstr->var2 = objc_msgSend(v16, "px_estimatedCuratedAssetsCount");
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var3 = objc_msgSend(v7, "minimumNumberOfAssetsForPlaybackAsMemory");

  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v8 = objc_claimAutoreleasedReturnValue();
  retstr->var4 = objc_msgSend((id)v8, "maximumNumberOfAssetsForPlaybackAsMemory");

  LOBYTE(v8) = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryLensPlayback:", objc_msgSend(v16, "px_estimatedCuratedAssetsCount"));
  retstr->var5 = v8;
  v9 = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryLensPlayback:", objc_msgSend(v16, "estimatedAssetCount"));
  retstr->var6 = v9;
  retstr->var7 = v9 | v8;

  return result;
}

+ (BOOL)canPerformOnPHPerson:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1390];
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsForPersons:options:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryLensPlayback:", v8);
  if (!v9)
    NSLog(CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer is unable to perform playback on person. Asset count: %lu"), v8);
  return v9;
}

+ (id)reasoningStructDescriptionFor:(id *)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("YES");
  v4 = CFSTR("NO");
  if (a3->var5)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (a3->var6)
    v4 = CFSTR("YES");
  if (!a3->var7)
    v3 = CFSTR("NO'");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformerCanPerformReasoning {\ndecisioningVersion: %llu\n\nestimatedAssetCollectionSize: %llu,\n\npx_estimatedCuratedAssetCollectionSize: %llu,\n\nmemoryMinimumAssetCountPreset: %llu,\n\nmemoryMaximumAssetCountPreset: %llu,\n\nisAssetCountAcceptableForMemoryLensPlayback_px_estimatedCureatedAssetCountResult: %@,\nisAssetCountAcceptableForMemoryLensPlayback_estimatedAssetCountResult: %@,\n\nfinalCanPerformResult: %@\n}"), *(_OWORD *)&a3->var0, *(_OWORD *)&a3->var2, a3->var4, v5, v4, v3);
}

@end
