@implementation PUActivityItemSourceController

- (PUActivityItemSourceController)init
{
  PUActivityItemSourceController *v2;
  PUCMMActivityItemSource *v3;
  PUCMMActivityItemSource *cmmActivityItemSource;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *externalIsolation;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUActivityItemSourceController;
  v2 = -[PUActivityItemSourceController init](&v10, sel_init);
  if (v2)
  {
    v3 = -[PUCMMActivityItemSource initWithActivityItemSourceController:]([PUCMMActivityItemSource alloc], "initWithActivityItemSourceController:", v2);
    cmmActivityItemSource = v2->_cmmActivityItemSource;
    v2->_cmmActivityItemSource = v3;

    -[PUCMMActivityItemSource setDelegate:](v2->_cmmActivityItemSource, "setDelegate:", v2);
    -[PUCMMActivityItemSource registerChangeObserver:context:](v2->_cmmActivityItemSource, "registerChangeObserver:context:", v2, PUActivityItemSourceControllerCMMSourceObserverContext);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.PUActivityItemSourceController.isolationQueue", v5);
    externalIsolation = v2->_externalIsolation;
    v2->_externalIsolation = (OS_dispatch_queue *)v6;

    v2->_cloudSharedAssetCount = 0;
    v2->_momentShareAssetCount = 0;
    v2->_unsavedSyndicatedAssetCount = 0;
    v2->_externalLibraryAssetCount = 0;
    objc_msgSend(MEMORY[0x1E0D7B858], "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_powerAssertionIdentifier = objc_msgSend(v8, "generateAssertionIdentifier");

  }
  return v2;
}

- (NSOrderedSet)assetItemSources
{
  return (NSOrderedSet *)self->_assetItemSources;
}

- (NSArray)activityItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[PUActivityItemSourceController preferredPreparationType](self, "preferredPreparationType") == 1)
  {
    -[PUActivityItemSourceController cmmActivityItemSource](self, "cmmActivityItemSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUActivityItemSourceController assetItemSources](self, "assetItemSources");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  return (NSArray *)v4;
}

- (void)setAssetItems:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  __int128 v9;
  __CFDictionary *v10;
  NSMutableOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableOrderedSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSMutableOrderedSet *v21;
  NSMutableOrderedSet *assetItems;
  NSMutableOrderedSet *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *p_cloudSharedAssetCount;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  PUActivityItemSource *v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSMutableOrderedSet *v48;
  NSMutableOrderedSet *obj;
  void *v50;
  _QWORD block[4];
  NSObject *v52;
  os_signpost_id_t v53;
  _QWORD v54[4];
  NSObject *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CFDictionaryKeyCallBacks keyCallBacks;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[136];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_assetItems;
  v6 = (NSMutableOrderedSet *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    v8 = -[NSMutableOrderedSet count](v5, "count");
    if (v8 == -[NSMutableOrderedSet count](v7, "count"))
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 16);
      *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9AEB8];
      *(_OWORD *)&keyCallBacks.release = v9;
      *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E0C9AEB8] + 32);
      keyCallBacks.retain = 0;
      keyCallBacks.release = 0;
      v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, 0);
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v11 = v5;
      v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v65 != v14)
              objc_enumerationMutation(v11);
            CFDictionarySetValue(v10, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "localIdentifier"), 0);
          }
          v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
        }
        while (v13);
      }

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v16 = v7;
      v17 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v61;
        while (2)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v61 != v19)
              objc_enumerationMutation(v16);
            if (!CFDictionaryContainsKey(v10, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "localIdentifier")))
            {

              CFRelease(v10);
              goto LABEL_22;
            }
          }
          v18 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          if (v18)
            continue;
          break;
        }
      }

      CFRelease(v10);
    }
    else
    {

LABEL_22:
      v21 = (NSMutableOrderedSet *)-[NSMutableOrderedSet mutableCopy](v7, "mutableCopy");
      assetItems = self->_assetItems;
      self->_assetItems = v21;

      v23 = self->_assetItems;
      if (v23)
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", -[NSMutableOrderedSet count](self->_assetItems, "count"));
      else
        v24 = 0;
      objc_storeStrong((id *)&self->_assetItemSources, v24);
      if (v23)

      self->_cloudSharedAssetCount = 0;
      self->_momentShareAssetCount = 0;
      v48 = v7;
      self->_unsavedSyndicatedAssetCount = 0;
      self->_externalLibraryAssetCount = 0;
      -[PUActivityItemSourceController appPhotoLibrary](self, "appPhotoLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "photoLibraryURL");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      PLShareSheetGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_generate(v26);
      v28 = v26;
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "SharingVariantsDuration", ", buf, 2u);
      }
      v46 = v29;
      v47 = v27;

      v30 = dispatch_group_create();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = self->_assetItems;
      v31 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v57 != v33)
              objc_enumerationMutation(obj);
            v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
            objc_msgSend(v35, "asset", v46, v47);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "sourceType");
            p_cloudSharedAssetCount = &self->_cloudSharedAssetCount;
            if (v37 == 2
              || (v39 = objc_msgSend(v36, "sourceType"),
                  p_cloudSharedAssetCount = &self->_momentShareAssetCount,
                  v39 == 8))
            {
              ++*p_cloudSharedAssetCount;
            }
            if (objc_msgSend(v36, "px_isUnsavedSyndicatedAsset"))
              ++self->_unsavedSyndicatedAssetCount;
            objc_msgSend(v36, "photoLibrary");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "photoLibraryURL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v41, "isEqual:", v50) & 1) == 0)
              ++self->_externalLibraryAssetCount;
            v42 = -[PUActivityItemSourceController synthesizedSharingPreferencesForAssetItem:](self, "synthesizedSharingPreferencesForAssetItem:", v35);
            v44 = -[PUActivityItemSource initWithAsset:sharingPreferences:]([PUActivityItemSource alloc], "initWithAsset:sharingPreferences:", v36, v42, v43);
            dispatch_group_enter(v30);
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __48__PUActivityItemSourceController_setAssetItems___block_invoke;
            v54[3] = &unk_1E58ABD10;
            v55 = v30;
            -[PUActivityItemSource setPpt_didFetchSharingVariantsHandler:](v44, "setPpt_didFetchSharingVariantsHandler:", v54);
            -[NSMutableOrderedSet addObject:](self->_assetItemSources, "addObject:", v44);

          }
          v32 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v32);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PUActivityItemSourceController_setAssetItems___block_invoke_2;
      block[3] = &unk_1E58AACF0;
      v52 = v46;
      v53 = v47;
      v45 = v46;
      dispatch_group_notify(v30, MEMORY[0x1E0C80D38], block);

      v7 = v48;
    }
  }

}

- (PHPhotoLibrary)appPhotoLibrary
{
  return (PHPhotoLibrary *)objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
}

- (BOOL)itemSourcesSupportMomentShareLinkCreation
{
  return self->_momentShareAssetCount + self->_cloudSharedAssetCount + self->_externalLibraryAssetCount == 0;
}

- (BOOL)itemSourcesSupportSlideshow
{
  return self->_momentShareAssetCount == 0;
}

- (void)setShouldExcludeLivenessInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeLivenessInAllItemSources != a3)
  {
    self->_shouldExcludeLivenessInAllItemSources = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setShouldExcludeLocationInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeLocationInAllItemSources != a3)
  {
    self->_shouldExcludeLocationInAllItemSources = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setShouldExcludeCaptionInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeCaptionInAllItemSources != a3)
  {
    self->_shouldExcludeCaptionInAllItemSources = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setShouldExcludeAccessibilityDescriptionInAllItemSources:(BOOL)a3
{
  if (self->_shouldExcludeAccessibilityDescriptionInAllItemSources != a3)
  {
    self->_shouldExcludeAccessibilityDescriptionInAllItemSources = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setShouldShareAsAssetBundles:(BOOL)a3
{
  if (self->_shouldShareAsAssetBundles != a3)
  {
    self->_shouldShareAsAssetBundles = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setShouldShareAsUnmodifiedOriginals:(BOOL)a3
{
  if (self->_shouldShareAsUnmodifiedOriginals != a3)
  {
    self->_shouldShareAsUnmodifiedOriginals = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)setPreferredExportFormat:(int64_t)a3
{
  if (self->_preferredExportFormat != a3)
  {
    self->_preferredExportFormat = a3;
    -[PUActivityItemSourceController updateSharingPreferencesInItemSources](self, "updateSharingPreferencesInItemSources");
  }
}

- (void)updateSharingPreferencesInItemSources
{
  NSMutableOrderedSet *assetItems;
  _QWORD v3[5];

  assetItems = self->_assetItems;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke;
  v3[3] = &unk_1E589B3B8;
  v3[4] = self;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](assetItems, "enumerateObjectsUsingBlock:", v3);
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)synthesizedSharingPreferencesForAssetItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  int64_t v16;
  $9D9B13A340AA60ED2DD68408BD7D962F result;

  v4 = a3;
  if ((objc_msgSend(v4, "excludeLiveness") & 1) != 0)
    v5 = 1;
  else
    v5 = -[PUActivityItemSourceController shouldExcludeLivenessInAllItemSources](self, "shouldExcludeLivenessInAllItemSources");
  if ((objc_msgSend(v4, "excludeLocation") & 1) != 0)
  {
    v6 = 256;
  }
  else if (-[PUActivityItemSourceController shouldExcludeLocationInAllItemSources](self, "shouldExcludeLocationInAllItemSources"))
  {
    v6 = 256;
  }
  else
  {
    v6 = 0;
  }
  if ((objc_msgSend(v4, "excludeCaption") & 1) != 0)
  {
    v7 = 0x10000;
  }
  else if (-[PUActivityItemSourceController shouldExcludeCaptionInAllItemSources](self, "shouldExcludeCaptionInAllItemSources"))
  {
    v7 = 0x10000;
  }
  else
  {
    v7 = 0;
  }
  if ((objc_msgSend(v4, "excludeAccessibilityDescription") & 1) != 0)
  {
    v8 = 0x1000000;
  }
  else if (-[PUActivityItemSourceController shouldExcludeAccessibilityDescriptionInAllItemSources](self, "shouldExcludeAccessibilityDescriptionInAllItemSources"))
  {
    v8 = 0x1000000;
  }
  else
  {
    v8 = 0;
  }
  v9 = -[PUActivityItemSourceController shouldShareAsAssetBundles](self, "shouldShareAsAssetBundles");
  v10 = -[PUActivityItemSourceController shouldShareAsUnmodifiedOriginals](self, "shouldShareAsUnmodifiedOriginals");
  v11 = -[PUActivityItemSourceController preferredExportFormat](self, "preferredExportFormat");
  v12 = 0x10000000000;
  if (!v10)
    v12 = 0;
  v13 = 0x100000000;
  if (!v9)
    v13 = 0;
  v14 = v6 | v5 | v7 | v8 | v13 | v12;

  v15 = v14;
  v16 = v11;
  result.var6 = v16;
  result.var0 = v15;
  result.var1 = BYTE1(v15);
  result.var2 = BYTE2(v15);
  result.var3 = BYTE3(v15);
  result.var4 = BYTE4(v15);
  result.var5 = BYTE5(v15);
  return result;
}

- (void)addAssetItem:(id)a3
{
  id v5;
  NSMutableOrderedSet *assetItems;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PUActivityItemSource *v17;
  void *v18;
  id v19;

  v5 = a3;
  v19 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetItem"));

    v5 = 0;
  }
  if ((-[NSMutableOrderedSet containsObject:](self->_assetItems, "containsObject:", v5) & 1) == 0)
  {
    assetItems = self->_assetItems;
    if (!assetItems)
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      v8 = self->_assetItems;
      self->_assetItems = v7;

      assetItems = self->_assetItems;
    }
    -[NSMutableOrderedSet addObject:](assetItems, "addObject:", v19);
    objc_msgSend(v19, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "sourceType") == 2)
    {
      v10 = &OBJC_IVAR___PUActivityItemSourceController__cloudSharedAssetCount;
    }
    else
    {
      if (objc_msgSend(v9, "sourceType") != 8)
      {
LABEL_11:
        if (objc_msgSend(v9, "px_isUnsavedSyndicatedAsset"))
          ++self->_unsavedSyndicatedAssetCount;
        -[PUActivityItemSourceController appPhotoLibrary](self, "appPhotoLibrary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "photoLibraryURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "photoLibraryURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v14, "isEqual:", v12) & 1) == 0)
          ++self->_externalLibraryAssetCount;
        v15 = -[PUActivityItemSourceController synthesizedSharingPreferencesForAssetItem:](self, "synthesizedSharingPreferencesForAssetItem:", v19);
        v17 = -[PUActivityItemSource initWithAsset:sharingPreferences:]([PUActivityItemSource alloc], "initWithAsset:sharingPreferences:", v9, v15, v16);
        -[NSMutableOrderedSet addObject:](self->_assetItemSources, "addObject:", v17);

        goto LABEL_16;
      }
      v10 = &OBJC_IVAR___PUActivityItemSourceController__momentShareAssetCount;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v10);
    goto LABEL_11;
  }
LABEL_16:

}

- (void)removeAssetItem:(id)a3
{
  int v5;
  void *v6;
  void *v7;
  _QWORD *p_cloudSharedAssetCount;
  unint64_t cloudSharedAssetCount;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableOrderedSet *assetItemSources;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v5 = -[NSMutableOrderedSet containsObject:](self->_assetItems, "containsObject:", v17);
  v6 = v17;
  if (!v5)
    goto LABEL_13;
  -[NSMutableOrderedSet removeObject:](self->_assetItems, "removeObject:", v17);
  objc_msgSend(v17, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "sourceType") == 2)
  {
    p_cloudSharedAssetCount = &self->_cloudSharedAssetCount;
    cloudSharedAssetCount = self->_cloudSharedAssetCount;
LABEL_5:
    *p_cloudSharedAssetCount = cloudSharedAssetCount - 1;
    goto LABEL_6;
  }
  cloudSharedAssetCount = objc_msgSend(v7, "sourceType");
  p_cloudSharedAssetCount = &self->_momentShareAssetCount;
  if (cloudSharedAssetCount == self->_momentShareAssetCount)
    goto LABEL_5;
LABEL_6:
  if (objc_msgSend(v7, "px_isUnsavedSyndicatedAsset"))
    --self->_unsavedSyndicatedAssetCount;
  -[PUActivityItemSourceController appPhotoLibrary](self, "appPhotoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqual:", v11) & 1) == 0)
    --self->_externalLibraryAssetCount;
  assetItemSources = self->_assetItemSources;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__PUActivityItemSourceController_removeAssetItem___block_invoke;
  v18[3] = &unk_1E589B3E0;
  v19 = v17;
  v15 = -[NSMutableOrderedSet indexOfObjectPassingTest:](assetItemSources, "indexOfObjectPassingTest:", v18);
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("idx != NSNotFound"));

  }
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_assetItemSources, "removeObjectAtIndex:", v15);

  v6 = v17;
LABEL_13:

}

- (NSArray)activeItemSources
{
  PUActivityItemSourceController *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeItemSources;
  objc_sync_exit(v2);

  return v3;
}

- (void)setActiveItemSources:(id)a3
{
  NSArray *v4;
  PUActivityItemSourceController *v5;
  NSArray *activeItemSources;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = self;
  objc_sync_enter(v5);
  activeItemSources = v5->_activeItemSources;
  if (activeItemSources != v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = activeItemSources;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10++), "unregisterChangeObserver:context:", v5, &PUActivityItemSourceControllerItemSourceObserverContext);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v11 = -[NSArray copy](v4, "copy");
    v12 = v5->_activeItemSources;
    v5->_activeItemSources = (NSArray *)v11;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = v5->_activeItemSources;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "registerChangeObserver:context:", v5, &PUActivityItemSourceControllerItemSourceObserverContext, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
  objc_sync_exit(v5);

}

- (void)setState:(unint64_t)a3
{
  NSObject *externalIsolation;
  _QWORD v4[6];

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PUActivityItemSourceController_setState___block_invoke;
  v4[3] = &unk_1E58AACF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(externalIsolation, v4);
}

- (void)updateState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PUActivityItemSourceController cmmActivityItemSource](self, "cmmActivityItemSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4)
  {
    if (v4 == 2)
      v5 = 2;
    else
      v5 = v4 == 1;
  }
  else
  {
    -[PUActivityItemSourceController activeItemSources](self, "activeItemSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "state") == 1)
            ++v11;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    if (v7)
    {
      if (v11)
        v5 = 1;
      else
        v5 = 2;
      if (v7 != 1 && -[PUActivityItemSourceController state](self, "state") == 1)
        v5 = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__PUActivityItemSourceController_updateState__block_invoke;
  v14[3] = &__block_descriptor_40_e49_v16__0___PUMutableActivityItemSourceController__8l;
  v14[4] = v5;
  -[PUActivityItemSourceController performChanges:](self, "performChanges:", v14);
}

- (NSOrderedSet)assets
{
  return (NSOrderedSet *)-[NSMutableOrderedSet valueForKey:](self->_assetItems, "valueForKey:", CFSTR("asset"));
}

- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount
{
  NSMutableOrderedSet *assetItems;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  PXAssetMediaTypeCount *result;
  _QWORD v14[13];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  assetItems = self->_assetItems;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PUActivityItemSourceController_requestAssetsMediaTypeCount__block_invoke;
  v14[3] = &unk_1E589B428;
  v14[4] = &v27;
  v14[5] = &v23;
  v14[6] = &v19;
  v14[7] = &v15;
  v14[8] = &v47;
  v14[9] = &v43;
  v14[10] = &v39;
  v14[11] = &v35;
  v14[12] = &v31;
  -[NSMutableOrderedSet enumerateObjectsUsingBlock:](assetItems, "enumerateObjectsUsingBlock:", v14);
  v5 = v44[3];
  v6 = v40[3];
  v7 = v36[3];
  v8 = v32[3];
  v9 = v28[3];
  v10 = v24[3];
  v11 = v20[3];
  v12 = v16[3];
  retstr->var0 = v48[3];
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  retstr->var4 = v8;
  retstr->var5 = v9;
  retstr->var6 = v10;
  retstr->var7 = v11;
  retstr->var8 = v12;
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return result;
}

- (BOOL)isPreparingIndividualItems
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;

  v3 = -[PUActivityItemSourceController preferredPreparationType](self, "preferredPreparationType");
  -[PUActivityItemSourceController assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3)
    v6 = 1;
  else
    v6 = v5 == 0;
  return !v6;
}

- (unint64_t)unsavedSyndicatedAssetCount
{
  return self->_unsavedSyndicatedAssetCount;
}

- (void)configureItemSourcesForActivityIfNeeded:(id)a3 forcePreparationAsMomentShareLink:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  _BYTE v13[24];
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[PUActivityItemSourceController preferredPreparationType](self, "preferredPreparationType"))
  {
    -[PUActivityItemSourceController assetItemSources](self, "assetItemSources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 138413058;
      *(_QWORD *)&v13[4] = objc_opt_class();
      *(_WORD *)&v13[12] = 2048;
      *(_QWORD *)&v13[14] = self;
      *(_WORD *)&v13[22] = 2048;
      v14 = v8;
      LOWORD(v15) = 2114;
      *(_QWORD *)((char *)&v15 + 2) = v6;
      v10 = *(id *)&v13[4];
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Begin preparing %ld assets for activity: %{public}@", v13, 0x2Au);

    }
    objc_msgSend(v6, "activityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[PUActivityItemSourceConfiguration isIndividualItemPreparationSupportedByActivityType:](PUActivityItemSourceConfiguration, "isIndividualItemPreparationSupportedByActivityType:", v11);

    if (!v12 || v4)
      -[PUActivityItemSourceController _prepareMomentShareLinkFromIndividualItemSourcesForActivity:](self, "_prepareMomentShareLinkFromIndividualItemSourcesForActivity:", v6, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15);
    else
      -[PUActivityItemSourceController _prepareIndividualItemSourcesForActivity:](self, "_prepareIndividualItemSourcesForActivity:", v6);
  }

}

- (void)_prepareIndividualItemSourcesForActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD aBlock[4];
  NSObject *v22;
  PUActivityItemSourceController *v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLShareSheetGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Performing per-item preparations", buf, 2u);
  }

  -[PUActivityItemSourceController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PUActivityItemSourceController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityItemSourceController:willBeginPreparationWithActivityType:preparationType:", self, v5, 0);

  }
  self->_momentSharePublishAttempted = 0;
  -[PUActivityItemSourceController assetItemSources](self, "assetItemSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke;
    v25[3] = &unk_1E58ABD10;
    v13 = dispatch_semaphore_create(0);
    v26 = v13;
    objc_msgSend(v11, "setPostCompletionHandler:", v25);

  }
  else
  {
    v13 = 0;
  }
  aBlock[0] = v12;
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2;
  aBlock[3] = &unk_1E58AB790;
  v22 = v13;
  v23 = self;
  v24 = v4;
  v14 = v4;
  v15 = v13;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_163;
  v18[3] = &unk_1E589B450;
  v18[4] = self;
  v19 = v5;
  v20 = _Block_copy(aBlock);
  v16 = v20;
  v17 = v5;
  -[PUActivityItemSourceController runExplicitly:withActivityType:completionHandler:](self, "runExplicitly:withActivityType:completionHandler:", 0, v17, v18);

}

- (void)_prepareMomentShareLinkFromIndividualItemSourcesForActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  PUActivityItemSourceController *v22;
  id v23;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLShareSheetGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Preparing moment-share link from individual item sources", buf, 2u);
  }

  -[PUActivityItemSourceController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PUActivityItemSourceController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityItemSourceController:willBeginPreparationWithActivityType:preparationType:", self, v5, 1);

  }
  self->_momentSharePublishAttempted = 1;
  -[PUActivityItemSourceController assetItemSources](self, "assetItemSources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setShouldAnchorPreparation:", 1);
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke;
  aBlock[3] = &unk_1E58AB790;
  v21 = v11;
  v22 = self;
  v23 = v4;
  v13 = v4;
  v14 = v11;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_168;
  v17[3] = &unk_1E589B478;
  v17[4] = self;
  v18 = v5;
  v19 = _Block_copy(aBlock);
  v15 = v19;
  v16 = v5;
  -[PUActivityItemSourceController publishLinkForActivityType:completionHandler:](self, "publishLinkForActivityType:completionHandler:", v16, v17);

}

- (BOOL)_prepareForPerformWithActivityType:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PUActivityItemSourceController *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  PUActivityItemSourceController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUActivityItemSourceController activeItemSources](self, "activeItemSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[PUActivityItemSourceController activeItemSources](self, "activeItemSources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityItemSourceController activeActivityType](self, "activeActivityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("unexpected previous task with activeItemSources=%@, activeActivityType=%@, new activityType %@"), v9, v10, v6);
    v11 = (PUActivityItemSourceController *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUActivityItemSourceController"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PLShareSheetGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "failed running PUActivityItemSourceController=%@ with error=%@", buf, 0x16u);
    }

    PXAssertGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_fault_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v14);

  }
  else
  {
    -[PUActivityItemSourceController _setPublishedURL:](self, "_setPublishedURL:", 0);
    -[PUActivityItemSourceController updateState](self, "updateState");
  }

  return v7 == 0;
}

- (void)_cleanupAfterPerform
{
  -[PUActivityItemSourceController setProgressHandler:](self, "setProgressHandler:", 0);
  -[PUActivityItemSourceController setActiveItemSources:](self, "setActiveItemSources:", 0);
  -[PUActivityItemSourceController setErrors:](self, "setErrors:", 0);
  -[PUActivityItemSourceController setActiveActivityType:](self, "setActiveActivityType:", 0);
}

- (void)cleanUpExportedFiles
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLShareSheetGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController cleaning up exported files", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PUActivityItemSourceController assetItemSources](self, "assetItemSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cleanUpExportedFiles");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)runExplicitly:(BOOL)a3 withActivityType:(id)a4 completionHandler:(id)a5
{
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *queue;
  _BOOL4 v38;
  void *v39;
  id v40;
  void *v41;
  id obj;
  id obja;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  PUActivityItemSourceController *v49;
  _QWORD block[4];
  NSObject *v51;
  PUActivityItemSourceController *v52;
  id v53;
  id v54;
  id v55;
  _BYTE *v56;
  uint64_t v57;
  unsigned int v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  PUActivityItemSourceController *v65;
  id v66;
  NSObject *v67;
  _BYTE *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  id v74;
  _QWORD *v75;
  _BYTE *v76;
  SEL v77;
  uint64_t v78;
  unsigned int v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  _BYTE buf[38];
  __int16 v90;
  id v91;
  _QWORD v92[4];

  v38 = a3;
  v92[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v40 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 662, CFSTR("%s must be called on the main thread"), "-[PUActivityItemSourceController runExplicitly:withActivityType:completionHandler:]");

  }
  v85 = 0;
  v49 = self;
  v41 = v8;
  v9 = -[PUActivityItemSourceController _prepareForPerformWithActivityType:error:](self, "_prepareForPerformWithActivityType:error:", v8, &v85);
  v10 = v85;
  v39 = v10;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D7B858], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPowerAssertionForIdentifier:withReason:completion:", -[PUActivityItemSourceController powerAssertionIdentifier](self, "powerAssertionIdentifier"), 8, 0);

    -[NSMutableOrderedSet array](self->_assetItemSources, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v12, "copy");

    PLShareSheetGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v38;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v8;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v14;
      v90 = 2112;
      v91 = obj;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "begin running PUActivityItemSourceController=%@ runExplicitly=%i for activityType=%@ with %lu activeItemSources=%@", buf, 0x30u);
    }

    -[PUActivityItemSourceController setActiveItemSources:](self, "setActiveItemSources:", obj);
    -[PUActivityItemSourceController setActiveActivityType:](self, "setActiveActivityType:", v8);
    v46 = objc_msgSend(obj, "count");
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v46);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v46);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityItemSourceController setErrors:](self, "setErrors:", v15);

    v16 = atomic_load((unsigned int *)&self->_taskId);
    v44 = v16;
    -[PUActivityItemSourceController progressHandler](self, "progressHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      *(_QWORD *)&buf[24] = 0;
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x2020000000;
      v84[3] = 0;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v17 = obj;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v81 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke;
            v73[3] = &unk_1E589B4A0;
            v79 = v44;
            v73[4] = v49;
            v75 = v84;
            v76 = buf;
            v77 = a2;
            v78 = v46;
            v74 = v45;
            objc_msgSend(v21, "setProgressHandler:", v73);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        }
        while (v18);
      }

      _Block_object_dispose(v84, 8);
      _Block_object_dispose(buf, 8);
    }
    v22 = dispatch_group_create();
    dispatch_get_global_queue(0, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    queue = dispatch_queue_create(0, 0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_QWORD *)&buf[24] = 0;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    obja = obj;
    v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
    if (v23)
    {
      v24 = 0;
      v25 = *(_QWORD *)v70;
      v26 = *MEMORY[0x1E0CD18A0];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v70 != v25)
            objc_enumerationMutation(obja);
          v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          objc_msgSend(v28, "setShouldSkipPreparation:", 0);
          dispatch_group_enter(v22);
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_2;
          v63[3] = &unk_1E589B4C8;
          v29 = v47;
          v68 = buf;
          v64 = v29;
          v65 = v49;
          v66 = v48;
          v67 = v22;
          objc_msgSend(v28, "setCompletionHandler:", v63);
          if (v24 <= v26)
          {
            objc_msgSend(v28, "setShouldSendAnalyticsInterval:", 1);
            ++v24;
          }

        }
        v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
      }
      while (v23);
    }

    if (v38)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v30 = obja;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v86, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v60;
        do
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v60 != v32)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "runWithActivityType:", v41);
          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v86, 16);
        }
        while (v31);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_4;
    block[3] = &unk_1E589B4F0;
    v56 = buf;
    v57 = v46;
    v58 = v44;
    v51 = v22;
    v52 = v49;
    v53 = v48;
    v54 = v41;
    v55 = v40;
    v34 = v48;
    v35 = v22;
    dispatch_async(queue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v92[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 1);
    obja = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v40 + 2))(v40, 0, 0, obja);
  }

}

- (void)publishLinkForActivityType:(id)a3 completionHandler:(id)a4
{
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  uint8_t v47[128];
  uint8_t buf[4];
  PUActivityItemSourceController *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 813, CFSTR("%s must be called on the main thread"), "-[PUActivityItemSourceController publishLinkForActivityType:completionHandler:]");

  }
  v45 = 0;
  v33 = v7;
  v8 = -[PUActivityItemSourceController _prepareForPerformWithActivityType:error:](self, "_prepareForPerformWithActivityType:error:", v7, &v45);
  v9 = v45;
  v31 = v9;
  if (v8)
  {
    -[NSMutableOrderedSet array](self->_assetItemSources, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v10, "copy");

    v11 = objc_msgSend(v32, "count") == 0;
    PLShareSheetGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Share Sheet: Attempted to publish a link with no items selected", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No items selected for moment share link"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v34 + 2))(v34, 0, 0, v30);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v49 = self;
        v50 = 2112;
        v51 = v33;
        v52 = 2112;
        v53 = v32;
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "Share Sheet: Begin publishing moment share link PUActivityItemSourceController=%@ with activityType=%@ activeItemSources=%@", buf, 0x20u);
      }

      -[PUActivityItemSourceController setActiveItemSources:](self, "setActiveItemSources:", v32);
      -[PUActivityItemSourceController setActiveActivityType:](self, "setActiveActivityType:", v33);
      -[PUActivityItemSourceController _setPublishedURL:](self, "_setPublishedURL:", 0);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = v32;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v42 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "setShouldSkipPreparation:", 1);
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v15);
      }

      -[PUActivityItemSourceController assets](self, "assets");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[PUActivityItemSourceController activeItemSources](self, "activeItemSources");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v20);
            v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
            v25 = objc_msgSend(v24, "sharingPreferences");
            if ((v25 & 0x100000101) != 0)
            {
              v26 = objc_alloc_init(MEMORY[0x1E0D7B248]);
              objc_msgSend(v26, "setPublishAsOriginal:", HIDWORD(v25) & 1);
              objc_msgSend(v26, "setPublishLivePhotoAsStill:", v25 & 1);
              objc_msgSend(v26, "setRemoveLocationData:", (v25 >> 8) & 1);
              objc_msgSend(v24, "asset");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "uuid");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v26, v28);

            }
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v21);
      }

      objc_copyWeak(&v36, (id *)buf);
      v35 = v34;
      PXPublishMomentShareWithCompletion();

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v34 + 2))(v34, 0, 0, v9);
  }

}

- (void)_didPublishMomentShareLinkToURL:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  PUActivityItemSourceController *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 865, CFSTR("%s must be called on the main thread"), "-[PUActivityItemSourceController _didPublishMomentShareLinkToURL:error:completionHandler:]");

  }
  objc_msgSend(v10, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D7C1E0]))
    v13 = objc_msgSend(v10, "code") == -1001;
  else
    v13 = 0;

  PLShareSheetGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "pl_redactedShareURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivityItemSourceController activeActivityType](self, "activeActivityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("NO");
    if (v13)
      v17 = CFSTR("YES");
    v18 = v17;
    *(_DWORD *)buf = 138544386;
    v26 = v15;
    v27 = 2112;
    v28 = self;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet: Finished publishing moment share link: %{public}@ PUActivityItemSourceController=%@ activityType=%@ didCancel=%@ error=%@", buf, 0x34u);

  }
  if (v11)
  {
    -[PUActivityItemSourceController _setPublishedURL:](self, "_setPublishedURL:", v9);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PUActivityItemSourceController__didPublishMomentShareLinkToURL_error_completionHandler___block_invoke;
    block[3] = &unk_1E58A4C18;
    v23 = v11;
    v21 = v9;
    v24 = v13;
    v22 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (v13)
    -[PUActivityItemSourceController cancel](self, "cancel");
  -[PUActivityItemSourceController _cleanupAfterPerform](self, "_cleanupAfterPerform");
  -[PUActivityItemSourceController updateState](self, "updateState");

}

- (void)cancel
{
  int *p_taskId;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  PUActivityItemSourceController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 888, CFSTR("expect main thread"));

  }
  p_taskId = &self->_taskId;
  do
    v5 = __ldaxr((unsigned int *)p_taskId);
  while (__stlxr(v5 + 1, (unsigned int *)p_taskId));
  PLShareSheetGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "cancel PUActivityItemSourceController=%@", buf, 0xCu);
  }

  -[PUActivityItemSourceController activeItemSources](self, "activeItemSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PUActivityItemSourceController setActiveItemSources:](self, "setActiveItemSources:", 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "cancel", (_QWORD)v14);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[PUActivityItemSourceController setProgressHandler:](self, "setProgressHandler:", 0);
    -[PUActivityItemSourceController setErrors:](self, "setErrors:", 0);
  }
  -[PUActivityItemSourceController updateState](self, "updateState", (_QWORD)v14);
  -[PUActivityItemSourceController setActiveActivityType:](self, "setActiveActivityType:", 0);

}

- (id)activityItemSourceForAsset:(id)a3
{
  id v4;
  NSMutableOrderedSet *assetItemSources;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  assetItemSources = self->_assetItemSources;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PUActivityItemSourceController_activityItemSourceForAsset___block_invoke;
  v10[3] = &unk_1E589B3E0;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableOrderedSet indexOfObjectPassingTest:](assetItemSources, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_assetItemSources, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D7BBE8];
  -[PUActivityItemSourceController activityViewController](self, "activityViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultPresenterWithViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6;
  void *v7;

  if (a4)
  {
    v6 = a4;
    -[PUActivityItemSourceController activityViewController](self, "activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);

  }
  return a4 != 0;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  int v15;
  PUActivityItemSourceController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[PUActivityItemSourceController activityViewController](self, "activityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      do
      {
        objc_msgSend(v9, "presentedViewController");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v7)
          break;
        objc_msgSend(v9, "presentedViewController");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
      }
      while (v13);
    }
  }
  objc_msgSend(v9, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v8);
  }
  else
  {
    PLShareSheetGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController=%@: Did not find a parent view controller for dismissing the CMM progress alert.", (uint8_t *)&v15, 0xCu);
    }

    v8[2](v8);
  }

  return v10 == v7;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

- (void)cmmActivityItemSource:(id)a3 willBeginPreparationWithActivityType:(id)a4 preparationType:(unint64_t)a5
{
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[PUActivityItemSourceController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[PUActivityItemSourceController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityItemSourceController:willBeginPreparationWithActivityType:preparationType:", self, v10, a5);

  }
}

- (void)cmmActivityItemSource:(id)a3 didFinishPreparationForActivityType:(id)a4 preparationType:(unint64_t)a5 withItems:(id)a6 didCancel:(BOOL)a7 error:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  char v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD v24[2];

  v10 = a7;
  v24[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a8;
  v17 = (void (**)(_QWORD))a9;
  -[PUActivityItemSourceController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    if (v16)
    {
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    -[PUActivityItemSourceController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __145__PUActivityItemSourceController_cmmActivityItemSource_didFinishPreparationForActivityType_preparationType_withItems_didCancel_error_completion___block_invoke;
    v22[3] = &unk_1E58ABAC8;
    v23 = v17;
    objc_msgSend(v21, "activityItemSourceController:didFinishPreparationForActivityType:preparationType:withItems:didCancel:errors:completion:", self, v14, a5, v15, v10, v20, v22);

  }
  else
  {
    v17[2](v17);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (((v6 & 1) == 0 || (void *)PUActivityItemSourceControllerItemSourceObserverContext != a5)
    && ((v6 & 1) == 0 || (void *)PUActivityItemSourceControllerCMMSourceObserverContext != a5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSourceController.m"), 1007, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PUActivityItemSourceController updateState](self, "updateState");

}

- (unint64_t)preferredPreparationType
{
  return self->_preferredPreparationType;
}

- (void)setPreferredPreparationType:(unint64_t)a3
{
  self->_preferredPreparationType = a3;
}

- (BOOL)shouldUseMomentShareLinkInMessagesIfThresholdMet
{
  return self->_shouldUseMomentShareLinkInMessagesIfThresholdMet;
}

- (void)setShouldUseMomentShareLinkInMessagesIfThresholdMet:(BOOL)a3
{
  self->_shouldUseMomentShareLinkInMessagesIfThresholdMet = a3;
}

- (PUActivityItemSourceControllerDelegate)delegate
{
  return (PUActivityItemSourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (PUActivityViewController)activityViewController
{
  return (PUActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (void)setActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_activityViewController, a3);
}

- (NSOrderedSet)assetItems
{
  return &self->_assetItems->super;
}

- (BOOL)shouldExcludeLivenessInAllItemSources
{
  return self->_shouldExcludeLivenessInAllItemSources;
}

- (BOOL)shouldExcludeLocationInAllItemSources
{
  return self->_shouldExcludeLocationInAllItemSources;
}

- (BOOL)shouldExcludeCaptionInAllItemSources
{
  return self->_shouldExcludeCaptionInAllItemSources;
}

- (BOOL)shouldExcludeAccessibilityDescriptionInAllItemSources
{
  return self->_shouldExcludeAccessibilityDescriptionInAllItemSources;
}

- (BOOL)shouldShareAsAssetBundles
{
  return self->_shouldShareAsAssetBundles;
}

- (BOOL)shouldShareAsUnmodifiedOriginals
{
  return self->_shouldShareAsUnmodifiedOriginals;
}

- (int64_t)preferredExportFormat
{
  return self->_preferredExportFormat;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setSocialGroup:(id)a3
{
  objc_storeStrong((id *)&self->_socialGroup, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)momentSharePublishAttempted
{
  return self->_momentSharePublishAttempted;
}

- (NSURL)publishedURL
{
  return self->_publishedURL;
}

- (void)_setPublishedURL:(id)a3
{
  objc_storeStrong((id *)&self->_publishedURL, a3);
}

- (PUCMMActivityItemSource)cmmActivityItemSource
{
  return self->_cmmActivityItemSource;
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)activeActivityType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setActiveActivityType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (unint64_t)numSourcesDownloading
{
  return self->_numSourcesDownloading;
}

- (void)setNumSourcesDownloading:(unint64_t)a3
{
  self->_numSourcesDownloading = a3;
}

- (OS_dispatch_queue)externalIsolation
{
  return self->_externalIsolation;
}

- (unsigned)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->_activeActivityType, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_cmmActivityItemSource, 0);
  objc_storeStrong((id *)&self->_publishedURL, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeItemSources, 0);
  objc_storeStrong((id *)&self->_assetItemSources, 0);
  objc_storeStrong((id *)&self->_assetItems, 0);
}

uint64_t __145__PUActivityItemSourceController_cmmActivityItemSource_didFinishPreparationForActivityType_preparationType_withItems_didCancel_error_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__PUActivityItemSourceController_activityItemSourceForAsset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __90__PUActivityItemSourceController__didPublishMomentShareLinkToURL_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __79__PUActivityItemSourceController_publishLinkForActivityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v5;
  v8 = v6;
  v9 = *(id *)(a1 + 32);
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __79__PUActivityItemSourceController_publishLinkForActivityType_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_didPublishMomentShareLinkToURL:error:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke(uint64_t a1, double a2)
{
  double v2;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = a2;
  if (a2 < 0.0 || a2 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PUActivityItemSourceController.m"), 702, CFSTR("expect progress range"));

  }
  v5 = atomic_load((unsigned int *)(a1 + 80));
  v6 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 120));
  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "errors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      if (v2 >= 1.0)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v2 = 0.0;
      }
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (v2
                                                                   + (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                                 + 24))
                                                                  / (double)*(unint64_t *)(a1 + 72);
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(double))(v9 + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }
  }
}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a2;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_3;
  v12[3] = &unk_1E58A6118;
  v9 = *(NSObject **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v18 = *(_QWORD *)(a1 + 64);
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v17 = *(id *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  char v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  _BYTE v42[18];
  void *v43;
  uint64_t v44;
  NSObject *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  PLShareSheetGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 80);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    v40 = v4;
    v41 = 2048;
    *(_QWORD *)v42 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController finished waiting after %lu item source completions (started with %lu)", buf, 0x16u);
  }

  v5 = atomic_load((unsigned int *)(a1 + 88));
  v6 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 40) + 120));
  objc_msgSend(*(id *)(a1 + 40), "errors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = v5 == v6 && objc_msgSend(v8, "count") == 0;
  PLShareSheetGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v40 = v11;
    v41 = 1024;
    *(_DWORD *)v42 = v5 != v6;
    *(_WORD *)&v42[4] = 2112;
    *(_QWORD *)&v42[6] = v8;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "end running PUActivityItemSourceController=%@ didCancel=%i errors=%@", buf, 0x1Cu);
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "simulateError");

    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "simulateMismatchedExportCounts");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharingSettingsErrorDomain"), 0, CFSTR("Simulated error, because PXSharingSettings.simulateError is YES"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v17;
    }
    else if (v15)
    {
      objc_msgSend(*(id *)(a1 + 48), "removeLastObject");
    }
    v18 = *(_QWORD *)(a1 + 80);
    if (v18 == objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      PLShareSheetGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(*(id *)(a1 + 48), "count");
        v21 = *(_QWORD *)(a1 + 80);
        v22 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 134218498;
        v40 = v20;
        v41 = 2048;
        *(_QWORD *)v42 = v21;
        *(_WORD *)&v42[8] = 2112;
        *(_QWORD *)&v42[10] = v22;
        v23 = "PUActivityItemSourceController succeeded (no errors or cancellation) and prepared %ld/%ld items for activity %@.";
        v24 = v19;
        v25 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
        _os_log_impl(&dword_1AAB61000, v24, v25, v23, buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "allowFallbacksWhilePreparing");

      PLShareSheetGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if ((v27 & 1) == 0)
      {
        if (v28)
        {
          v32 = *(_QWORD *)(a1 + 80);
          v33 = objc_msgSend(*(id *)(a1 + 48), "count");
          *(_DWORD *)buf = 134218240;
          v40 = v32;
          v41 = 2048;
          *(_QWORD *)v42 = v33;
          _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "PUActivityItemSourceController succeeded (no errors or cancellation), but from preparing %ld item sources, it ended with %ld items.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The number of prepared items (%ld) does not match the number of items initially being prepared (%ld)."), objc_msgSend(*(id *)(a1 + 48), "count"), *(_QWORD *)(a1 + 80));
        v19 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v44 = *MEMORY[0x1E0CB2938];
        v45 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUActivityItemSourceController"), -1, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v36;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v37 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v37;
        goto LABEL_23;
      }
      if (v28)
      {
        v29 = *(_QWORD *)(a1 + 80);
        v30 = objc_msgSend(*(id *)(a1 + 48), "count");
        v31 = objc_msgSend(*(id *)(a1 + 48), "count");
        *(_DWORD *)buf = 134218496;
        v40 = v29;
        v41 = 2048;
        *(_QWORD *)v42 = v30;
        *(_WORD *)&v42[8] = 2048;
        *(_QWORD *)&v42[10] = v31;
        v23 = "PUActivityItemSourceController succeeded (no errors or cancellation), but from preparing %ld item sources,"
              " it ended with %ld items. Sharing just the %ld items.";
        v24 = v19;
        v25 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
    }
LABEL_23:

  }
  v38 = *(_QWORD *)(a1 + 64);
  if (v38)
    (*(void (**)(uint64_t, _QWORD, BOOL, void *))(v38 + 16))(v38, *(_QWORD *)(a1 + 48), v5 != v6, v8);
  px_dispatch_on_main_queue();

}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_190(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupAfterPerform");
  objc_msgSend(*(id *)(a1 + 32), "updateState");
  objc_msgSend(MEMORY[0x1E0D7B858], "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePowerAssertionForIdentifier:withReason:completion:", objc_msgSend(*(id *)(a1 + 32), "powerAssertionIdentifier"), 8, 0);

}

void __83__PUActivityItemSourceController_runExplicitly_withActivityType_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "errors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

  }
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "signalAnchorCompletion");
  PLShareSheetGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    v6 = v3;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing moment-share link from individual assets for activity: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_168(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    if (v7)
    {
      v19[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_4:
        v18 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 40);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_2;
        v16[3] = &unk_1E58ABAC8;
        v17 = *(id *)(a1 + 48);
        objc_msgSend(v13, "activityItemSourceController:didFinishPreparationForActivityType:preparationType:withItems:didCancel:errors:completion:", v14, v15, 1, v11, a3, v12, v16);

        goto LABEL_9;
      }
    }
    else
    {
      v11 = 0;
      if (v8)
        goto LABEL_4;
    }
    v12 = 0;
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

uint64_t __94__PUActivityItemSourceController__prepareMomentShareLinkFromIndividualItemSourcesForActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

void __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
    dispatch_semaphore_signal(v2);
  PLShareSheetGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = a1[5];
    v6 = a1[6];
    v8 = 138412802;
    v9 = v4;
    v10 = 2048;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v7 = v4;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing assets for activity: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

void __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_163(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2_166;
    v14[3] = &unk_1E58ABAC8;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v11, "activityItemSourceController:didFinishPreparationForActivityType:preparationType:withItems:didCancel:errors:completion:", v12, v13, 0, v7, a3, v8, v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __75__PUActivityItemSourceController__prepareIndividualItemSourcesForActivity___block_invoke_2_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__PUActivityItemSourceController_requestAssetsMediaTypeCount__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "playbackStyle");
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    if (objc_msgSend(v13, "excludeLocation"))
      ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  objc_msgSend(v3, "descriptionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  objc_msgSend(v3, "descriptionProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  if ((unint64_t)(v4 - 1) <= 2)
    ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  if (v4 == 3)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24);
    if (objc_msgSend(v13, "excludeLiveness"))
    {
      v12 = a1 + 12;
      goto LABEL_17;
    }
  }
  else if (v4 == 5)
  {
    v12 = a1 + 10;
LABEL_17:
    ++*(_QWORD *)(*(_QWORD *)(*v12 + 8) + 24);
  }

}

uint64_t __45__PUActivityItemSourceController_updateState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__PUActivityItemSourceController_setState___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 192) != *(_QWORD *)(result + 40))
  {
    v1 = result;
    PLShareSheetGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 192);
      if (v3 > 2)
        v4 = CFSTR("unknown");
      else
        v4 = off_1E589B538[v3];
      v5 = *(_QWORD *)(v1 + 40);
      if (v5 > 2)
        v6 = CFSTR("unknown");
      else
        v6 = off_1E589B538[v5];
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "PUActivityItemSourceController changing state from %{public}@ to %{public}@", (uint8_t *)&v7, 0x16u);
    }

    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 192) = *(_QWORD *)(v1 + 40);
    return objc_msgSend(*(id *)(v1 + 32), "signalChange:", 1);
  }
  return result;
}

uint64_t __50__PUActivityItemSourceController_removeAssetItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "synthesizedSharingPreferencesForAssetItem:", v6);
  v10 = v9;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke_2;
  v11[3] = &__block_descriptor_48_e39_v16__0___PUMutableActivityItemSource__8l;
  v11[4] = v8;
  v11[5] = v10;
  objc_msgSend(v7, "performChanges:", v11);

}

uint64_t __71__PUActivityItemSourceController_updateSharingPreferencesInItemSources__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSharingPreferences:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __48__PUActivityItemSourceController_setAssetItems___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__PUActivityItemSourceController_setAssetItems___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SharingVariantsDuration", ", v5, 2u);
  }

}

@end
