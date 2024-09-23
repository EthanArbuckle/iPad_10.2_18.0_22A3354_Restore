@implementation PLDuplicateMergeModelProperties

- (PLDuplicateMergeModelProperties)initWithTargetAsset:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PLDuplicateMergeModelProperties *v9;
  id v10;
  id v11;
  uint64_t v12;
  PLLazyObject *lazyMergePropertyMap;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLDuplicateMergeModelProperties;
  v9 = -[PLDuplicateMergeModelProperties init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_initWeak(&location, v9);

    v11 = objc_alloc(MEMORY[0x1E0D73248]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__PLDuplicateMergeModelProperties_initWithTargetAsset_photoLibrary___block_invoke;
    v15[3] = &unk_1E36759D8;
    objc_copyWeak(&v16, &location);
    v12 = objc_msgSend(v11, "initWithBlock:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    lazyMergePropertyMap = v9->_lazyMergePropertyMap;
    v9->_lazyMergePropertyMap = (PLLazyObject *)v12;

    objc_storeStrong((id *)&v9->_targetAsset, a3);
    objc_storeStrong((id *)&v9->_library, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PLLazyObject invalidate](self->_lazyMergePropertyMap, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLDuplicateMergeModelProperties;
  -[PLDuplicateMergeModelProperties dealloc](&v3, sel_dealloc);
}

- (id)mergePropertyMap
{
  return (id)-[PLLazyObject objectValue](self->_lazyMergePropertyMap, "objectValue");
}

- (BOOL)transferPropertiesFromSourceAsset:(id)a3 propertyMergeType:(int64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMergeModelProperties.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAsset"));

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__13836;
  v28 = __Block_byref_object_dispose__13837;
  v29 = 0;
  -[PLDuplicateMergeModelProperties mergePropertyMap](self, "mergePropertyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__PLDuplicateMergeModelProperties_transferPropertiesFromSourceAsset_propertyMergeType_error___block_invoke;
  v19[3] = &unk_1E3663740;
  v19[4] = self;
  v12 = v9;
  v20 = v12;
  v21 = &v30;
  v22 = &v24;
  v23 = a4;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);
  v13 = *((unsigned __int8 *)v31 + 24);
  v14 = (id)v25[5];
  v15 = v14;
  if (!v13 && a5)
    *a5 = objc_retainAutorelease(v14);

  v16 = *((_BYTE *)v31 + 24);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (void)_postProcessingWithSourceDuplicateAsset:(id)a3 type:(int64_t)a4
{
  id v5;
  id v6;

  if (!a4)
  {
    v5 = a3;
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateMergeModelProperties _mergeActionProcessingWithSourceDuplicateAsset:entityName:propertyName:](self, "_mergeActionProcessingWithSourceDuplicateAsset:entityName:propertyName:", v5, v6, CFSTR("memoriesBeingKeyAsset"));

  }
}

- (void)_mergeActionProcessingWithSourceDuplicateAsset:(id)a3 entityName:(id)a4 propertyName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if (v11)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("favorite")))
    {
      -[PLDuplicateMergeModelProperties _mergeFavoriteFromSource:](self, "_mergeFavoriteFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("albums")))
    {
      -[PLDuplicateMergeModelProperties _mergeAlbumRelationshipsFromSource:](self, "_mergeAlbumRelationshipsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingRepresentativeAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoryBeingRepresentativeAssetsFromSource:](self, "_mergeMemoryBeingRepresentativeAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingCuratedAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoryBeingCuratedAssetsFromSource:](self, "_mergeMemoryBeingCuratedAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingExtendedCuratedAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoryBeingExtendedCuratedAssetsFromSource:](self, "_mergeMemoryBeingExtendedCuratedAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingMovieCuratedAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoriesBeingMovieCuratedAssetsFromSource:](self, "_mergeMemoriesBeingMovieCuratedAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingUserCuratedAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoriesBeingUserCuratedAssetsFromSource:](self, "_mergeMemoriesBeingUserCuratedAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingCustomUserAssets")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoriesBeingCustomUserAssetsFromSource:](self, "_mergeMemoriesBeingCustomUserAssetsFromSource:", v16);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("memoriesBeingKeyAsset")))
    {
      -[PLDuplicateMergeModelProperties _mergeMemoriesBeingKeyAssetFromSource:](self, "_mergeMemoriesBeingKeyAssetFromSource:", v16);
    }
  }
  else
  {
    +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqualToString:", v12);

    if (v13)
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("title")))
      {
        -[PLDuplicateMergeModelProperties _mergeTitleFromSource:](self, "_mergeTitleFromSource:", v16);
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("timeZoneName")) & 1) != 0
             || objc_msgSend(v9, "isEqualToString:", CFSTR("timeZoneOffset")))
      {
        -[PLDuplicateMergeModelProperties _mergeTimezoneFromSource:](self, "_mergeTimezoneFromSource:", v16);
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("keywords")))
      {
        -[PLDuplicateMergeModelProperties _mergeKeywordsFromSource:](self, "_mergeKeywordsFromSource:", v16);
      }
      else
      {
        objc_msgSend(v9, "isEqualToString:", CFSTR("editedIPTCAttributes"));
      }
    }
    else
    {
      +[PLAssetDescription entityName](PLAssetDescription, "entityName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "isEqualToString:", v14);

      if (v15 && objc_msgSend(v9, "isEqualToString:", CFSTR("longDescription")))
        -[PLDuplicateMergeModelProperties _mergeCaptionFromSource:](self, "_mergeCaptionFromSource:", v16);
    }
  }

}

- (void)_customActionProcessingWithSourceDuplicateAsset:(id)a3 entityName:(id)a4 propertyName:(id)a5 type:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("dateCreated")))
    {
      if (a6)
      {
        if (a6 == 1)
        {
          -[PLDuplicateMergeModelProperties _resourcePropertyCopyDateCreatedFromSource:](self, "_resourcePropertyCopyDateCreatedFromSource:", v21);
          goto LABEL_6;
        }
      }
      else
      {
        -[PLDuplicateMergeModelProperties _mergeDateFromSource:](self, "_mergeDateFromSource:", v21);
      }
      objc_msgSend(v11, "isEqualToString:", CFSTR("extendedAttributes"));
      v16 = a6 == 1;
LABEL_16:
      v20 = objc_msgSend(v11, "isEqualToString:", CFSTR("currentSleetCast"));
      if (v16 && v20)
        -[PLDuplicateMergeModelProperties _resourcePropertyCopyCurrentSleetCastFromSource:](self, "_resourcePropertyCopyCurrentSleetCastFromSource:", v21);
      goto LABEL_19;
    }
LABEL_6:
    v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("extendedAttributes"));
    v15 = a6 == 1;
    v16 = a6 == 1;
    if (v15 && v14)
    {
      -[PLDuplicateMergeModelProperties _resourcePropertyCopyExtendedAttributesFromSource:](self, "_resourcePropertyCopyExtendedAttributesFromSource:", v21);
      v16 = 1;
    }
    goto LABEL_16;
  }
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v10, "isEqualToString:", v17);

  if (v18)
  {
    v19 = objc_msgSend(v11, "isEqualToString:", CFSTR("mediaMetadataType"));
    if (a6 == 1)
    {
      if (v19)
        -[PLDuplicateMergeModelProperties _resourcePropertyCopyMediaMetadataFromSource:](self, "_resourcePropertyCopyMediaMetadataFromSource:", v21);
    }
  }
LABEL_19:

}

- (id)_managedObjectFromDuplicateAsset:(id)a3 matchingEntityName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v5, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(v5, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "additionalAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PLAssetDescription entityName](PLAssetDescription, "entityName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "isEqualToString:", v13);

      if (!v14)
      {
        v9 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v5, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "additionalAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_9:

  return v9;
}

- (BOOL)_isValidManagedObject:(id)a3 forEntityName:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  +[PLAssetDescription entityName](PLAssetDescription, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (a3)
    return 1;
  else
    return v7;
}

- (void)_resourcePropertyCopyDateCreatedFromSource:(id)a3
{
  PLDuplicateAsset *targetAsset;
  id v5;
  void *v6;
  void *v7;
  id v8;

  targetAsset = self->_targetAsset;
  v5 = a3;
  -[PLDuplicateAsset asset](targetAsset, "asset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[PLDuplicateAsset dateUpdated](self->_targetAsset, "dateUpdated"))
  {
    objc_msgSend(v6, "dateCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateCreated:", v7);

  }
}

- (void)_resourcePropertyCopyExtendedAttributesFromSource:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "updateExtendedAttributesWithError:", &v13);
  v6 = v13;
  if (v6)
  {
    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Duplicate Merge: update extended attributes failed: [%@ -> %@] Error: %@", buf, 0x20u);

    }
  }
  PLDuplicateDetectionGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Duplicate Merge: property merge completed [%{public}@ -> %{public}@]", buf, 0x16u);

  }
}

- (void)_resourcePropertyCopyMediaMetadataFromSource:(id)a3
{
  PLDuplicateAsset *targetAsset;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  targetAsset = self->_targetAsset;
  v4 = a3;
  -[PLDuplicateAsset asset](targetAsset, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalAttributes");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "additionalAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mediaMetadataType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaMetadataType:", v8);

  objc_msgSend(v7, "mediaMetadataData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v10, "setMediaMetadataData:", v9);

}

- (void)_resourcePropertyCopyCurrentSleetCastFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentSleetCast:", objc_msgSend(v5, "currentSleetCast"));
  PLDuplicateDetectionGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: currentSleetCast property merge completed [%{public}@ -> %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_mergeTitleFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PLDuplicateAsset titleUpdated](self->_targetAsset, "titleUpdated")
    && -[PLDuplicateMergeModelProperties _isValidForTitleOverwriteWithSource:](self, "_isValidForTitleOverwriteWithSource:", v4))
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    -[PLDuplicateAsset setTitleUpdated:](self->_targetAsset, "setTitleUpdated:", 1);
    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Duplicate Merge: title: \"%@\" [%{public}@ -> %{public}@]", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_mergeDateFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PLDuplicateAsset dateUpdated](self->_targetAsset, "dateUpdated")
    && -[PLDuplicateMergeModelProperties _isValidForDateCreatedOverwriteWithSource:](self, "_isValidForDateCreatedOverwriteWithSource:", v4))
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateCreated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDateCreated:", v7);

    -[PLDuplicateAsset setDateUpdated:](self->_targetAsset, "setDateUpdated:", 1);
    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "dateCreated");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Duplicate Merge: date: \"%@\" [%{public}@ -> %{public}@]", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)_mergeTimezoneFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PLDuplicateAsset timezoneUpdated](self->_targetAsset, "timezoneUpdated")
    && -[PLDuplicateMergeModelProperties _isValidForTimezoneOverwriteWithSource:](self, "_isValidForTimezoneOverwriteWithSource:", v4))
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "additionalAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "additionalAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeZoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZoneName:", v9);

    objc_msgSend(v6, "timeZoneOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZoneOffset:", v10);

    -[PLDuplicateAsset setTimezoneUpdated:](self->_targetAsset, "setTimezoneUpdated:", 1);
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "timeZoneName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeZoneOffset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Duplicate Merge: timezone: \"%@ | %@\" [%{public}@ -> %{public}@]", (uint8_t *)&v16, 0x2Au);

    }
  }

}

- (void)_mergeCaptionFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "longDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLDuplicateMergeModelProperties _isValidForOverwriteWithSourceProperty:targetProperty:](self, "_isValidForOverwriteWithSourceProperty:targetProperty:", v7, v8);

  if (v9)
  {
    objc_msgSend(v5, "longDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "longDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self contains[cd] %@"), v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject evaluateWithObject:](v12, "evaluateWithObject:", v11) & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendFormat:", CFSTR("\n%@"), v10);
      v14 = objc_msgSend(v13, "copy");

      v10 = (void *)v14;
    }
    objc_msgSend(v6, "setLongDescription:", v10);
    PLDuplicateDetectionGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "longDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v19 = v11;
      v20 = 2112;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v17;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Duplicate Merge: update caption: \"%@|%@\" [%{public}@ -> %{public}@]", buf, 0x2Au);

    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_mergeKeywordsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *log;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keywords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keywords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "valueForKey:", CFSTR("title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v13, "unionSet:", v11);
    objc_msgSend(v13, "unionSet:", v12);
    -[PLPhotoLibrary keywordManager](self->_library, "keywordManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setKeywords:forAsset:", v13, v15);

    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      log = v16;
      v32 = v12;
      v33 = v11;
      v34 = v7;
      v35 = v4;
      objc_msgSend(v13, "allObjects");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        v23 = 1;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v24);
            if ((v23 & 1) == 0)
              objc_msgSend(v18, "appendString:", CFSTR(", "));
            objc_msgSend(v25, "description");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "appendString:", v26);

            v23 = 0;
            ++v24;
          }
          while (v21 != v24);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
          v23 = 0;
        }
        while (v21);
      }

      objc_msgSend(v18, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v27;
      v4 = v35;
      objc_msgSend(v35, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412802;
      v41 = v27;
      v42 = 2114;
      v43 = v29;
      v44 = 2114;
      v45 = v30;
      v16 = log;
      _os_log_impl(&dword_199541000, log, OS_LOG_TYPE_INFO, "Duplicate Merge: update keywords: \"%@\" [%{public}@ -> %{public}@]", buf, 0x20u);

      v11 = v33;
      v7 = v34;
      v12 = v32;
    }

  }
}

- (void)_mergeFavoriteFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFavorite") & 1) == 0 && objc_msgSend(v5, "isFavorite"))
  {
    objc_msgSend(v6, "setFavorite:", 1);
    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: favorite: \"YES\" [%{public}@ -> %{public}@]", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)_mergeAlbumRelationshipsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  PLDuplicateMergeModelProperties *v16;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PLDuplicateMergeModelProperties__mergeAlbumRelationshipsFromSource___block_invoke;
  v12[3] = &unk_1E3663768;
  v13 = v5;
  v14 = v6;
  v15 = v4;
  v16 = self;
  v9 = v4;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

- (void)_mergeMemoryBeingRepresentativeAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "memoriesBeingRepresentativeAssets", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "addRepresentativeAssetsObject:", v6);
      }
      v10 += v9;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v9);

    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v10;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingRepresentativeAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoryBeingCuratedAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "memoriesBeingCuratedAssets", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "addCuratedAssetsObject:", v6);
      }
      v10 += v9;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v9);

    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v10;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingCuratedAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoryBeingExtendedCuratedAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLDuplicateMergeModelProperties *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "memoriesBeingExtendedCuratedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");

  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v9)
  {
    v10 = v9;
    v19 = self;
    v20 = v4;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "extendedCuratedAssets", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "removeObject:", v5);
        objc_msgSend(v16, "addObject:", v6);
        objc_msgSend(v14, "setExtendedCuratedAssets:", v16);

      }
      v11 += v10;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);

    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v4 = v20;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v20, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](v19->_targetAsset, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v11;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingExtendedCuratedAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoriesBeingMovieCuratedAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "memoriesBeingMovieCuratedAssets", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "addMovieCuratedAssetsObject:", v6);
      }
      v10 += v9;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v9);

    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v10;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingMovieCuratedAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoriesBeingUserCuratedAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "memoriesBeingUserCuratedAssets", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "addUserCuratedAssetsObject:", v6);
      }
      v10 += v9;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v9);

    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v20 = v10;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingUserCuratedAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoriesBeingCustomUserAssetsFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PLDuplicateMergeModelProperties *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateAsset asset](self->_targetAsset, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "memoriesBeingCustomUserAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "copy");

  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v9)
  {
    v10 = v9;
    v19 = self;
    v20 = v4;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "customUserAssets", v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "indexOfObject:", v5);

        objc_msgSend(v14, "replaceObjectInCustomUserAssetsAtIndex:withObject:", v16, v6);
      }
      v11 += v10;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);

    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v4 = v20;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v20, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](v19->_targetAsset, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v11;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingCustomUserAssets: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (void)_mergeMemoriesBeingKeyAssetFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "memoriesBeingKeyAsset", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");

  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "calculateKeyAsset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setKeyAsset:", v14);

      }
      v10 += v9;
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v9);

    PLDuplicateDetectionGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateAsset shortDescription](self->_targetAsset, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v22 = v10;
      v23 = 2114;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Duplicate Merge: updated %tu memoriesBeingKeyAsset: [%{public}@ -> %{public}@]", buf, 0x20u);

    }
  }

}

- (BOOL)isRecentlyModifiedSourceAsset:(id)a3
{
  PLDuplicateAsset *targetAsset;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  targetAsset = self->_targetAsset;
  v4 = a3;
  -[PLDuplicateAsset asset](targetAsset, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "modificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8) == -1;

  return v9;
}

- (BOOL)_isValidForOverwriteWithSourceProperty:(id)a3 targetProperty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_14;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "isEqualToString:", v7);
LABEL_13:
        v9 = v8 ^ 1;
        goto LABEL_15;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "isEqualToDate:", v7);
        goto LABEL_13;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "isEqualToNumber:", v7);
        goto LABEL_13;
      }
    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v9 = 1;
LABEL_15:

  return v9;
}

- (BOOL)_isValidForTimezoneOverwriteWithSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeZoneOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "additionalAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZoneOffset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      LOBYTE(v12) = 1;
      goto LABEL_11;
    }
    v11 = objc_msgSend(v4, "hasModifiedUserTimezone");
    if (-[PLDuplicateAsset hasModifiedUserTimezone](self->_targetAsset, "hasModifiedUserTimezone")
      && objc_msgSend(v4, "hasModifiedUserTimezone"))
    {
      if (!-[PLDuplicateMergeModelProperties isRecentlyModifiedSourceAsset:](self, "isRecentlyModifiedSourceAsset:", v4))
      {
LABEL_6:
        LOBYTE(v12) = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    else if (!v11)
    {
      goto LABEL_6;
    }
    v12 = objc_msgSend(v10, "isEqualToNumber:", v7) ^ 1;
    goto LABEL_11;
  }
  LOBYTE(v12) = 0;
LABEL_12:

  return v12;
}

- (BOOL)_isValidForDateCreatedOverwriteWithSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateCreated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v10 = 1;
      goto LABEL_13;
    }
    v9 = objc_msgSend(v4, "hasModifiedUserDateCreated");
    if (-[PLDuplicateAsset hasModifiedUserDateCreated](self->_targetAsset, "hasModifiedUserDateCreated")
      && objc_msgSend(v4, "hasModifiedUserDateCreated"))
    {
      if (!-[PLDuplicateMergeModelProperties isRecentlyModifiedSourceAsset:](self, "isRecentlyModifiedSourceAsset:", v4))goto LABEL_10;
    }
    else if (!v9)
    {
LABEL_10:
      v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    if ((objc_msgSend(v8, "isEqualToDate:", v6) & 1) == 0)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      v10 = fabs(v11) >= 1.0;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)_isValidForTitleOverwriteWithSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PLDuplicateAsset asset](self->_targetAsset, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      LOBYTE(v10) = 1;
      goto LABEL_11;
    }
    v9 = objc_msgSend(v4, "hasModifiedUserTitle");
    if (-[PLDuplicateAsset hasModifiedUserTitle](self->_targetAsset, "hasModifiedUserTitle")
      && objc_msgSend(v4, "hasModifiedUserTitle"))
    {
      if (!-[PLDuplicateMergeModelProperties isRecentlyModifiedSourceAsset:](self, "isRecentlyModifiedSourceAsset:", v4))
      {
LABEL_6:
        LOBYTE(v10) = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    v10 = objc_msgSend(v8, "isEqualToString:", v6) ^ 1;
    goto LABEL_11;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_targetAsset, 0);
  objc_storeStrong((id *)&self->_lazyMergePropertyMap, 0);
}

void __70__PLDuplicateMergeModelProperties__mergeAlbumRelationshipsFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "mutableAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 1508 || v5 == 2) && (objc_msgSend(v3, "isInTrash") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "indexOfObject:", *(_QWORD *)(a1 + 32));
    if ((objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      objc_msgSend(v6, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), v7);
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
    PLDuplicateDetectionGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Duplicate Merge: updated album: \"%@\" [%{public}@ -> %{public}@]", (uint8_t *)&v12, 0x20u);

    }
  }

}

void __93__PLDuplicateMergeModelProperties_transferPropertiesFromSourceAsset_propertyMergeType_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mergePropertyMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_managedObjectFromDuplicateAsset:matchingEntityName:", *(_QWORD *)(a1 + 40), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_managedObjectFromDuplicateAsset:matchingEntityName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "_isValidManagedObject:forEntityName:", v9, v6)
    || (objc_msgSend(*(id *)(a1 + 32), "_isValidManagedObject:forEntityName:", v10, v6) & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Unable to obtain managed object from entity name");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 49408, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __93__PLDuplicateMergeModelProperties_transferPropertiesFromSourceAsset_propertyMergeType_error___block_invoke_2;
    v20[3] = &unk_1E3663718;
    v26 = *(_QWORD *)(a1 + 64);
    v21 = v9;
    v17 = v10;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v22 = v17;
    v23 = v18;
    v24 = v19;
    v25 = v6;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "_postProcessingWithSourceDuplicateAsset:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

  }
}

void __93__PLDuplicateMergeModelProperties_transferPropertiesFromSourceAsset_propertyMergeType_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(a3, "integerValue");
  if (v5 == 3)
  {
    objc_msgSend(*(id *)(a1 + 48), "_customActionProcessingWithSourceDuplicateAsset:entityName:propertyName:type:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v7, *(_QWORD *)(a1 + 72));
  }
  else if (v5 == 2)
  {
    if (!*(_QWORD *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 48), "_mergeActionProcessingWithSourceDuplicateAsset:entityName:propertyName:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v7);
  }
  else if (v5 == 1 && *(_QWORD *)(a1 + 72) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v6, v7);

  }
}

id __68__PLDuplicateMergeModelProperties_initWithTargetAsset_photoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[PLDuplicateMergeModelProperties _mergePropertyMap](PLDuplicateMergeModelProperties, "_mergePropertyMap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)_mergePropertyMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(a1, "_assetMergePropertyMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(a1, "_additionalAssetAttributesMergePropertyMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  +[PLAssetDescription entityName](PLAssetDescription, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(a1, "_assetDescriptionMergePropertyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_assetMergePropertyMap
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("depthType"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("hdrGain"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("hdrType"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("height"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("imageRequestHints"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("kind"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("kindSubtype"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("mediaGroupUUID"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("orientation"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("overallAestheticScore"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("packedAcceptableCropRect"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("packedBadgeAttributes"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("packedPreferredCropRect"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("playbackStyle"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("playbackVariation"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("RAWBadgeAttribute"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("savedAssetType"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("uniformTypeIdentifier"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoCpDurationValue"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoCpVisibilityState"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoDeferredProcessingNeeded"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoKeyFrameTimeScale"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoKeyFrameValue"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("visibilityState"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("width"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("stickerConfidenceScore"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("albums"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("favorite"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingCuratedAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingCustomUserAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingExtendedCuratedAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingMovieCuratedAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingRepresentativeAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingUserCuratedAssets"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingKeyAsset"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("memoriesBeingUserRemovedAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dateCreated"), 3);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("extendedAttributes"), 3);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("currentSleetCast"), 3);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("activeLibraryScopeParticipationState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("addedDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("adjustmentTimestamp"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("adjustmentsState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("analysisStateModificationDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("avalanchePickType"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("avalancheKind"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("avalancheUUID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("boundedByRect"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("bundleScope"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cameraProcessingAdjustmentState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudAssetGUID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudBatchID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudBatchPublishDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudCollectionGUID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudDeleteState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudDownloadRequests"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudHasCommentsByMe"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudHasCommentsConversation"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudHasUnseenComments"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudIsDeletable"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudIsMyAsset"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudLastViewedCommentDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudLocalState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudOwnerHashedPersonID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudPlaceholderKind"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudServerPublishDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("complete"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("curationScore"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("deferredProcessingNeeded"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("deleteReason"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("derivedCameraCaptureDevice"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("directory"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("duplicateAssetVisibilityState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("duration"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("faceAdjustmentVersion"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("faceAreaPoints"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("filename"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("hidden"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highFrameRateState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightVisibilityScore"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("iconicScore"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("isMagicCarpet"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("lastSharedDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("latitude"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("libraryScopeShareState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("locationData"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("longitude"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("modificationDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("spatialType"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalColorSpace"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("promotionScore"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("searchIndexRebuildState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sortToken"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("syndicationState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("thumbnailIndex"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("trashedDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("trashedReason"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("trashedState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("uuid"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("isDetectedScreenshot"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("captureSessionIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("isRecentlySaved"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("generativeMemoryCreationEligibilityState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("additionalAttributes"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("albumsBeingCustomKeyAsset"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("albumsBeingKeyAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("analysisStates"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudComments"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudFeedAssetsEntry"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("computedAttributes"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("conversation"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayGroupHighlightBeingAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayGroupHighlightBeingExtendedAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayGroupHighlightBeingKeyAssetPrivate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayGroupHighlightBeingKeyAssetShared"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayGroupHighlightBeingSummaryAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("detectedFaces"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("detectedTorsos"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("duplicateMetadataMatchingAlbum"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("duplicatePerceptualMatchingAlbum"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("faceCrops"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightBeingAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightBeingExtendedAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayHighlightBeingCollageAssetsPrivate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayHighlightBeingCollageAssetsShared"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dayHighlightBeingCollageAssetsMixed"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightBeingKeyAssetPrivate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightBeingKeyAssetShared"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("highlightBeingSummaryAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("importSession"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("legacyFaces"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("libraryScope"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("libraryScopeAssetContributors"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("likeComments"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("master"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("mediaAnalysisAttributes"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("computeSyncAttributes"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("modernResources"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("moment"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("momentShare"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("monthHighlightBeingKeyAssetPrivate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("monthHighlightBeingKeyAssetShared"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("photoAnalysisAttributes"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("resources"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("suggestionsBeingKeyAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("suggestionsBeingRepresentativeAssets"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("temporalDetectedFaces"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("trashedByParticipant"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("yearHighlightBeingKeyAssetPrivate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("yearHighlightBeingKeyAssetShared"), 0);
  return v3;
}

+ (id)_additionalAssetAttributesMergePropertyMap
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("accessibilityDescription"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("adjustedStableHash"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("alternateImportImageDate"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("editorBundleID"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("embeddedThumbnailHeight"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("embeddedThumbnailLength"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("embeddedThumbnailOffset"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("embeddedThumbnailWidth"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalStableHash"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalFilesize"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalHash"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalHeight"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalOrientation"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalResourceChoice"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalWidth"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originatingAssetIdentifier"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("spatialOverCaptureGroupIdentifier"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoCpDisplayTimescale"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoCpDisplayValue"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("videoCpDurationTimescale"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("viewPresentation"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sleetIsReversible"), 1);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("title"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("timeZoneName"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("timeZoneOffset"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("keywords"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("editedIPTCAttributes"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("mediaMetadataType"), 3);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("allowedForAnalysis"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cameraCaptureDevice"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudAvalanchePickType"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudKindSubtype"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudRecoveryState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("cloudStateRecoveryAttemptsCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("dateCreatedSource"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("deferredPhotoIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("deferredProcessingCandidateOptions"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("destinationAssetCopyState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("distanceIdentity"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("duplicateDetectorPerceptualProcessingState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("exifTimestampString"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("faceAnalysisVersion"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("faceRegions"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("gpsHorizontalAccuracy"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("hasPeopleSceneMidOrGreaterConfidence"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("importedBy"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("importedByBundleIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("importedByDisplayName"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("importSessionID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("inferredTimeZoneOffset"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("lastUploadAttemptDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("lastViewedDate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("libraryScopeAssetContributorsToUpdate"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("locationHash"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("mediaMetadata"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("montage"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("objectSaliencyRectsData"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalAssetsUUID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("originalFilename"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("pendingPlayCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("pendingShareCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("pendingViewCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("photoStreamTagId"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("placeAnnotationData"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("playCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("ptpTrashedState"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("publicGlobalUUID"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("reverseLocationData"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("reverseLocationDataIsValid"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sceneAnalysisIsFromPreview"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sceneAnalysisTimestamp"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sceneAnalysisVersion"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("shareCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("shareOriginator"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("shareType"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("shiftedLocationData"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("shiftedLocationIsValid"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sourceAssetForDuplicationIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sourceAssetForDuplicationScopeIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("syndicationHistory"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("syndicationIdentifier"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("uploadAttempts"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("variationSuggestionStates"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("viewCount"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("asset"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("assetDescription"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("personReferences"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sceneClassifications"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("sceneprint"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("temporalSceneClassifications"), 0);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("unmanagedAdjustment"), 0);
  return v3;
}

+ (id)_assetDescriptionMergePropertyMap
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("longDescription"), 2);
  objc_msgSend(a1, "_addPropertyToActionMap:name:action:", v3, CFSTR("assetAttributes"), 0);
  return v3;
}

+ (void)_addPropertyToActionMap:(id)a3 name:(id)a4 action:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateMergeModelProperties.m"), 921, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v10 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLDuplicateMergeModelProperties.m"), 922, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

    v10 = 0;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to add merge property %@ multiple times"), v9);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("DuplicateMergePropertyValidation"), objc_claimAutoreleasedReturnValue(), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, v9);

}

@end
