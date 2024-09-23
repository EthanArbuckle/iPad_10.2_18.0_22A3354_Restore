@implementation PXPhotosDataSourceChange

- (PXPhotosDataSourceChange)initWithIncrementalChanges:(id)a3 assetCollectionChangeDetails:(id)a4 sectionsWithKeyAssetChanges:(id)a5 previousCollectionsCount:(int64_t)a6 assetCollectionToSectionCache:(id)a7 originatingPhotoLibraryChange:(id)a8 fromIdentifier:(int64_t)a9 toIdentifier:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  PXPhotosDataSourceChange *v20;
  PXPhotosDataSourceChange *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  PXSectionedDataSourceChangeDetails *sectionedDataSourceChangeDetails;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v29 = a3;
  v17 = a4;
  v28 = a5;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PXPhotosDataSourceChange;
  v20 = -[PXPhotosDataSourceChange init](&v34, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_previousCollectionsCount = a6;
    objc_storeStrong((id *)&v20->_collectionListChangeDetails, a3);
    objc_storeStrong((id *)&v21->_assetCollectionChangeDetails, a4);
    objc_storeStrong((id *)&v21->_assetCollectionToSectionCache, a7);
    objc_storeWeak((id *)&v21->_originatingPhotoLibraryChange, v19);
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:originatingChange:", v29, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __225__PXPhotosDataSourceChange_initWithIncrementalChanges_assetCollectionChangeDetails_sectionsWithKeyAssetChanges_previousCollectionsCount_assetCollectionToSectionCache_originatingPhotoLibraryChange_fromIdentifier_toIdentifier___block_invoke;
    v30[3] = &unk_1E5123520;
    v31 = v18;
    v32 = v23;
    v33 = v19;
    v24 = v23;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v30);
    v25 = objc_msgSend(objc_alloc((Class)off_1E50B4A18), "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a9, a10, v22, v24, 0);
    sectionedDataSourceChangeDetails = v21->_sectionedDataSourceChangeDetails;
    v21->_sectionedDataSourceChangeDetails = (PXSectionedDataSourceChangeDetails *)v25;

    objc_storeStrong((id *)&v21->_sectionsWithKeyAssetChanges, a5);
  }

  return v21;
}

void __225__PXPhotosDataSourceChange_initWithIncrementalChanges_assetCollectionChangeDetails_sectionsWithKeyAssetChanges_previousCollectionsCount_assetCollectionToSectionCache_originatingPhotoLibraryChange_fromIdentifier_toIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:originatingChange:", v6, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);
}

- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails
{
  return (PXSectionedDataSourceChangeDetails *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originatingPhotoLibraryChange);
  objc_storeStrong((id *)&self->_sectionsWithKeyAssetChanges, 0);
  objc_storeStrong((id *)&self->_sectionedDataSourceChangeDetails, 0);
  objc_storeStrong((id *)&self->_favoriteChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_contentChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_assetCollectionChangeDetails, 0);
  objc_storeStrong((id *)&self->_collectionListChangeDetails, 0);
  objc_storeStrong((id *)&self->_assetCollectionToSectionCache, 0);
}

- (PXPhotosDataSourceChange)initWithFromIdentifier:(int64_t)a3 toIdentifier:(int64_t)a4
{
  PXPhotosDataSourceChange *v6;
  PXPhotosDataSourceChange *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PXSectionedDataSourceChangeDetails *sectionedDataSourceChangeDetails;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDataSourceChange;
  v6 = -[PXPhotosDataSourceChange init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_prepared = 1;
    v8 = objc_alloc((Class)off_1E50B4A18);
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a3, a4, v9, 0, 0);
    sectionedDataSourceChangeDetails = v7->_sectionedDataSourceChangeDetails;
    v7->_sectionedDataSourceChangeDetails = (PXSectionedDataSourceChangeDetails *)v10;

  }
  return v7;
}

- (BOOL)hasIncrementalChanges
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return *(_OWORD *)&self->_deletedSections != 0
      || self->_changedSections
      || self->_deletedIndexPaths
      || self->_insertedIndexPaths
      || self->_changedIndexPaths
      || self->_changesAreNoOp;
}

- (NSIndexSet)deletedSections
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_deletedSections;
}

- (NSIndexSet)insertedSections
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_insertedSections;
}

- (NSIndexSet)changedSections
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_changedSections;
}

- (NSArray)deletedIndexPaths
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_deletedIndexPaths;
}

- (NSArray)insertedIndexPaths
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_insertedIndexPaths;
}

- (NSArray)changedIndexPaths
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_changedIndexPaths;
}

- (NSArray)contentChangedIndexPaths
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_contentChangedIndexPaths;
}

- (NSArray)favoriteChangedIndexPaths
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_favoriteChangedIndexPaths;
}

- (BOOL)changesAreNoOp
{
  -[PXPhotosDataSourceChange prepareIfNeeded](self, "prepareIfNeeded");
  return self->_changesAreNoOp;
}

- (id)description
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDataSourceChange;
  -[PXPhotosDataSourceChange description](&v24, sel_description);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[PXPhotosDataSourceChange hasIncrementalChanges](self, "hasIncrementalChanges");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v20 = v4;
  -[PXPhotosDataSourceChange deletedSections](self, "deletedSections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v22, "count");
  -[PXPhotosDataSourceChange insertedSections](self, "insertedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "count");
  -[PXPhotosDataSourceChange changedSections](self, "changedSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[PXPhotosDataSourceChange changedIndexPaths](self, "changedIndexPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PXPhotosDataSourceChange contentChangedIndexPaths](self, "contentChangedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR(" hasIncremental:%@ sections:(%lu,%lu,%lu) indexPaths:(%lu,%lu,%lu,%lu) (del,ins,change,contentChange)"), v20, v19, v18, v7, v9, v11, v13, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)prepareIfNeeded
{
  PXPhotosDataSourceChange *v3;
  PHFetchResultChangeDetails *collectionListChangeDetails;
  void *v5;
  BOOL v6;
  PXPhotosDataSourceChange *obj;

  if (!self->_prepared)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self->_prepared)
    {
LABEL_9:
      objc_sync_exit(obj);

      return;
    }
    v3 = obj;
    collectionListChangeDetails = obj->_collectionListChangeDetails;
    if (!collectionListChangeDetails)
    {
      if (!-[NSDictionary count](obj->_assetCollectionChangeDetails, "count"))
      {
LABEL_8:
        self->_prepared = 1;
        goto LABEL_9;
      }
      v3 = obj;
      collectionListChangeDetails = obj->_collectionListChangeDetails;
    }
    -[NSDictionary allValues](v3->_assetCollectionChangeDetails, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXPhotosDataSourceChange _shouldPerformFullReloadForCollectionListChangeNotifications:collectionChangeNotifications:](obj, "_shouldPerformFullReloadForCollectionListChangeNotifications:collectionChangeNotifications:", collectionListChangeDetails, v5);

    if (!v6)
      -[PXPhotosDataSourceChange _prepareIncrementalDetails](obj, "_prepareIncrementalDetails");
    goto LABEL_8;
  }
}

- (void)_prepareIncrementalDetails
{
  PHFetchResultChangeDetails **p_collectionListChangeDetails;
  void *v4;
  void *v5;
  int64_t previousCollectionsCount;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSDictionary *assetCollectionChangeDetails;
  BOOL v11;
  NSUInteger v12;
  NSObject *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  _QWORD v19[10];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  _BYTE v46[20];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  p_collectionListChangeDetails = &self->_collectionListChangeDetails;
  -[PHFetchResultChangeDetails removedIndexes](self->_collectionListChangeDetails, "removedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails insertedIndexes](*p_collectionListChangeDetails, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResultChangeDetails changedIndexes](*p_collectionListChangeDetails, "changedIndexes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  previousCollectionsCount = self->_previousCollectionsCount;
  v7 = objc_msgSend(v5, "count") + previousCollectionsCount;
  v8 = v7 - objc_msgSend(v4, "count");
  v9 = -[NSDictionary count](self->_assetCollectionToSectionCache, "count");
  if (v8 == v9)
  {
    objc_storeStrong((id *)&self->_deletedSections, v4);
    objc_storeStrong((id *)&self->_insertedSections, v5);
    objc_storeStrong((id *)&self->_changedSections, obj);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__84114;
    *(_QWORD *)v46 = __Block_byref_object_dispose__84115;
    *(_QWORD *)&v46[8] = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__84114;
    v42 = __Block_byref_object_dispose__84115;
    v43 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__84114;
    v36 = __Block_byref_object_dispose__84115;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__84114;
    v30 = __Block_byref_object_dispose__84115;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__84114;
    v24 = __Block_byref_object_dispose__84115;
    v25 = 0;
    assetCollectionChangeDetails = self->_assetCollectionChangeDetails;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke;
    v19[3] = &unk_1E5123570;
    v19[4] = self;
    v19[5] = buf;
    v19[6] = &v38;
    v19[7] = &v32;
    v19[8] = &v26;
    v19[9] = &v20;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetCollectionChangeDetails, "enumerateKeysAndObjectsUsingBlock:", v19);
    objc_storeStrong((id *)&self->_deletedIndexPaths, *(id *)(*(_QWORD *)&buf[8] + 40));
    objc_storeStrong((id *)&self->_insertedIndexPaths, (id)v39[5]);
    objc_storeStrong((id *)&self->_changedIndexPaths, (id)v33[5]);
    objc_storeStrong((id *)&self->_contentChangedIndexPaths, (id)v27[5]);
    objc_storeStrong((id *)&self->_favoriteChangedIndexPaths, (id)v21[5]);
    v11 = !-[NSIndexSet count](self->_deletedSections, "count")
       && !-[NSIndexSet count](self->_insertedSections, "count")
       && !-[NSIndexSet count](self->_changedSections, "count")
       && !-[NSArray count](self->_deletedIndexPaths, "count")
       && !-[NSArray count](self->_insertedIndexPaths, "count")
       && !-[NSArray count](self->_changedIndexPaths, "count")
       && !-[NSArray count](self->_contentChangedIndexPaths, "count")
       && -[NSArray count](self->_favoriteChangedIndexPaths, "count") == 0;
    self->_changesAreNoOp = v11;
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v12 = v9;
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = self->_previousCollectionsCount;
      v15 = objc_msgSend(v5, "count");
      v16 = objc_msgSend(v4, "count");
      -[NSDictionary allKeys](self->_assetCollectionToSectionCache, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      v45 = (uint64_t (*)(uint64_t, uint64_t))v15;
      *(_WORD *)v46 = 2048;
      *(_QWORD *)&v46[2] = v16;
      *(_WORD *)&v46[10] = 2112;
      *(_QWORD *)&v46[12] = v17;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "The new collection count (%lu) doesn't match the expected count (%lu + %lu - %lu). Collection: %@", buf, 0x34u);

    }
  }

}

- (BOOL)_shouldPerformFullReloadForCollectionListChangeNotifications:(id)a3 collectionChangeNotifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "insertedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v5, "removedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!objc_msgSend(v5, "hasIncrementalChanges"))
  {
    v11 = 1;
    goto LABEL_20;
  }
  v11 = 1;
  if ((objc_msgSend(v5, "hasMoves") & 1) == 0 && v10 + v8 <= 20)
  {
LABEL_5:
    v25 = v6;
    v26 = v5;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "insertedIndexes", v25, v26, (_QWORD)v27);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");
          objc_msgSend(v18, "removedIndexes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (!objc_msgSend(v18, "hasIncrementalChanges"))
          {
            v11 = 1;
            goto LABEL_19;
          }
          v23 = objc_msgSend(v18, "hasMoves");
          v11 = 1;
          if ((v23 & 1) != 0)
            goto LABEL_19;
          v15 += v20 + v22;
          if (v15 > 100)
            goto LABEL_19;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v11 = 0;
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }
LABEL_19:

    v6 = v25;
    v5 = v26;
  }
LABEL_20:

  return v11;
}

- (BOOL)affectsSectionsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  void *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  length = a3.length;
  location = a3.location;
  v64 = *MEMORY[0x1E0C80C00];
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSourceChange.m"), 333, CFSTR("Must have a valid location"));

    if (length)
      goto LABEL_3;
LABEL_28:
    LOBYTE(v36) = 0;
    return v36;
  }
  if (!a3.length)
    goto LABEL_28;
LABEL_3:
  if (length == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSourceChange.m"), 334, CFSTR("Must have a valid length"));

  }
  -[PXPhotosDataSourceChange deletedSections](self, "deletedSections");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceChange insertedSections](self, "insertedSections");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceChange changedSections](self, "changedSections");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "px_section"));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * j), "px_section"));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[PXPhotosDataSourceChange changedIndexPaths](self, "changedIndexPaths");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v50 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v19, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "px_section"));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v22);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", location, length);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addIndex:", objc_msgSend(v25, "lastIndex") + 1);
  objc_msgSend(v25, "px_indexSetAdjustedForDeletions:", v48);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "px_indexSetAdjustedForInsertions:", v47);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "px_coveringRange");
  v28 = v27;
  v29 = objc_msgSend(v45, "px_coveringRange");
  v40 = v30;
  v41 = v29;
  v31 = objc_msgSend(v44, "px_coveringRange");
  v33 = v32;
  v43 = objc_msgSend(v48, "intersectsIndexesInRange:", v26, v28);
  v42 = objc_msgSend(v7, "intersectsIndexesInRange:", v26, v28);
  v34 = objc_msgSend(v47, "intersectsIndexesInRange:", v41, v40);
  v35 = objc_msgSend(v19, "intersectsIndexesInRange:", v31, v33);
  LODWORD(v26) = objc_msgSend(v46, "intersectsIndexesInRange:", v31, v33);
  v36 = v43 | v42 | v34 | v35 | v26 | objc_msgSend(v19, "intersectsIndexesInRange:", v31, v33);

  return v36;
}

- (id)indexPathAfterApplyingIncrementalChangesToIndexPath:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  if (-[PXPhotosDataSourceChange hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    if (v6)
      goto LABEL_3;
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSourceChange.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self hasIncrementalChanges] == YES"));

  if (!v6)
    goto LABEL_12;
LABEL_3:
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__84114;
  v31 = __Block_byref_object_dispose__84115;
  v32 = 0;
  -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
  {
    -[PXPhotosDataSourceChange deletedSections](self, "deletedSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v6, "px_section"));

    if ((v9 & 1) != 0)
      goto LABEL_10;
    objc_storeStrong(v28 + 5, a3);
    -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v28[5];
      -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_alteredIndexPathAfterDeletingItemsAtIndexPaths:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v28[5];
      v28[5] = (id)v13;

    }
    -[PXPhotosDataSourceChange deletedSections](self, "deletedSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke;
    v26[3] = &unk_1E5123598;
    v26[4] = &v27;
    objc_msgSend(v15, "enumerateIndexesWithOptions:usingBlock:", 2, v26);

    -[PXPhotosDataSourceChange insertedSections](self, "insertedSections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke_2;
    v25[3] = &unk_1E5123598;
    v25[4] = &v27;
    objc_msgSend(v17, "enumerateIndexesUsingBlock:", v25);

    -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_10;
    v19 = v28[5];
    -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_alteredIndexPathAfterInsertingItemsAtIndexPaths:", v7);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v28[5];
    v28[5] = (id)v20;

  }
LABEL_10:
  v22 = v28[5];
  _Block_object_dispose(&v27, 8);

LABEL_13:
  return v22;
}

- (id)indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  if (-[PXPhotosDataSourceChange hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    if (v6)
      goto LABEL_3;
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSourceChange.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self hasIncrementalChanges] == YES"));

  if (!v6)
    goto LABEL_12;
LABEL_3:
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__84114;
  v31 = __Block_byref_object_dispose__84115;
  v32 = 0;
  -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", v6) & 1) == 0)
  {
    -[PXPhotosDataSourceChange insertedSections](self, "insertedSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", objc_msgSend(v6, "px_section"));

    if ((v9 & 1) != 0)
      goto LABEL_10;
    objc_storeStrong(v28 + 5, a3);
    -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v28[5];
      -[PXPhotosDataSourceChange insertedIndexPaths](self, "insertedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_alteredIndexPathAfterDeletingItemsAtIndexPaths:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v28[5];
      v28[5] = (id)v13;

    }
    -[PXPhotosDataSourceChange insertedSections](self, "insertedSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke;
    v26[3] = &unk_1E5123598;
    v26[4] = &v27;
    objc_msgSend(v15, "enumerateIndexesWithOptions:usingBlock:", 2, v26);

    -[PXPhotosDataSourceChange deletedSections](self, "deletedSections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v16;
    v25[1] = 3221225472;
    v25[2] = __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke_2;
    v25[3] = &unk_1E5123598;
    v25[4] = &v27;
    objc_msgSend(v17, "enumerateIndexesUsingBlock:", v25);

    -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_10;
    v19 = v28[5];
    -[PXPhotosDataSourceChange deletedIndexPaths](self, "deletedIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_alteredIndexPathAfterInsertingItemsAtIndexPaths:", v7);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v28[5];
    v28[5] = (id)v20;

  }
LABEL_10:
  v22 = v28[5];
  _Block_object_dispose(&v27, 8);

LABEL_13:
  return v22;
}

- (NSIndexSet)sectionsWithKeyAssetChanges
{
  return self->_sectionsWithKeyAssetChanges;
}

- (PHChange)originatingPhotoLibraryChange
{
  return (PHChange *)objc_loadWeakRetained((id *)&self->_originatingPhotoLibraryChange);
}

void __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") > a2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") - 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __89__PXPhotosDataSourceChange_indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") >= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") + 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") > a2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") - 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __80__PXPhotosDataSourceChange_indexPathAfterApplyingIncrementalChangesToIndexPath___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") >= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_item"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "px_section") + 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  id v67;
  id v68;

  v63 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", v63);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      v10 = *(void **)(a1[4] + 24);
      v11 = v9;
      if (v10)
      {
        objc_msgSend(v10, "fetchResultBeforeChanges");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v12, "indexOfObject:", v63);

      }
      objc_msgSend(v5, "removedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v14 = *(_QWORD *)(a1[5] + 8);
        v15 = *(void **)(v14 + 40);
        if (v15)
        {
          v16 = v15;
          v17 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v16;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(a1[5] + 8);
          v17 = *(void **)(v19 + 40);
          *(_QWORD *)(v19 + 40) = v18;
        }

        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v13, v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObjectsFromArray:", v20);

      }
      objc_msgSend(v5, "insertedIndexes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        v22 = *(_QWORD *)(a1[6] + 8);
        v23 = *(void **)(v22 + 40);
        if (v23)
        {
          v24 = v23;
          v25 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = v24;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = *(_QWORD *)(a1[6] + 8);
          v25 = *(void **)(v27 + 40);
          *(_QWORD *)(v27 + 40) = v26;
        }

        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v21, v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObjectsFromArray:", v28);

      }
      objc_msgSend(v5, "changedIndexes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "count"))
      {
        v30 = *(_QWORD *)(a1[7] + 8);
        v31 = *(void **)(v30 + 40);
        if (v31)
        {
          v32 = v31;
          v33 = *(void **)(v30 + 40);
          *(_QWORD *)(v30 + 40) = v32;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(a1[7] + 8);
          v33 = *(void **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;
        }

        objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v29, v9);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObjectsFromArray:");
        objc_msgSend(v5, "fetchResultAfterChanges");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke_2;
        v64[3] = &unk_1E5123548;
        v39 = v36;
        v40 = a1[4];
        v61 = v39;
        v65 = v39;
        v66 = v40;
        v41 = v37;
        v67 = v41;
        v42 = v38;
        v68 = v42;
        objc_msgSend(v29, "enumerateIndexesUsingBlock:", v64);
        if (objc_msgSend(v41, "count"))
        {
          v60 = v21;
          v43 = *(_QWORD *)(a1[8] + 8);
          v44 = *(void **)(v43 + 40);
          v45 = v13;
          if (v44)
          {
            v46 = v44;
            v47 = *(void **)(v43 + 40);
            *(_QWORD *)(v43 + 40) = v46;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v48 = objc_claimAutoreleasedReturnValue();
            v49 = *(_QWORD *)(a1[8] + 8);
            v47 = *(void **)(v49 + 40);
            *(_QWORD *)(v49 + 40) = v48;
          }

          v50 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v41, v9);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObjectsFromArray:", v51);

          v13 = v45;
          v21 = v60;
        }
        if (objc_msgSend(v42, "count", v60))
        {
          v52 = *(_QWORD *)(a1[9] + 8);
          v53 = *(void **)(v52 + 40);
          if (v53)
          {
            v54 = v53;
            v55 = *(void **)(v52 + 40);
            *(_QWORD *)(v52 + 40) = v54;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = *(_QWORD *)(a1[9] + 8);
            v55 = *(void **)(v57 + 40);
            *(_QWORD *)(v57 + 40) = v56;
          }

          v58 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", v42, v9);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObjectsFromArray:", v59);

        }
      }

    }
  }

}

void __54__PXPhotosDataSourceChange__prepareIncrementalDetails__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  int v5;
  id v6;
  int v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectIDAtIndex:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 136));
  v5 = objc_msgSend(WeakRetained, "contentOrThumbnailChangedForPHAssetOID:", v8);

  if (v5)
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a2);
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 136));
  v7 = objc_msgSend(v6, "favoriteStateChangedForPHAssetOID:", v8);

  if (v7)
    objc_msgSend(*(id *)(a1 + 56), "addIndex:", a2);

}

@end
