@implementation PXPhotoKitAssetCollectionPlayMovieActionPerformer

- (id)activitySystemImageName
{
  return +[PXPhotoKitAssetCollectionPlayMovieActionPerformer _systemImageName](PXPhotoKitAssetCollectionPlayMovieActionPerformer, "_systemImageName");
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypePlayMemoryMovie");
  return CFSTR("PXActivityTypePlayMemoryMovie");
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  void *v6;
  void *v7;
  void *v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetCollectionPlayMovieActionPerformer activityType](self, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activity.activityType == self.activityType"));

  }
  return 1;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitleForUseCase:assetCollectionReference:withInputs:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint8_t buf[8];
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  PXPhotoKitAssetCollectionPlayMovieActionPerformer *v42;
  id v43;
  uint64_t v44;
  _QWORD aBlock[4];
  id v46;
  PXPhotoKitAssetCollectionPlayMovieActionPerformer *v47;

  -[PXActionPerformer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke;
    aBlock[3] = &unk_1E5115C08;
    v46 = v4;
    v47 = self;
    v6 = _Block_copy(aBlock);
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v29, v31);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v29);
    }

LABEL_4:
    if (objc_msgSend(v7, "px_highlightKind") != 2)
    {
      if (objc_msgSend(v7, "assetCollectionType") == 1 && objc_msgSend(v7, "assetCollectionSubtype") == 2)
      {
        -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "titleCategory");

        if (v18)
          v19 = v18;
        else
          v19 = 6;
        objc_msgSend(off_1E50B3470, "defaultHelper");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "titleForDisplayableText:titleCategory:options:", v21, v19, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "localizedSubtitle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (performUserInteractionTask_onceToken != -1)
          dispatch_once(&performUserInteractionTask_onceToken, &__block_literal_global_1236);
        v24 = performUserInteractionTask_preferredTitlesQueue;
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_4;
        block[3] = &unk_1E513AC50;
        v44 = v19;
        v39 = v22;
        v40 = v23;
        v41 = v7;
        v42 = self;
        v43 = v6;
        v25 = v23;
        v26 = v22;
        dispatch_async(v24, block);

      }
      else
      {
        (*((void (**)(void *, void *))v6 + 2))(v6, v7);
      }
      goto LABEL_20;
    }
    v8 = v7;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAllAssetsInYearRepresentedByYearHighlight:options:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CD13B8];
        objc_msgSend(v8, "localizedTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "transientAssetCollectionWithAssetFetchResult:title:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(void *, void *))v6 + 2))(v6, v14);
LABEL_20:

        v16 = v46;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v34, v36);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 132, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v34);
    }

    goto LABEL_7;
  }
  PXAssertGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Unable to perform user interaction task.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to play movie from action performer."));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v16);
LABEL_21:

}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  px_dispatch_on_main_queue();

}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v2 = *MEMORY[0x1E0CD1CD0];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CD1CD0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CD1CC8];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CD1CC8]);

  v5 = *MEMORY[0x1E0CD1CC0];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CD1CC0]);
  objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromAssetCollection:proposedAttributes:", *(_QWORD *)(a1 + 48), v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(id *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v2);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
    v7 = (id)v10;
  }
  objc_msgSend(MEMORY[0x1E0CD13B8], "titleFontNameForTitleCategory:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(*(id *)(a1 + 56), "assetCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchAssetsInAssetCollection:options:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:type:subtype:title:subtitle:titleFontName:", v16, objc_msgSend(*(id *)(a1 + 48), "assetCollectionType"), objc_msgSend(*(id *)(a1 + 48), "assetCollectionSubtype"), v7, v9, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_3()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.photos.PXPhotoKitAssetCollectionPlayMovieActionPerformer.preferredTitlesQueue", v0);
  v2 = (void *)performUserInteractionTask_preferredTitlesQueue;
  performUserInteractionTask_preferredTitlesQueue = (uint64_t)v1;

}

uint64_t __79__PXPhotoKitAssetCollectionPlayMovieActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionActionPerformer:playMovieForAssetCollection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;

  v7 = a4;
  objc_msgSend(a3, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 25, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v23, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 25, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v23);
  }

LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "performerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (unint64_t)objc_msgSend(v9, "abilityToPlayMovieForAssetCollection:", v8) < 2
    || objc_msgSend(v8, "assetCollectionType") == 7
    || objc_msgSend(v8, "assetCollectionType") == 9
    || objc_msgSend(v8, "assetCollectionType") == 2
    || (objc_msgSend(v8, "px_isSharedLibrarySharingSuggestion") & 1) != 0
    || (objc_msgSend(v8, "px_isSharedLibrarySharingSuggestionsSmartAlbum") & 1) != 0
    || objc_msgSend(v8, "assetCollectionSubtype") == 101)
  {
    v10 = 0;
    goto LABEL_15;
  }
  +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "minimumNumberOfCuratedAssetsForMovieHeader");

  v14 = objc_msgSend(v8, "estimatedAssetCount");
  if (objc_msgSend(v8, "assetCollectionType") == 6)
  {
    v15 = v8;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_19:
        v14 = objc_msgSend(v15, "summaryCount");
        if (objc_msgSend(v15, "kind") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v15, "objectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "predicateWithFormat:", CFSTR("highlightBeingSummaryAssets.parentPhotosHighlight.parentPhotosHighlight = %@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setInternalPredicate:", v19);

          objc_msgSend(v16, "setShouldPrefetchCount:", 1);
          objc_msgSend(v16, "setFetchLimit:", v13);
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v20, "count");

        }
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "px_descriptionForAssertionMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 54, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v28, v30);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v26;
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 54, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v28);
    }

    goto LABEL_19;
  }
LABEL_22:
  v10 = objc_msgSend(v8, "assetCollectionType") == 4
     || +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryPlayback:", v14);
LABEL_15:

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v7;
  __CFString *v8;
  void *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  objc_msgSend(a4, "assetCollection", a3);
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v13, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionPlayMovieActionPerformer.m"), 80, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v13);
  }

LABEL_3:
  if (objc_msgSend(v7, "assetCollectionType") == 4)
    v8 = CFSTR("PXPhotosDetailsActionMenuPlayMovieTitle");
  else
    v8 = CFSTR("PXPhotosDetailsActionMenuPlayMemoryMovieTitle");
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_systemImageName
{
  return CFSTR("memories");
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return +[PXPhotoKitAssetCollectionPlayMovieActionPerformer _systemImageName](PXPhotoKitAssetCollectionPlayMovieActionPerformer, "_systemImageName", a3, a4);
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypePlayMemoryMovie"), a5);
}

+ (BOOL)shouldDisplayTitleOfAssetCollection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((unint64_t)(objc_msgSend(v3, "assetCollectionType") - 1) > 1
    || (objc_msgSend(v3, "px_isAllPhotosSmartAlbum") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "px_isRecentsSmartAlbum") ^ 1;
  }

  return v4;
}

@end
